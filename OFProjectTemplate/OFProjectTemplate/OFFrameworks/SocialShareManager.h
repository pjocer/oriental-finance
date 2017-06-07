//
//  SocialShareManager.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/7.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareMenu.h"

@interface SocialShareManager : NSObject

@property (nonatomic,copy)   NSString *defaultTitle;
@property (nonatomic,copy)   NSString *defaultContent;
@property (nonatomic,strong) UIImage *defaultImage;
@property (nonatomic,copy)   NSString *defaultLinkUrl;

+ (instancetype)sharedInstance;

/**
 弹出分享视图分享UIImage
 
 @param platforms 要分享的平台，多选，一般直接选MBoxShareMenusAll
 @param title 标题
 @param content 内容
 @param image UIImage实例，传url用另一个方法
 @param url 要分享的链接
 @param success 分享成功 (复制链接成功也会调用，注意区分)
 @param failure 分享失败（进入分享app直接点取消也属于失败）
 @param canceled 直接点击close或backgroundView
 */
- (void)shareWithPlatforms:(MoreOperationType)platforms
                     title:(NSString *)title
                   content:(NSString *)content
                     image:(UIImage *)image
                   linkUrl:(NSString *)url
                   success:(void(^)(MoreOperationType shareType))success
                   failure:(void(^)(NSError *error))failure
                  canceled:(void(^)())canceled;

/**
 弹出分享视图分享ImageUrl
 
 @param platforms 要分享的平台，多选，一般直接选MBoxShareMenusAll
 @param title 标题
 @param content 内容
 @param imageUrl NSURL，传image用另一个方法
 @param url 要分享的链接
 @param success 分享成功 (复制链接成功也会调用，注意区分)
 @param failure 分享失败（进入分享app直接点取消也属于失败）
 @param canceled 直接点击close或backgroundView
 @param downloadCompletion 下载图片完成（可以在这儿终止转圈等）`
 
 */
- (void)shareWithPlatforms:(MoreOperationType)platforms
                     title:(NSString *)title
                   content:(NSString *)content
                  imageUrl:(NSURL *)imageUrl
                   linkUrl:(NSString *)url
   downloadImageCompletion:(void(^)(UIImage *img,NSError *error))downloadCompletion
                   success:(void(^)(MoreOperationType shareType))success
                   failure:(void(^)(NSError *error))failure
                  canceled:(void(^)())canceled;

@end
