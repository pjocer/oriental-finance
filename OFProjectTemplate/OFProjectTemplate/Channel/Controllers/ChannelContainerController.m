//
//  ChannelViewController.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "ChannelContainerController.h"
#import <Masonry.h>
#import <ReactiveCocoa.h>
#import "OFUIkitMacro.h"
#import "DetailsViewController.h"
#import "ChannelContainerViewModel.h"
#import <QMUIKit.h>
#import "OSearchController.h"
#import "OShowHud.h"
#import "ODQTool.h"

@interface ChannelContainerController ()
@property (nonatomic, strong) ChannelContainerViewModel *viewModel;
@property (nonatomic, strong) TYTabButtonPagerController *pagerController;
@end

@implementation ChannelContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeNavBarBtns];
    [self addTabContainerController];
}

- (void)customizeNavBarBtns {
    UIBarButtonItem *code = [QMUINavigationButton barButtonItemWithImage:[ImageNamed(@"home_bindingDQ") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] position:QMUINavigationButtonPositionLeft target:self action:@selector(code)];
    UIBarButtonItem *search = [QMUINavigationButton barButtonItemWithImage:[ImageNamed(@"channel_search") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] position:QMUINavigationButtonPositionRight target:self action:@selector(search)];
    self.navigationItem.leftBarButtonItem = code;
    self.navigationItem.rightBarButtonItem = search;
}

- (void)code {
    if (IS_SIMULATOR) {
        [OShowHud showErrorHudWith:@"模拟器不支持" animated:YES];
    } else {
        ODQTool *dq = [[ODQTool alloc]initWithTitle:@"二维码扫描" navBarBtns:NavBarBtnBack];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:dq];
        [self presentViewController:navc animated:YES completion:^{
            
        }];
    }
}

- (void)search {
    OSearchController *controller = [[OSearchController alloc] initWithTitle:@"搜索" navBarBtns:NavBarBtnNone];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

- (void)addTabContainerController {
    self.pagerController.view.frame = self.view.bounds;
    [self addChildViewController:self.pagerController];
    [self.view addSubview:self.pagerController.view];
}

- (TYTabButtonPagerController *)pagerController {
    if (!_pagerController) {
        _pagerController = [TYTabButtonPagerController new];
        _pagerController.dataSource = self.viewModel;
        _pagerController.barStyle = TYPagerBarStyleProgressElasticView;
        _pagerController.cellSpacing = 0;
        _pagerController.progressColor = DEFAULT_TEXT_COLOR_SELECTED;
        _pagerController.normalTextColor = DEFAULT_TEXT_COLOR;
        _pagerController.selectedTextColor = DEFAULT_TEXT_COLOR_SELECTED;
        _pagerController.normalTextFont =UIFontMake(15);
        _pagerController.selectedTextFont = UIFontMake(17);
        _pagerController.cellWidth = SCREEN_WIDTH/4.f;
    }
    return _pagerController;
}

- (ChannelContainerViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [ChannelContainerViewModel new];
    }
    return _viewModel;
}

@end
