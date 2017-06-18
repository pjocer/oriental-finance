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

@interface MyAddressVC ()<UITableViewDelegate, UITableViewDataSource, MyAddressDelegate>

@end

@implementation MyAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
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
    
    return 9;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    MyAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            if (indexPath.row ==0) {
                cell = [[MyAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid type:@"default"];
                cell.delegate = self;

            }else{
                cell = [[MyAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid type:@"asd"];
                cell.delegate = self;
            }
            
        }
       
    
    return cell;
}

-(void)MyAddressWithBtn:(UIButton *)btn {
    if (btn.tag == 101) {
        
    }else if (btn.tag == 102) {
        EditAddressVC *vc = [[EditAddressVC alloc]initWithTitle:@"添加收货地址" navBarBtns:NavBarBtnBack];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (btn.tag == 103) {
        
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
