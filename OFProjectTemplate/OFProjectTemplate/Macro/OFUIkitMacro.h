//
//  OFUIkitMacro.h
//  OFClient
//
//  Created by 吉冠虎 on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#ifndef OFUIkitMacro_h
#define OFUIkitMacro_h

#import <RACEXTScope.h>

#define HexColor(rgbValue) [UIColor colorWithRed:((float) ((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float) ((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float) (rgbValue & 0xFF)) / 255.0 alpha:1.0]
#define OFFont(x) [UIFont systemFontOfSize:(x)]

#define NAV_HEIGHT 64.0
#define SCREEN_SCALE (1.0/[UIScreen mainScreen].scale)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#ifdef DEBUG
    #define DLog(...) NSLog((@"%s [Line %d] %@"), __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
    #define SLog(...) NSLog(__VA_ARGS__)
    #define LogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#else
    #define DLog(...)
    #define SLog(...)
    #define LogRed(...)
#endif

#define WEAKSELF    @weakify(self);
#define STRONGSELF  @strongify(self);

#endif /* OFUIkitMacro_h */
