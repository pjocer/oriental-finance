//
//  AccountManager.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "AccountManager.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface AccountManager ()

@end

@implementation AccountManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static AccountManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[AccountManager alloc] _init];
    });
    return manager;
}

- (instancetype)_init {
    if (self = [super init]) {
        
    }
    return self;
}

+ (void)callLoginServiceWithHandler:(void (^)(ActionState))handler {
    LoginViewController *vc = [[LoginViewController alloc] initWithTitle:@"登录" navBarBtns:NavBarBtnBack];
    vc.loginHandler = handler;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.hidesBottomBarWhenPushed = YES;
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.rootController presentViewController:nav animated:YES completion:nil];
}

@end
