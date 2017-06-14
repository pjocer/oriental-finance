//
//  OriRoute.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OriRoute.h"

@implementation OriRoute
+ (BOOL)canHandelWithURL:(NSURL *)url completion:(OriRouteResponse)completion {
    BOOL canHandel = NO;
    if ([url.scheme isEqualToString:@"oriental"]) {
        canHandel = YES;
        NSString *paramStr = [url.absoluteString substringFromIndex:[@"oriental://" length]];
        NSDictionary *dict = [self dictWithQueryStr:paramStr];
        NSString *domain = [dict objectForKey:@"domain"];
        NSString *action = [dict objectForKey:@"action"];
        if ([domain isEqualToString:@"xxx"]) {
            if ([action isEqualToString:@"ooo"]) {
                
            }
        }
    }
    return canHandel;
}
+ (NSDictionary *)dictWithQueryStr:(NSString *)query{
    NSString *jsonString = [query stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSData  *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonDict =  [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    return jsonDict;
}
@end
