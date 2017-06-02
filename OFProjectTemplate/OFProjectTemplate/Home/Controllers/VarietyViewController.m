//  VarietyViewController.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "VarietyViewController.h"
#import "LocalChannelTableViewModel.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"
#import <ReactiveCocoa.h>
#import "OShowHud.h"
#import "OBannerView.h"

@interface VarietyViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LocalChannelTableViewModel *tableViewModel;
@property (nonatomic, strong) OBannerView *banner;


@end

@implementation VarietyViewController

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
