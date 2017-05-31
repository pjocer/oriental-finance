//
//  HotPlayController.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "HotPlayController.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"
#import "OSearchView.h"
#import "HotTableViewModel.h"
#import "HotTableViewCell.h"
#import "DetailsViewController.h"
#import "OBannerView.h"
#import "OShowHud.h"

@interface HotPlayController ()
@property (nonatomic, strong) OSearchView *searchView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) OBannerView *banner;
@property (nonatomic, strong) HotTableViewModel *tableViewModel;
@end

@implementation HotPlayController

- (void)loadView {
    [super loadView];
    [self.view addSubview:self.searchView];
    [self.view addSubview:self.tableView];
    [self makeConstraints];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)makeConstraints {
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@50);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (OSearchView *)searchView {
    if (!_searchView) {
        _searchView = [OSearchView new];
    }
    return _searchView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self.tableViewModel;
        _tableView.dataSource = self.tableViewModel;
        _tableView.tableHeaderView = self.banner;
        [_tableView registerClass:[HotTableViewCell class] forCellReuseIdentifier:HotTableViewCellIdentifier];
    }
    return _tableView;
}

- (HotTableViewModel *)tableViewModel {
    if (!_tableViewModel) {
        _tableViewModel = [[HotTableViewModel alloc] init];
        WEAKSELF
        [_tableViewModel setDidSelectedBlock:^(HotTableViewSelectType type, id data) {
            STRONGSELF
            if (type == HotTableViewSelectTypeHot) {
                DetailsViewController *vc = [[DetailsViewController alloc] initWithTitle:@"详情" navBarBtns:NavBarBtnBack];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            } else if (type == HotTableViewSelectTypeUnknow) {
                
            }
        }];
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
