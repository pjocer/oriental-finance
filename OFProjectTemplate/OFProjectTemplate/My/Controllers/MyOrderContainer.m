//
//  MyOrderContainer.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyOrderContainer.h"
#import "OFUIkitMacro.h"
#import "MyOrderContainerViewModel.h"

@interface MyOrderContainer ()
@property (nonatomic, strong)  MyOrderContainerViewModel* viewModel;
@property (nonatomic, strong) TYTabButtonPagerController *pagerController;
@end

@implementation MyOrderContainer

- (instancetype)initWithControllerType:(OrderListType)type {
    if (self = [super initWithTitle:@"我的订单"]) {
        self.type = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DEFAULT_BG_COLOR;
    self.pagerController.view.frame = self.view.bounds;
    self.pagerController.dataSource = self.viewModel;
    [self addChildViewController:self.pagerController];
    [self.view addSubview:self.pagerController.view];
    [self.pagerController moveToControllerAtIndex:self.type animated:YES];
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

- (MyOrderContainerViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [MyOrderContainerViewModel new];
    }
    return _viewModel;
}

@end
