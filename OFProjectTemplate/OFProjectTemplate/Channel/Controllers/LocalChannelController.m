//
//  LocalChannelController.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "LocalChannelController.h"
#import "LocalChannelTableViewModel.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"
#import <ReactiveCocoa.h>
#import "OShowHud.h"
#import "OBannerView.h"

@interface LocalChannelController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LocalChannelTableViewModel *tableViewModel;
@property (nonatomic, strong) OBannerView *banner;

@end

@implementation LocalChannelController

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
        [_tableView registerClass:[LocalChannelCell class] forCellReuseIdentifier:LocalChannelCellIdentifier];
        _tableView.tableHeaderView = self.banner;
    }
    return _tableView;
}

- (LocalChannelTableViewModel *)tableViewModel {
    if (!_tableViewModel) {
        _tableViewModel = [[LocalChannelTableViewModel alloc] init];
    }
    return _tableViewModel;
}

- (OBannerView *)banner {
    if (!_banner) {
        _banner = [[OBannerView alloc] initWithChangeModel:ChangeModeFade];
        _banner.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
        _banner.imageClickBlock = ^(NSInteger index) {
            [OShowHud showErrorHudWith:[NSString stringWithFormat:@"点击了第%ld张图片",index] animated:YES];
        };
    }
    return _banner;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [OBannerView clearDiskCache];
}

@end
