//
//  OrientalHttpManager.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OrientalHttpManager.h"
#import "OriNetworking.h"
#import "OrientalUploadModel.h"

@implementation OrientalHttpManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static OrientalHttpManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [OrientalHttpManager manager];
        //request
        
        
        [manager.requestSerializer setValue:[[UIDevice currentDevice] model] forHTTPHeaderField:@"model"];

        //response
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain", nil];
        manager.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndex:200];
        
        //https
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
    });
    return manager;
}

- (NSURLSessionDataTask *)requestWithTarget:(NSString *)targetUrl params:(NSDictionary *)params method:(OrientalRequestMethod)method success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    return [self requestWithTarget:targetUrl params:params method:method serviceType:OrientalServiceTypeNormal success:success failure:failure];
}

- (NSURLSessionDataTask *)requestWithTarget:(NSString *)targetUrl params:(NSDictionary *)params method:(OrientalRequestMethod)method serviceType:(OrientalServiceType)serviceType success:(void(^)(NSURLSessionDataTask *task,id responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure {
    NSURLRequestCachePolicy cachePolicy =  NSURLRequestReloadIgnoringLocalCacheData;
    return [self requestWithTarget:targetUrl params:params method:method serviceType:serviceType cachePolicy:cachePolicy timeoutInterval:10.0f progress:nil success:success failure:failure];
}

- (NSURLSessionDataTask *)requestWithTarget:(NSString *)targetUrl params:(NSDictionary *)params method:(OrientalRequestMethod)method serviceType:(OrientalServiceType)serviceType cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval progress:(void(^)(NSProgress *progress))progress success:(void(^)(NSURLSessionDataTask *task,id responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure{
    if (!targetUrl) {
        return nil;
    }
    self.requestSerializer.timeoutInterval = timeoutInterval;
    self.requestSerializer.cachePolicy = cachePolicy;
    
    //params
    NSString *url = [OrientalHttpManager urlWithServiceType:serviceType targetUrl:targetUrl];
    NSMutableDictionary *copyParams = [NSMutableDictionary dictionary];
    if (params) {
        [copyParams addEntriesFromDictionary:params];
    }
    NSMutableDictionary *orignalContent = [NSMutableDictionary dictionary];
    [orignalContent setValue:@"0" forKey:@"itype"];
    [orignalContent setValue:@"" forKey:@"deviceId"];
    [orignalContent setValue:copyParams forKey:@"data"];
    [orignalContent setValue:@"" forKey:@"token"];
    
    
    
    
    // 所有的参数设置完了在进行签名，签名放在header里面
//    [self.requestSerializer setValue:[self signatrueOfParams:copyParams] forHTTPHeaderField:@"signature"];
    NSURLSessionDataTask *task = nil;
    return task;
}



+ (NSString *)urlWithServiceType:(OrientalServiceType)serviceType targetUrl:(NSString *)targetUrl {
    switch (serviceType) {
        case OrientalServiceTypeNormal:
            return [NSString stringWithFormat:@"%@/%@",OriHost,targetUrl];
            break;
        case OrientalServiceTypeUnknow:
            return [NSString stringWithFormat:@"%@/%@",OriHost,targetUrl];
            break;
            
        default:
            break;
    }
    return [NSString stringWithFormat:@"%@/%@",OriHost,targetUrl];
}

@end
