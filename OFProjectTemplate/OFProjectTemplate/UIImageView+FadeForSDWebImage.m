//
//  UIImageView+FadeForSDWebImage.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "UIImageView+FadeForSDWebImage.h"
#import "UIImageView+WebCache.h"
#import "objc/runtime.h"

@implementation UIImageView (FadeForSDWebImage)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originSelector = @selector(sd_setImageWithURL:placeholderImage:);
        SEL swizzledSelector = @selector(sd_fadeSetImageWithURL:placeholderImage:);
        Method originMethod = class_getInstanceMethod(class, originSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        BOOL success =  class_addMethod(class, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        }else{
            method_exchangeImplementations(originMethod, swizzledMethod);
        }
    });
}
- (void)sd_fadeSetImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder{
    __weak __typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url placeholderImage:placeholder options:SDWebImageAvoidAutoSetImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!weakSelf || error) {
            return ;
        }
        weakSelf.image = image;
        if (image && cacheType == SDImageCacheTypeNone) {
            CATransition *transition = [CATransition animation];
            transition.duration = 0.5;
            transition.type = kCATransitionFade;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            [self.layer addAnimation:transition forKey:nil];
        }
        [weakSelf setNeedsLayout];
    }];
}

@end
