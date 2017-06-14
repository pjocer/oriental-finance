//
//  OFBaseViewController.m
//  OFClient
//
//  Created by 吉冠虎 on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "OFBaseViewController.h"
#import "OFUIkitMacro.h"
#import <UINavigationController+FDFullscreenPopGesture.h>

@interface OFBaseViewController ()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end

@implementation OFBaseViewController

+ (void)initialize {
    [super initialize];
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [UINavigationBar appearance].translucent = NO;
    }
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [UINavigationBar appearance].shadowImage = [[UIImage alloc] init];
    
    
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSFontAttributeName : UIFontMake(17), NSForegroundColorAttributeName : UIColorMake(51, 51, 51) }];
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
}

- (instancetype)init {
    return [self initWithTitle:nil];
}

- (instancetype)initWithTitle:(NSString *)title {
    return [self initWithTitle:title navBarBtns:NavBarBtnBack];
}

- (instancetype)initWithTitle:(NSString *)title navBarBtns:(NavBarBtns)navBarBtns {
    if (self = [super init]) {
        self.navigationItem.title = title;
        self.view.backgroundColor = [UIColor whiteColor];
        [self buildNavBarBtns:navBarBtns];
    }
    return self;
}

- (void)buildNavBarBtns:(NavBarBtns)btns {
    if (btns & NavBarBtnBack) {
        UIButton *backButton                  = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backItem             = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        fixItem.width = -10;
        self.navigationItem.leftBarButtonItems = @[ fixItem, backItem ];
    }
}

- (void)back {
    @try {
        [self.view endEditing:YES];
    }
    @catch (NSException *ex){
        NSLog(@"%@", ex.reason);
    }
    if (self.navigationController && self.navigationController.viewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)startLoading {
    [[UIApplication sharedApplication].keyWindow.layer addSublayer:self.shapeLayer];
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @(-0.5);
    startAnimation.toValue = @(1);
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @(0);
    endAnimation.toValue = @(1);
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[startAnimation, endAnimation];
    groupAnimation.duration = 1.5;
    groupAnimation.repeatCount = INFINITY;
    [self.shapeLayer addAnimation:groupAnimation forKey:nil];
}

- (void)stopLoading {
    [self.shapeLayer removeAllAnimations];
    [self.shapeLayer removeFromSuperlayer];
}

- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 60, 60)];
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = CGRectMake(CGRectGetWidth(self.view.bounds)/2.f-30, CGRectGetHeight(self.view.bounds)/2.f-30, 60, 60);
        _shapeLayer.strokeColor = UIColorMake(255, 207, 71).CGColor;
        _shapeLayer.fillColor = UIColorClear.CGColor;
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.strokeStart = -0.5;
        _shapeLayer.strokeEnd = 0;
        _shapeLayer.lineWidth = 6;
        _shapeLayer.path = path.CGPath;
    }
    return _shapeLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.fd_interactivePopDisabled = NO;
    self.fd_prefersNavigationBarHidden = NO;
}

- (BOOL)fd_prefersNavigationBarHidden{
    return self.hideNavgationBar;
}

- (BOOL)fd_interactivePopDisabled{
    return self.slideBackForbidden;
}

@end
