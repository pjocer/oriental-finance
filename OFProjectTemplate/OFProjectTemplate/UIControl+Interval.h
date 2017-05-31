//
//  UIControl+Interval.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSTimeInterval ODefaultRepeatEventInterval = 1.5;

@interface UIControl (Interval)
@property (nonatomic, assign) NSTimeInterval mb_repeatEventInterval;
@end
