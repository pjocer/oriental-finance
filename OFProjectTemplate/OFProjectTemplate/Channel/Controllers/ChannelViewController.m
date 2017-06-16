//
//  LocalChannelController.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ChannelViewController.h"
#import "ChannelTableViewModel.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"
#import <ReactiveCocoa.h>
#import "OShowHud.h"
#import "OBannerView.h"
#import "ChanneldetailsVC.h"

@interface ChannelViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) ChannelType type;
@property (nonatomic, strong) ChannelTableViewModel *tableViewModel;
@end

@implementation ChannelViewController

- (void)loadView {
    [super loadView];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    [self subscribe];
}

- (instancetype)initWithChannelType:(ChannelType)type {
    if (self = [super initWithTitle:nil navBarBtns:NavBarBtnNone]) {
        self.type = type;
    }
    return self;
}

- (void)subscribe {
    [[self.tableViewModel rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)] subscribeNext:^(id x) {
        ChanneldetailsVC *vc = [[ChanneldetailsVC alloc] initWithTitle:@"东方卫视" navBarBtns:NavBarBtnBack];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    [[self.tableViewModel rac_signalForSelector:@selector(playAction)] subscribeNext:^(id x) {
        [OShowHud showErrorHudWith:@"Play Action" animated:YES];
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self.tableViewModel;
        _tableView.dataSource = self.tableViewModel;
        [_tableView registerClass:[ChannelTableViewCell class] forCellReuseIdentifier:ChannelTableViewCellIdentifier];
    }
    return _tableView;
}

- (ChannelTableViewModel *)tableViewModel {
    if (!_tableViewModel) {
        _tableViewModel = [[ChannelTableViewModel alloc] init];
        _tableViewModel.type = self.type;
    }
    return _tableViewModel;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [OBannerView clearDiskCache];
}

@end
