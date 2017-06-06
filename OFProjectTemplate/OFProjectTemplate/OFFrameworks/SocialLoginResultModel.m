//
//  SocialLoginResultModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/6.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SocialLoginResultModel.h"
#import <UMSocialCore/UMSocialCore.h>
#import <objc/runtime.h>

@implementation SocialLoginResultModel
+ (instancetype)modelWithUMSocialUserInfoResponse:(UMSocialUserInfoResponse *)umModel {
    SocialLoginResultModel *model = [[SocialLoginResultModel alloc] init];
    unsigned count;
    objc_property_t *properties= class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id value = [umModel valueForKey:propertyName];
        if (value) {
            [model setValue:value forKey:propertyName];
        }
    }
    if (umModel.platformType == UMSocialPlatformType_WechatSession || umModel.platformType == UMSocialPlatformType_WechatTimeLine) {
        model.platformType = SocialPlatformWeChat;
    }
    if (umModel.platformType == UMSocialPlatformType_Sina) {
        model.platformType = SocialPlatformSina;
    }
    if (umModel.platformType == UMSocialPlatformType_QQ || umModel.platformType == UMSocialPlatformType_Qzone) {
        model.platformType = SocialPlatformQQ;
    }
    return model;
}
@end
