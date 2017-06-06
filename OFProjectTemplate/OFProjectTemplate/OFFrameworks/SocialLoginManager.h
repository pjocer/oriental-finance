//
//  SocialLoginManager.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/6.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSocialCore.h"
#import "SocialLoginResultModel.h"

@interface SocialLoginManager : NSObject
+ (instancetype)sharedManager;

/**
 从社交平台获取用户信息
 
 @param platform 平台
 @param success 获取信息成功的回调
 @param failure UMSocialPlatformErrorType
 */
- (void)getUserInfoWithPlatform:(SocialPlatform)platform
                        success:(void(^)(SocialLoginResultModel *response))success
                        failure:(void(^)(NSError *error))failure;
@end
