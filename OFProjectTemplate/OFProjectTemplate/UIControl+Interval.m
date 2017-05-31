//
//  UIControl+Interval.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "UIControl+Interval.h"
#import <objc/runtime.h>

@implementation UIControl (Interval)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(mb_sendAction:to:forEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, @selector(sendAction:to:forEvent:));
        Method swizzledMethod = class_getInstanceMethod(class, @selector(mb_sendAction:to:forEvent:));
        
        BOOL didAddMethod = class_addMethod(class, originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)mb_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    static BOOL ignoreEvent = NO;
    if (self.mb_repeatEventInterval > 0) {
        if (ignoreEvent) {
            return ;
        } else {
            ignoreEvent = YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MAX(self.mb_repeatEventInterval, ODefaultRepeatEventInterval) * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                               ignoreEvent = NO;
                           });
            [self mb_sendAction:action to:target forEvent:event];
        }
    } else {
        [self mb_sendAction:action to:target forEvent:event];
    }
}



#pragma mark - Associated Objects
- (NSTimeInterval)mb_repeatEventInterval {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setMb_repeatEventInterval:(NSTimeInterval)mb_repeatEventInterval {
    objc_setAssociatedObject(self, @selector(mb_repeatEventInterval),
                             @(mb_repeatEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
