//
//  AppointmentController.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/11.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "AppointmentController.h"
#import "HomeTableViewModel.h"
#import <Masonry.h>
#import "HotTableViewCell.h"
#import "OFUIkitMacro.h"
#import <ReactiveCocoa.h>
#import "OShowHud.h"


@interface AppointmentController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeTableViewModel *tableViewModel;;
@end

@implementation AppointmentController

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
        [_tableView registerClass:[HotTableViewCell class] forCellReuseIdentifier:HotTableViewCellIdentifier];
    }
    return _tableView;
}

- (HomeTableViewModel  *)tableViewModel {
    if (!_tableViewModel) {
        _tableViewModel = [[HomeTableViewModel  alloc] initWithType:HomeControllerTypeAppointment];
        [_tableViewModel setDidSelectedBlock:^(TableViewSelectType type, id data) {
            if (type == TableViewSelectTypeHot) {
                [OShowHud showErrorHudWith:@"item" animated:YES];
            } else if (type == TableViewSelectTypeRefresh) {
                [OShowHud showErrorHudWith:@"refresh" animated:YES];
            }
        }];
    }
    return _tableViewModel;
}

@end
