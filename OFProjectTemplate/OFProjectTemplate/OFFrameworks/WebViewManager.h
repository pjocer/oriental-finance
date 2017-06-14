//
//  WebViewManager.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebViewManager : NSObject
+ (void)clearWebCacheCompleted:(void(^)(void))block;
+ (long long)webCacheSize;
@end
