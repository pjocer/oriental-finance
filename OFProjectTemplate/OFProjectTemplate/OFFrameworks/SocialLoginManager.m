//
//  SocialLoginManager.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/6.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SocialLoginManager.h"
#import <UMSocialCore/UMSocialManager.h>
#import <UMSocialCore/UMSocialResponse.h>

@implementation SocialLoginManager
+ (instancetype)sharedManager{
    static SocialLoginManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SocialLoginManager alloc] init];
    });
    return manager;
}
- (void)getUserInfoWithPlatform:(SocialPlatform)platform success:(void (^)(SocialLoginResultModel *))success failure:(void (^)(NSError *))failure{
    
    UMSocialPlatformType UMplatform;
    switch (platform) {
        case SocialPlatformWeChat:
            UMplatform = UMSocialPlatformType_WechatSession;
            break;
        case SocialPlatformQQ:
            UMplatform = UMSocialPlatformType_QQ;
            break;
        case SocialPlatformSina:
            UMplatform = UMSocialPlatformType_Sina;
            break;
        default:
            UMplatform = UMSocialPlatformType_UnKnown;
            break;
    }
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMplatform currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            if (failure) {
                failure(error);
            }
        }else{
            if (success) {
                if ([result isKindOfClass:[UMSocialUserInfoResponse class]]) {
                    SocialLoginResultModel *model = [SocialLoginResultModel modelWithUMSocialUserInfoResponse:result];
                    success(model);
                }
            }
        }
    }];
}
@end
