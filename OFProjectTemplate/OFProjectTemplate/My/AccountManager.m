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

@implementation User
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.token = [aDecoder decodeObjectForKey:@"token"];
        self.id_card = [aDecoder decodeObjectForKey:@"id_card"];
        self.msg_push = [aDecoder decodeObjectForKey:@"msg_push"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.nick_name = [aDecoder decodeObjectForKey:@"nick_name"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.sign_url = [aDecoder decodeObjectForKey:@"sign_url"];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.id_card forKey:@"id_card"];
    [aCoder encodeObject:self.msg_push forKey:@"msg_push"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.nick_name forKey:@"nick_name"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.sign_url forKey:@"sign_url"];
}
@end

@interface AccountManager ()
@property (nonatomic, readwrite, strong) User *user;
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

@end
