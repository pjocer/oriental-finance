//
//  OrderViewController.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/16.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderTableViewModel.h"
#import <MJRefresh.h>
@interface OrderViewController ()
@property (nonatomic, assign) OrderListType type;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) OrderTableViewModel *tableViewModel;
@end

@implementation OrderViewController

- (instancetype)initWithControllerType:(OrderListType)type {
    if (self = [super initWithTitle:nil navBarBtns:NavBarBtnNone]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
        }];
    }
    return _tableView;
}

- (OrderTableViewModel *)tableViewModel {
    if (!_tableViewModel) {
        _tableViewModel = [[OrderTableViewModel alloc] initWithType:self.type tableView:self.tableView];
    }
    return _tableViewModel;
}

@end
