//
//  SocialManager.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/6.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocialRegisterModel.h"

@interface SocialAnalysisManager : NSObject

+ (BOOL)checkPlatformAvialable:(SocialPlatform)platform;

+ (void)openLog:(BOOL)isOpen;

+ (void)registerWithModel:(SocialRegisterModel *)registerModel;

+ (BOOL)handleOpenURL:(NSURL *)url;

@end
