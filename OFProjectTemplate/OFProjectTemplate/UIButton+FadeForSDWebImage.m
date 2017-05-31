//
//  UIButton+FadeForSDWebImage.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "UIButton+FadeForSDWebImage.h"
#import "UIButton+WebCache.h"
#import "objc/runtime.h"
@implementation UIButton (FadeForSDWebImage)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeImplementationsWithOriginSEL:@selector(sd_setImageWithURL:forState:placeholderImage:) swizzledSEL:@selector(sd_fadeSetImageWithURL:forState:placeholderImage:)];
        [self exchangeImplementationsWithOriginSEL:@selector(sd_setBackgroundImageWithURL:forState:placeholderImage:) swizzledSEL:@selector(sd_fadeSetBackgroundImageWithURL:forState:placeholderImage:)];
        [self exchangeImplementationsWithOriginSEL:@selector(sd_setImageWithURL:forState:placeholderImage:completed:) swizzledSEL:@selector(sd_fadeSetImageWithURL:forState:placeholderImage:complete:)];
    });
}

- (void)sd_fadeSetImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder complete:(void (^)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL))complete{
    __weak typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url forState:state completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!weakSelf) {
            return ;
        }
        [weakSelf setImage:image forState:state];
        if (cacheType == SDImageCacheTypeNone && state == weakSelf.state) {
            {
                CATransition *transition = [CATransition animation];
                transition.duration = 0.5;
                transition.type = kCATransitionFade;
                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                [self.layer addAnimation:transition forKey:@"image"];
                [weakSelf setNeedsLayout];
            }
        }
        if (complete) {
            complete(image, error, cacheType, imageURL);
        }
    }];
}

- (void)sd_fadeSetImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder{
    __weak __typeof(self) weakSelf = self;
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholder options:SDWebImageAvoidAutoSetImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!weakSelf) {
            return ;
        }
        [weakSelf setImage:image forState:state];
        if (cacheType == SDImageCacheTypeNone && state == weakSelf.state) {
            {
                CATransition *transition = [CATransition animation];
                transition.duration = 0.5;
                transition.type = kCATransitionFade;
                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                [self.layer addAnimation:transition forKey:@"image"];
                [weakSelf setNeedsLayout];
            }
        }
    }];
}
- (void)sd_fadeSetBackgroundImageWithURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder{
    __weak __typeof(self) weakSelf = self;
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:SDWebImageAvoidAutoSetImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!weakSelf) {
            return ;
        }
        [weakSelf setBackgroundImage:image forState:state];
        if (cacheType == SDImageCacheTypeNone && state == weakSelf.state) {
            {
                CATransition *transition = [CATransition animation];
                transition.duration = 0.5;
                transition.type = kCATransitionFade;
                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                [self.layer addAnimation:transition forKey:@"backgroundImage"];
                [weakSelf setNeedsLayout];
            }
        }
    }];
}
+ (void)exchangeImplementationsWithOriginSEL:(SEL)originSEL swizzledSEL:(SEL)swizzledSEL{
    Class class = [self class];
    SEL originSelector = originSEL;
    SEL swizzledSelector = swizzledSEL;
    Method originMethod = class_getInstanceMethod(class, originSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL success =  class_addMethod(class, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (success) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else{
        method_exchangeImplementations(originMethod, swizzledMethod);
    }
}
@end
