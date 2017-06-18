//
//  MyTVViewController.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyTVViewController.h"
#import "MyTVTableViewCell.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "OriNetworking.h"
#import "WBAlertController.h"
#import "MacroMy.h"
@interface MyTVViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation MyTVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getData];
    self.dataList = [NSMutableArray array];
    
    
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];



}

- (void)getData{
    NSDictionary *dic = @{@"start": @"0",@"length":@"10"};
    
    [[OrientalHttpManager sharedInstance] requestWithTarget:showTvBoxList params:dic success:^(NSURLSessionDataTask *task, id responseObject, BOOL success) {
        if (success) {
            self.dataList = [NSMutableArray arrayWithArray:[responseObject objectForKey:@"result"]];
            [self.listTableView reloadData];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc]init];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.separatorColor = UIColorMake(204, 204, 204);
    }
    
    return _listTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    MyTVTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[MyTVTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"head"];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.TVNameLabel.text = [[self.dataList objectAtIndex:indexPath.row]objectForKey:@"box_location"];
    cell.linkState.text = [[self.dataList objectAtIndex:indexPath.row]objectForKey:@"box_Status"];

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = @{@"box_id": [[self.dataList objectAtIndex:indexPath.row] objectForKey:@"box_id"]};
    [[OrientalHttpManager sharedInstance] requestWithTarget:delTvBox params:dic success:^(NSURLSessionDataTask *task, id responseObject, BOOL success) {
        if (success) {
//            self.dataList = [NSMutableArray arrayWithArray:[responseObject objectForKey:@"result"]];
            
            [self.listTableView reloadData];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    [self.dataList removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
