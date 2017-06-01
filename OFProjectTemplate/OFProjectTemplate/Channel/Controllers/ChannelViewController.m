//
//  ChannelViewController.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "ChannelViewController.h"
#import <Masonry.h>
#import <ReactiveCocoa.h>
#import "OFUIkitMacro.h"
#import "DetailsViewController.h"
#import "ChannelTabViewModel.h"

@interface ChannelViewController ()
@property (nonatomic, strong) ChannelTabViewModel *viewModel;
@property (nonatomic, strong) TYTabButtonPagerController *pagerController;
@end

@implementation ChannelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeNavBarBtns];
    [self addTabContainerController];
}

- (void)customizeNavBarBtns {
    
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
        _pagerController.progressColor = [UIColor orangeColor];
        _pagerController.normalTextColor = HexColor(0x969696);
        _pagerController.selectedTextColor = [UIColor orangeColor];
        _pagerController.normalTextFont = OFFont(15);
        _pagerController.selectedTextFont = OFFont(17);
        _pagerController.cellWidth = SCREEN_WIDTH/4.f;
    }
    return _pagerController;
}

- (ChannelTabViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [ChannelTabViewModel new];
    }
    return _viewModel;
}

@end
