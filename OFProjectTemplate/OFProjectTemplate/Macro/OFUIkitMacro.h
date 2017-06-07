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
#import <QMUIKit.h>

#define ImageNamed(name) UIImageMake(name)

#define DEFAULT_BG_COLOR UIColorMake(236, 236, 236)
#define DEFAULT_TEXT_COLOR UIColorMake(51, 51, 51)
#define DEFAULT_TEXT_COLOR_SELECTED UIColorMake(229, 75, 20)
#define DEFAULT_TEXT_COLOR_GRAY UIColorMake(102, 102, 102)

#ifdef DEBUG
    #define LogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
    #define NSLog(...) NSLog((@"%s [Line %d] %@"), __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
    #define LogRed(...)
    #define NSlog(...)
#endif

#define ARRAYHASVALUE(array)    ((array) && ([(array) isKindOfClass:[NSArray class]]) && ([(array) count] > 0))
#define DICTHASVALUE(dict)      ((dict) && [(dict) isKindOfClass:[NSDictionary class]] && [((NSDictionary *)dict) count] > 0)
#define STRINGHASVALUE(str)		(str && [str isKindOfClass:[NSString class]] && [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)

#define WEAKSELF    @weakify(self);
#define STRONGSELF  @strongify(self);

#endif /* OFUIkitMacro_h */
