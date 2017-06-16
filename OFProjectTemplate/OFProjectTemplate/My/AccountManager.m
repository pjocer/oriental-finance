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
#import <MJExtension.h>
#import "OFUIkitMacro.h"

#define USER_ARCHIVE_PATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingString:@"/user"]



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

- (instancetype)init {
    return [self _init];
}

- (instancetype)_init {
    if (self = [super init]) {
        _user = [NSKeyedUnarchiver unarchiveObjectWithFile:USER_ARCHIVE_PATH];
    }
    return self;
}

- (void)setUser:(User *)user {
    _user = user;
    [NSKeyedArchiver archiveRootObject:user toFile:USER_ARCHIVE_PATH];
    
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
    [AccountManager sharedManager].user = [User mj_objectWithKeyValues:data];
}

+ (void)clearLocalAccountData:(NSDictionary *)data {
    [AccountManager sharedManager].user = nil;
}

+ (BOOL)isLogin {
    return STRINGHASVALUE([[[AccountManager sharedManager] user] token]);
}

- (NSString *)token {
    return self.user.token;
}

- (NSString *)id_card {
    return self.user.id_card;
}

- (NSString *)phone {
    return self.user.phone;
}

- (NSString *)sign_url {
    return self.user.sign_url;
}

- (NSString *)msg_push {
    return self.user.msg_push;
}

- (NSString *)name {
    return self.user.name;
}

- (NSString *)nick_name {
    return self.user.nick_name;
}

- (void)setToken:(NSString *)token {
    self.user.token = token;
    [NSKeyedArchiver archiveRootObject:self.user toFile:USER_ARCHIVE_PATH];
}

- (void)setId_card:(NSString *)id_card {
    self.user.id_card = id_card;
    [NSKeyedArchiver archiveRootObject:self.user toFile:USER_ARCHIVE_PATH];
}

- (void)setPhone:(NSString *)phone {
    self.user.phone = phone;
    [NSKeyedArchiver archiveRootObject:self.user toFile:USER_ARCHIVE_PATH];
}

- (void)setSign_url:(NSString *)sign_url {
    self.user.sign_url = sign_url;
    [NSKeyedArchiver archiveRootObject:self.user toFile:USER_ARCHIVE_PATH];
}

- (void)setMsg_push:(NSString *)msg_push {
    self.user.msg_push = msg_push;
    [NSKeyedArchiver archiveRootObject:self.user toFile:USER_ARCHIVE_PATH];
}

- (void)setName:(NSString *)name {
    self.user.name = name;
    [NSKeyedArchiver archiveRootObject:self.user toFile:USER_ARCHIVE_PATH];
}

- (void)setNick_name:(NSString *)nick_name {
    self.user.nick_name = nick_name;
    [NSKeyedArchiver archiveRootObject:self.user toFile:USER_ARCHIVE_PATH];
}
@end
