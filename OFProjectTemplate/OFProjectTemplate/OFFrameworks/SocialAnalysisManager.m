//
//  SocialManager.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/6.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SocialAnalysisManager.h"
#import <UMSocialCore/UMSocialManager.h>

@implementation SocialAnalysisManager

+ (BOOL)checkPlatformAvialable:(SocialPlatform)platform {
    UMSocialPlatformType type;
    switch (platform) {
        case SocialPlatformQQ:
            type = UMSocialPlatformType_QQ;
            break;
        case SocialPlatformWeChat:
            type = UMSocialPlatformType_WechatSession;
            break;
        case SocialPlatformSina:
            type = UMSocialPlatformType_Sina;
            break;
        default:
            break;
    }
    return [[UMSocialManager defaultManager] isInstall:type];
}

+ (void)openLog:(BOOL)isOpen {
    [[UMSocialManager defaultManager] openLog:isOpen];
}

+ (void)registerWithModel:(SocialRegisterModel *)registerModel {
    [[UMSocialManager defaultManager] setUmSocialAppkey:registerModel.appKey];
    for (SocialRegisterItem *item in registerModel.platforms) {
        UMSocialPlatformType platform;
        switch (item.platform) {
            case SocialPlatformWeChat:
                platform = UMSocialPlatformType_WechatSession;
                break;
            case SocialPlatformQQ:
                platform = UMSocialPlatformType_QQ;
                break;
            case SocialPlatformSina:
                platform = UMSocialPlatformType_Sina;
                break;
            default:
                platform = UMSocialPlatformType_UnKnown;
                break;
        }
        if (platform != UMSocialPlatformType_UnKnown) {
            [[UMSocialManager defaultManager] setPlaform:platform appKey:item.appKey appSecret:item.appSecret redirectURL:item.redirectURL];
        }
    }
}

+ (BOOL)handleOpenURL:(NSURL *)url {
    return [[UMSocialManager defaultManager] handleOpenURL:url];
}

@end
