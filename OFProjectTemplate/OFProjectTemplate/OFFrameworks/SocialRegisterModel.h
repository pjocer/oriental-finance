//
//  SocialRegistModel.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/6.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SocialPlatform) {
    SocialPlatformWeChat,
    SocialPlatformSina,
    SocialPlatformQQ,
};

@class SocialRegisterItem;
@interface SocialRegisterModel : NSObject
/**
 设置友盟appkey
 */
@property (nonatomic,copy)   NSString *appKey;
@property (nonatomic,strong) NSArray<SocialRegisterItem *> *platforms;
@end
@interface SocialRegisterItem : NSObject
/**
 appKey
 */
@property (nonatomic,copy,readonly)   NSString *appKey;
/**
 appSecret
 */
@property (nonatomic,copy,readonly)   NSString *appSecret;
/**
 redirectURL
 */
@property (nonatomic,copy,readonly)   NSString *redirectURL;
/**
 platform
 */
@property (nonatomic,assign,readonly) SocialPlatform platform;

- (instancetype)initWithPlatform:(SocialPlatform)platform
                          appKey:(NSString *)appKey
                       appSecret:(NSString *)appSecret
                     redirectURL:(NSString *)redirectURL;

@end
