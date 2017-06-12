//
//  ProjectViewController.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ProjectViewController.h"
#import "HotTableViewModel.h"
#import "HomeChannelLiveCell.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"
#import <ReactiveCocoa.h>
#import "OShowHud.h"

@interface ProjectViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HotTableViewModel *tableViewModel;

@end

@implementation ProjectViewController

- (void)loadView {
    [super loadView];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    [self subscribe];
}

- (void)subscribe {
    [[self.tableViewModel rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)] subscribeNext:^(id x) {
        [OShowHud showErrorHudWith:@"123" animated:YES];
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self.tableViewModel;
        _tableView.dataSource = self.tableViewModel;
        [_tableView registerClass:[HomeChannelLiveCell class] forCellReuseIdentifier:HomeChannelLiveCellIdentifier];
    }
    return _tableView;
}

- (HotTableViewModel *)tableViewModel {
    if (!_tableViewModel) {
        _tableViewModel = [[HotTableViewModel alloc] initWithType:HomeControllerTypeTopic];
        [_tableViewModel setDidSelectedBlock:^(TableViewSelectType type, id data) {
            if (type == TableViewSelectTypeLiving) {
                [OShowHud showErrorHudWith:@"item" animated:YES];
            } else if (type == TableViewSelectTypeLivingHeader) {
                [OShowHud showErrorHudWith:@"header" animated:YES];
            }
        }];
    }
    return _tableViewModel;
}

@end
