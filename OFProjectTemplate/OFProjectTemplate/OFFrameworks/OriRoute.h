//
//  OriRoute.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, OriRouteHandlerType) {
    OriRouteHandlerTypeJSCallBack,
    OriRouteHandlerTypeNavBack,
};
typedef void (^OriRouteResponse)(OriRouteHandlerType type, id response);

@interface OriRoute : NSObject
+ (BOOL)canHandelWithURL:(NSURL *)url completion:(OriRouteResponse)completion;
+ (NSDictionary *)dictWithQueryStr:(NSString *)query;
@end
