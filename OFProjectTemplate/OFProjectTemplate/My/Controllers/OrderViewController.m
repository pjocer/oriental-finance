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
#import <Masonry.h>

@interface OrderViewController ()
@property (nonatomic, assign) OrderListType type;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) OrderTableViewModel *tableViewModel;
@end

@implementation OrderViewController

- (instancetype)initWithControllerType:(OrderListType)type {
    if (self = [super initWithTitle:nil navBarBtns:NavBarBtnNone]) {
        self.type = type;
        self.tableViewModel = [[OrderTableViewModel alloc] initWithType:self.type tableView:self.tableView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DEFAULT_BG_COLOR;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [RACObserve(self.tableViewModel, dataSource) subscribeNext:^(id x) {
        
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
        _tableView.backgroundColor = UIColorClear;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_tableView.mj_header endRefreshing];
            });
        }];
    }
    return _tableView;
}

@end
