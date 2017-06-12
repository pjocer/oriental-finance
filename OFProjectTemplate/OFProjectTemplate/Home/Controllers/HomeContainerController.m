//
//  HomeContainerController.m
//  OFClient
//
//  Created by 吉冠虎 on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "HomeContainerController.h"
#import <ReactiveCocoa.h>
#import <Masonry.h>
#import "HomeTabContainerViewModel.h"
#import "OFUIkitMacro.h"
#import "ODQTool.h"
#import "OShowHud.h"
#import "MessageViewController.h"
#import "PlayHistoryVC.h"
#import "ConnectionEquipmentVC.h"

@interface HomeContainerController ()
@property (nonatomic, strong)  HomeTabContainerViewModel* viewModel;
@property (nonatomic, strong) TYTabButtonPagerController *pagerController;
@end

@implementation HomeContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    [self addPagerController];
}

- (void)addPagerController {
    self.pagerController.view.frame = self.view.bounds;
    self.pagerController.dataSource = self.viewModel;
    [self addChildViewController:self.pagerController];
    [self.view addSubview:self.pagerController.view];
}

- (void)initNavigationBar {
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *left = [QMUINavigationButton barButtonItemWithImage:OriImageNamed(@"home_bindingDQ") position:QMUINavigationButtonPositionLeft target:self action:@selector(pushConnectionController)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem *history = [QMUINavigationButton barButtonItemWithImage:OriImageNamed(@"home_history") position:QMUINavigationButtonPositionRight target:self action:@selector(pushHistory)];
    UIBarButtonItem *message = [QMUINavigationButton barButtonItemWithImage:OriImageNamed(@"home_xiaoxi") position:QMUINavigationButtonPositionNone target:self action:@selector(pushMessage)];
    history.imageInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    self.navigationItem.rightBarButtonItems = @[message, history];
    
}

- (void)pushConnectionController {
    ConnectionEquipmentVC *vc= [[ConnectionEquipmentVC alloc]initWithTitle:@"未连接" navBarBtns:NavBarBtnBack];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:navc animated:YES completion:^{
        
    }];
}

- (void)pushMessage {
    MessageViewController *setup = [[MessageViewController alloc]initWithTitle:@"消息" navBarBtns:NavBarBtnBack];
    setup.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setup animated:YES];
}

- (void)pushHistory {
    PlayHistoryVC *setup = [[PlayHistoryVC alloc]initWithTitle:@"播放历史" navBarBtns:NavBarBtnBack];
    setup.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setup animated:YES];
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
        _pagerController.normalTextFont = UIFontMake(15);
        _pagerController.selectedTextFont = UIFontMake(17);
        _pagerController.cellWidth = SCREEN_WIDTH/5.f;
    }
    return _pagerController;
}

- (HomeTabContainerViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [HomeTabContainerViewModel new];
    }
    return _viewModel;
}

@end
