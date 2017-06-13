//
//  SocialShareManager.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/7.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SocialShareManager.h"
#import <UMSocialCore/UMSocialCore.h>
#import "SocialAnalysisManager.h"
#import "OFUIkitMacro.h"
#import <SDWebImageManager.h>

@interface SocialShareManager ()
@property (nonatomic, weak) UMSocialManager *umManager;
@property (nonatomic,assign) MoreOperationType supportMenus;
@end

@implementation SocialShareManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static SocialShareManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [SocialShareManager new];
    });
    return manager;
}

- (void)shareWithPlatforms:(MoreOperationType)platforms title:(NSString *)title content:(NSString *)content image:(UIImage *)image linkUrl:(NSString *)url success:(void (^)(MoreOperationType))success failure:(void (^)(NSError *))failure canceled:(void (^)())canceled {
    MoreOperationType shouldShowMenus = platforms & self.supportMenus;
    WEAKSELF
    [ShareMenu showWith:shouldShowMenus style:ShareMenuStyleBorderCancel compeletion:^(ShareMenuItemView *item) {
        STRONGSELF
        UMShareWebpageObject *webPage = [UMShareWebpageObject shareObjectWithTitle:title descr:content thumImage:image];
        webPage.webpageUrl = url;
        [self shareWithType:item.operationtype UMShareObject:webPage success:success failure:failure];
    } canceled:canceled];
}

- (void)shareWithPlatforms:(MoreOperationType)platforms title:(NSString *)title content:(NSString *)content imageUrl:(NSURL *)imageUrl linkUrl:(NSString *)url downloadImageCompletion:(void (^)(UIImage *, NSError *))downloadCompletion success:(void (^)(MoreOperationType))success failure:(void (^)(NSError *))failure canceled:(void (^)())canceled {
    WEAKSELF
    [[SDWebImageManager sharedManager] loadImageWithURL:imageUrl options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        STRONGSELF
        if (downloadCompletion) {
            downloadCompletion(image,error);
        }
        [self shareWithPlatforms:platforms title:title content:content image:image linkUrl:url success:success failure:failure canceled:canceled];
    }];
}

- (void)shareWithType:(MoreOperationType)shareType UMShareObject:(UMShareObject *)shareObject success:(void (^)(MoreOperationType))success failure:(void (^)(NSError *))failure {
    NSString *pasteboardContent = @"";
    if ([shareObject isKindOfClass:[UMShareWebpageObject class]]) {
        UMShareWebpageObject *webPage = (UMShareWebpageObject *)shareObject;
        webPage.webpageUrl = STRINGHASVALUE(webPage.webpageUrl)?webPage.webpageUrl:self.defaultLinkUrl;
        webPage.title      = STRINGHASVALUE(webPage.title)?webPage.title:self.defaultTitle;
        webPage.descr      = STRINGHASVALUE(webPage.descr)?webPage.descr:self.defaultContent;
        webPage.thumbImage = webPage.thumbImage?:self.defaultImage;
        pasteboardContent  = webPage.webpageUrl;
    }
    if (shareType == MoreOperationTypeClipboard) {
        [UIPasteboard generalPasteboard].string = pasteboardContent;
        success(shareType);
        return;
    }
    UMSocialMessageObject *shareModel = [UMSocialMessageObject messageObjectWithMediaObject:shareObject];
    UMSocialPlatformType umType = [self mappedTypeFromMBoxType:shareType];
    [self.umManager shareToPlatform:umType messageObject:shareModel currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
            if (failure) {
                failure(error);
            }
            return ;
        }else{
            if (success) {
                success(shareType);
            }
            return ;
        }
    }];
}

- (UMSocialPlatformType)mappedTypeFromMBoxType:(MoreOperationType)shareType{
    UMSocialPlatformType umType;
    switch (shareType) {
        case MoreOperationTypeShareWechat:
            umType = UMSocialPlatformType_WechatSession;
            break;
        case MoreOperationTypeShareMoment:
            umType = UMSocialPlatformType_WechatTimeLine;
            break;
        case MoreOperationTypeShareQQ:
            umType = UMSocialPlatformType_QQ;
            break;
        case MoreOperationTypeShareQzone:
            umType = UMSocialPlatformType_Qzone;
            break;
        case MoreOperationTypeShareWeibo:
            umType = UMSocialPlatformType_Sina;
            break;
        default:
            umType = UMSocialPlatformType_UnKnown;
            break;
    }
    return umType;
}

- (UMSocialManager *)umManager {
    if (!_umManager) {
        _umManager = [UMSocialManager defaultManager];
    }
    return _umManager;
}

- (MoreOperationType)supportMenus {
    MoreOperationType menus = MoreOperationTypeClipboard;
    if ([SocialAnalysisManager checkPlatformAvialable:SocialPlatformQQ]) {
        menus = menus | MoreOperationTypeShareQQ | MoreOperationTypeShareQzone;
    }
    if ([SocialAnalysisManager checkPlatformAvialable:SocialPlatformWeChat]) {
        menus = menus | MoreOperationTypeShareWechat | MoreOperationTypeShareMoment;
    }
    if ([SocialAnalysisManager checkPlatformAvialable:SocialPlatformSina]) {
        menus = menus | MoreOperationTypeShareWeibo;
    }
    return menus;
}

@end
