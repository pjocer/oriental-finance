//
//  SocialLoginResultModel.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/6.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSocialCore.h"

@class UMSocialUserInfoResponse;

@interface SocialLoginResultModel : NSObject
@property (nonatomic, copy) NSString  *name;
@property (nonatomic, copy) NSString  *iconurl;
@property (nonatomic, copy) NSString  *gender;
@property (nonatomic, copy) NSString  *uid;
@property (nonatomic, copy) NSString  *openid;
@property (nonatomic, copy) NSString  *refreshToken;
@property (nonatomic, copy) NSDate    *expiration;
@property (nonatomic, copy) NSString  *accessToken;
@property (nonatomic, assign) SocialPlatform  platformType;
@property (nonatomic, strong) id  originalResponse;
+ (instancetype)modelWithUMSocialUserInfoResponse:(UMSocialUserInfoResponse *)umModel;
@end
