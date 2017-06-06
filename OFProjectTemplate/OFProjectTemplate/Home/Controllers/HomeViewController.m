//
//  HomeViewController.m
//  OFClient
//
//  Created by 吉冠虎 on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "HomeViewController.h"
#import <ReactiveCocoa.h>
#import <Masonry.h>
#import "HomeTabContainerViewModel.h"
#import "OFUIkitMacro.h"
#import "ODQTool.h"
#import "OShowHud.h"

@interface HomeViewController ()
@property (nonatomic, strong)  HomeTabContainerViewModel* viewModel;
@property (nonatomic, strong) TYTabButtonPagerController *pagerController;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.pagerController.view.frame = self.view.bounds;
    [self addChildViewController:self.pagerController];
    [self.view addSubview:self.pagerController.view];
}

- (void)initNavigationBar {
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -5;
    self.navigationItem.leftBarButtonItems = @[negativeSeperator, buttonItem];
    [self.backBtn setImage:[UIImage imageNamed:@"home_bindingDQ"] forState:UIControlStateNormal];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 25, 25);
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [btn setImage:[UIImage imageNamed:@"home_xiaoxi"] forState:UIControlStateNormal];
    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSeperator2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator2.width = -5;
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 0, 25, 25);
    [btn2 setImage:[UIImage imageNamed:@"home_history"] forState:UIControlStateNormal];
    btn2.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UIBarButtonItem *buttonItem3 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    UIBarButtonItem *negativeSeperator3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator3.width = -5;
    self.navigationItem.rightBarButtonItems = @[negativeSeperator2, buttonItem2, negativeSeperator3, buttonItem3];
    
}
- (void)setup {
    if (IS_SIMULATOR) {
        [OShowHud showErrorHudWith:@"模拟器不支持" animated:YES];
    } else {
        ODQTool *dq = [[ODQTool alloc]initWithTitle:@"二维码扫描" navBarBtns:NavBarBtnBack];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:dq];
        [self presentViewController:navc animated:YES completion:^{
            
        }];
    }
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(0, 0, 32, 32);
        _backBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_backBtn addTarget:self action:@selector(setup) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
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
