//
//  SocialRegistModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/6.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SocialRegisterModel.h"

@implementation SocialRegisterModel

@end

@interface SocialRegisterItem ()
/**
 appKey
 */
@property (nonatomic,copy)   NSString *appKey;
/**
 appSecret
 */
@property (nonatomic,copy)   NSString *appSecret;
/**
 redirectURL
 */
@property (nonatomic,copy)   NSString *redirectURL;
/**
 platform
 */
@property (nonatomic,assign) SocialPlatform platform;

@end

@implementation SocialRegisterItem
- (instancetype)initWithPlatform:(SocialPlatform)platform appKey:(NSString *)appKey appSecret:(NSString *)appSecret redirectURL:(NSString *)redirectURL {
    if (self = [super init]) {
        _platform = platform;
        _appKey = [appKey copy];
        _appSecret = [appSecret copy];
        _redirectURL = [redirectURL copy];
    }
    return self;
}
@end
