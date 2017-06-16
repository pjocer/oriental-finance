//
//  HDChannelViewController.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "HDChannelViewController.h"
#import "LocalChannelTableViewModel.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"
#import <ReactiveCocoa.h>
#import "OShowHud.h"
#import "ChanneldetailsVC.h"

@interface HDChannelViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LocalChannelTableViewModel *tableViewModel;


@end

@implementation HDChannelViewController

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
        [_tableView registerClass:[LocalChannelCell class] forCellReuseIdentifier:LocalChannelCellIdentifier];
    }
    return _tableView;
}

- (LocalChannelTableViewModel *)tableViewModel {
    if (!_tableViewModel) {
        _tableViewModel = [[LocalChannelTableViewModel alloc] init];
    }
    return _tableViewModel;
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
