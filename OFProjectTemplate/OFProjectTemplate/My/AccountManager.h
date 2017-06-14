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

@property (nonatomic, assign) BOOL isLogin;

@property (nonatomic, copy) NSString *token;

+ (instancetype)sharedManager;

+ (void)callLoginServiceWithHandler:(void(^)(ActionState state))handler;

@end
