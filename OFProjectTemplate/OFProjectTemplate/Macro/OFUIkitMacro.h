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
#define OriImageNamed(name) [UIImageMake(name) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]

#define DEFAULT_BG_COLOR UIColorMake(236, 236, 236)
#define DEFAULT_TEXT_COLOR UIColorMake(51, 51, 51)
#define DEFAULT_TEXT_COLOR_SELECTED UIColorMake(229, 75, 20)
#define DEFAULT_TEXT_COLOR_GRAY UIColorMake(102, 102, 102)

#ifdef DEBUG
    #define NSLog(...) NSLog((@"%s [Line %d] %@"), __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
    #define SuccessLog(url, params, response) NSLog(@"\nurl = %@ \nparams = %@\nresponseObject = %@", url, params, response);
    #define FailureLog(url, params, response) NSLog(@"\n❌❌❌❌❌❌❌❌❌❌\nurl = %@ \nparams = %@\nerror:%@ \n❌❌❌❌❌❌❌❌❌❌\n", url, params, response);
#else
    #define NSlog(...)
    #define SuccessLog(...)
    #define FailureLog(...)
#endif

#define UserDefaultsSetObjectForKey(obj,key)\
        [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];\
        [[NSUserDefaults standardUserDefaults] synchronize]


#define UserDefaultsObjectForKey(key)\
        [[NSUserDefaults standardUserDefaults] objectForKey:key]


#define ARRAYHASVALUE(array)    ((array) && ([(array) isKindOfClass:[NSArray class]]) && ([(array) count] > 0))
#define DICTHASVALUE(dict)      ((dict) && [(dict) isKindOfClass:[NSDictionary class]] && [((NSDictionary *)dict) count] > 0)
#define STRINGHASVALUE(str)		(str && [str isKindOfClass:[NSString class]] && [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)

#define WEAKSELF    @weakify(self);
#define STRONGSELF  @strongify(self);

#endif /* OFUIkitMacro_h */
