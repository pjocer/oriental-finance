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
#import "OFUIkitMacro.h"

#define USER_ACCOUNT_DATA @"USER_ACCOUNT_DATA"

@interface AccountManager ()

@property (nonatomic, readwrite, copy) NSString *token;

@property (nonatomic, readwrite, copy) NSString *id_card;

@property (nonatomic, readwrite, copy) NSString *msg_push;

@property (nonatomic, readwrite, copy) NSString *name;

@property (nonatomic, readwrite, copy) NSString *nick_name;

@property (nonatomic, readwrite, copy) NSString *phone;

@property (nonatomic, readwrite, copy) NSString *sign_url;

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
        [self setAccountProperties:UserDefaultsObjectForKey(USER_ACCOUNT_DATA)];
    }
    return self;
}

- (void)setAccountProperties:(NSDictionary *)data {
    self.token = [data valueForKey:@"token"];
    self.id_card = [data valueForKey:@"id_card"];
    self.msg_push = [data valueForKey:@"msg_push"];
    self.name = [data valueForKey:@"name"];
    self.nick_name = [data valueForKey:@"nick_name"];
    self.phone = [data valueForKey:@"phone"];
    self.sign_url = [data valueForKey:@"sign_url"];
}

+ (void)callLoginServiceWithHandler:(void (^)(ActionState))handler {
    LoginViewController *vc = [[LoginViewController alloc] initWithTitle:@"登录" navBarBtns:NavBarBtnBack];
    vc.loginHandler = handler;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.hidesBottomBarWhenPushed = YES;
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.rootController presentViewController:nav animated:YES completion:nil];
}

+ (void)saveLocalAccountData:(NSDictionary *)data {
    [[AccountManager sharedManager] setAccountProperties:data];
    UserDefaultsSetObjectForKey(data, USER_ACCOUNT_DATA);
}

+ (void)clearLocalAccountData:(NSDictionary *)data {
    UserDefaultsSetObjectForKey(nil, USER_ACCOUNT_DATA);
}

+ (BOOL)isLogin {
    return STRINGHASVALUE([[self sharedManager] token]);
}

@end
