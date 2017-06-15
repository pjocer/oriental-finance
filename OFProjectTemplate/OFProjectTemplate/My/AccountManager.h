//
//  AccountManager.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserCenterMacros.h"

@interface AccountManager : NSObject

@property (nonatomic, readonly, copy) NSString *token;

@property (nonatomic, readonly, copy) NSString *id_card;

@property (nonatomic, readonly, copy) NSString *msg_push;

@property (nonatomic, readonly, copy) NSString *name;

@property (nonatomic, readonly, copy) NSString *nick_name;

@property (nonatomic, readonly, copy) NSString *phone;

@property (nonatomic, readonly, copy) NSString *sign_url;

+ (instancetype)sharedManager;

+ (BOOL)isLogin;

+ (void)callLoginServiceWithHandler:(void(^)(ActionState state))handler;

+ (void)saveLocalAccountData:(NSDictionary *)data;

+ (void)clearLocalAccountData:(NSDictionary *)data;

@end
