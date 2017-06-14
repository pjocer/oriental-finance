//
//  TeleplayViewController.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "TeleplayViewController.h"
#import "HomeTableViewModel.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"
#import <ReactiveCocoa.h>
#import "OShowHud.h"
#import "HomeChannelLiveCell.h"

@interface TeleplayViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeTableViewModel *tableViewModel;;

@end

@implementation TeleplayViewController

- (void)loadView {
    [super loadView];
    [self startLoading];
    [[RACScheduler mainThreadScheduler] afterDelay:10 schedule:^{
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.equalTo(self.view);
        }];
        [self stopLoading];
        [self subscribe];
    }];
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

- (HomeTableViewModel  *)tableViewModel {
    if (!_tableViewModel) {
        _tableViewModel = [[HomeTableViewModel  alloc] initWithType:HomeControllerTypeTeleplay];
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
