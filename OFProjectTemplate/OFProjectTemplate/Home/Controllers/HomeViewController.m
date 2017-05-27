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
#import "DetailsViewController.h"
#import "HomeTabContainerViewModel.h"
#import "OFUIkitMacro.h"

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
//    UIScrollView *hotView = [[UIScrollView alloc] init];
//    hotView.contentSize = CGSizeMake(0, 1230);
//    [self.view addSubview:hotView];
//    
//    [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
//    }];
//    
//    
//    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shouye"]];
//    image.frame = CGRectMake(0, 0, self.view.frame.size.width, 1230);
//    image.userInteractionEnabled = YES;
//    [hotView addSubview:image];
//    
//     UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [image addGestureRecognizer:tapGR];
}

- (void)initNavigationBar {
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -5;
    self.navigationItem.leftBarButtonItems = @[negativeSeperator, buttonItem];
    [self.backBtn setImage:[UIImage imageNamed:@"erweim"] forState:UIControlStateNormal];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 32, 32);
    [btn setImage:[UIImage imageNamed:@"xiaoxi"] forState:UIControlStateNormal];
    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSeperator2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator2.width = -5;
    self.navigationItem.rightBarButtonItems = @[negativeSeperator2, buttonItem2];
}
- (void)setup {
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    DetailsViewController *vc = [[DetailsViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(0, 0, 32, 32);
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
        _pagerController.progressColor = [UIColor orangeColor];
        _pagerController.normalTextColor = HexColor(0x969696);
        _pagerController.selectedTextColor = [UIColor orangeColor];
        _pagerController.normalTextFont = OFFont(15);
        _pagerController.selectedTextFont = OFFont(17);
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
