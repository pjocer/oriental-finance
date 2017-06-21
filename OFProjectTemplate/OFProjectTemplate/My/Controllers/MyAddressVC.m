//
//  MyAddressVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyAddressVC.h"
#import "MyAddressCell.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "EditAddressVC.h"
#import "MacroMy.h"

@interface MyAddressVC ()<UITableViewDelegate, UITableViewDataSource, MyAddressDelegate>{
    NSMutableArray *datalist;
}

@end

@implementation MyAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    datalist = [NSMutableArray array];
    [self getData];
    
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)getData {
    NSDictionary *dic = @{@"start":@"0", @"length":@"10"};
    [[OrientalHttpManager sharedInstance] requestWithTarget:showMyAddr params:dic success:^(NSURLSessionDataTask *task, id responseObject, BOOL success) {
        if (success) {
            datalist = [responseObject objectForKey:@"result"];
            [self.listTableView reloadData];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
- (void)initNavigationBar {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 25, 25);
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [btn setImage:[UIImage imageNamed:@"home_xiaoxi"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(editAddress) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSeperator2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator2.width = -5;
    
    self.navigationItem.rightBarButtonItems = @[negativeSeperator2, buttonItem2];
    
}

- (void)editAddress {
    EditAddressVC *vc = [[EditAddressVC alloc]initWithTitle:@"添加收货地址" navBarBtns:NavBarBtnBack];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return datalist.count;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    MyAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[MyAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid type:[NSString stringWithFormat:@"%@",[[datalist objectAtIndex:indexPath.row] objectForKey:@"isdefault"]]];
        
        
    }
    cell.nameLabel.text = [[datalist objectAtIndex:indexPath.row] objectForKey:@"uname"];
    cell.phoneLabel.text = [[datalist objectAtIndex:indexPath.row] objectForKey:@"phone"];
    cell.provincesAddress.text = [[datalist objectAtIndex:indexPath.row] objectForKey:@"zonename"];
    cell.detailedAddress.text = [[datalist objectAtIndex:indexPath.row] objectForKey:@"addr"];
    
    cell.delegate = self;
    
    
    return cell;
}

-(void)MyAddressWithBtn:(UIButton *)btn {
    CGPoint point = btn.center;
    point = [self.listTableView convertPoint:point fromView:btn.superview];
    NSIndexPath* indexpath = [self.listTableView indexPathForRowAtPoint:point];
    NSLog(@"%@",[datalist objectAtIndex:indexpath.row]);
    if (btn.tag == 101) {
        NSDictionary *dic = @{@"id":[[datalist objectAtIndex:indexpath.row] objectForKey:@"id"],@"uname":[[datalist objectAtIndex:indexpath.row] objectForKey:@"uname"], @"phone":[[datalist objectAtIndex:indexpath.row] objectForKey:@"phone"], @"zonecode":[[datalist objectAtIndex:indexpath.row] objectForKey:@"zonecode"], @"zonename":[[datalist objectAtIndex:indexpath.row] objectForKey:@"zonename"],@"addr":[[datalist objectAtIndex:indexpath.row] objectForKey:@"addr"], @"isdefault":@"0"};
        [[OrientalHttpManager sharedInstance] requestWithTarget:editMyAddr params:dic success:^(NSURLSessionDataTask *task, id responseObject, BOOL success) {
            if (success) {
                
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    }else if (btn.tag == 102) {
        EditAddressVC *vc = [[EditAddressVC alloc]initWithTitle:@"添加收货地址" navBarBtns:NavBarBtnBack];
        vc.dataList = [NSDictionary dictionaryWithDictionary:[datalist objectAtIndex:indexpath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (btn.tag == 103) {
        NSDictionary *dic = @{@"id":[[datalist objectAtIndex:indexpath.row] objectForKey:@"id"]};
        [[OrientalHttpManager sharedInstance] requestWithTarget:delMyAddr params:dic success:^(NSURLSessionDataTask *task, id responseObject, BOOL success) {
            if (success) {
                
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    }
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    EditAddressVC *vc = [[EditAddressVC alloc]initWithTitle:@"添加收货地址" navBarBtns:NavBarBtnBack];
//    [self.navigationController pushViewController:vc animated:YES];
//
//}


- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc]init];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.separatorColor = UIColorMake(204, 204, 204);
        
    }
    
    return _listTableView;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
