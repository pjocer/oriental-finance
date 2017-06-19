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
#import <ReactiveCocoa.h>
#import "OShowHud.h"

@interface OFBaseViewController ()

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
    [OShowHud showHudAnimated:YES autoHiden:NO];
}

- (void)startLoading:(NSString *)tips {
    [OShowHud showHudWith:tips animated:YES autoHiden:NO];
}

- (void)stopLoading {
    [OShowHud hideHudAnimated:YES];
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
