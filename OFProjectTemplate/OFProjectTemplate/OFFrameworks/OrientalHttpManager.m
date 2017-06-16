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
#import "Godzippa.h"
#import "HBRSAHandler.h"
#import <MJExtension.h>
#import "OFUIkitMacro.h"
#import "UIDevice+Hardware.h"
#import "AccountManager.h"
#import "OShowHud.h"

#define DEFAULT_TIMEOUT 30.f
#define DEFAULT_METHOD OrientalRequestMethodPost

@implementation OrientalHttpManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static OrientalHttpManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [OrientalHttpManager manager];
        //request
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];

        //response
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        //https
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
    });
    return manager;
}

- (NSURLSessionDataTask *)requestWithTarget:(NSString *)targetUrl params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    return [self requestWithTarget:targetUrl params:params method:DEFAULT_METHOD success:success failure:failure];
}

- (NSURLSessionDataTask *)requestWithTarget:(NSString *)targetUrl params:(NSDictionary *)params method:(OrientalRequestMethod)method success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    return [self requestWithTarget:targetUrl params:params method:method serviceType:OrientalServiceTypeNormal success:success failure:failure];
}

- (NSURLSessionDataTask *)requestWithTarget:(NSString *)targetUrl params:(NSDictionary *)params method:(OrientalRequestMethod)method serviceType:(OrientalServiceType)serviceType success:(void(^)(NSURLSessionDataTask *task,id responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure {
    NSURLRequestCachePolicy cachePolicy =  NSURLRequestReloadIgnoringLocalCacheData;
    return [self requestWithTarget:targetUrl params:params method:method serviceType:serviceType cachePolicy:cachePolicy timeoutInterval:DEFAULT_TIMEOUT progress:nil success:success failure:failure];
}

- (NSURLSessionDataTask *)requestWithTarget:(NSString *)targetUrl params:(NSDictionary *)params method:(OrientalRequestMethod)method serviceType:(OrientalServiceType)serviceType cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval progress:(void(^)(NSProgress *progress))progress success:(void(^)(NSURLSessionDataTask *task,id responseObject))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure{
    if (!targetUrl) {
        return nil;
    }
    self.requestSerializer.timeoutInterval = timeoutInterval;
    self.requestSerializer.cachePolicy = cachePolicy;
    
    //params
    NSString *url = [OrientalHttpManager urlWithServiceType:serviceType];
    NSMutableDictionary *copyParams = [NSMutableDictionary dictionary];
    if (params) {
        [copyParams addEntriesFromDictionary:params];
    }
    NSMutableDictionary *orignalContent = [NSMutableDictionary dictionary];
    [orignalContent setValue:targetUrl forKey:@"itype"];
    [orignalContent setValue:[[UIDevice currentDevice] UUID] forKey:@"deviceId"];
    [orignalContent setValue:copyParams forKey:@"data"];
    [orignalContent setValue:[[AccountManager sharedManager].user token]?:@"xx" forKey:@"token"];
    NSString *compressed = [self compressedString:orignalContent];
    NSString *encrypt = [self encryptParamContent:compressed];
    NSDictionary *dict = @{@"s":compressed, @"sign":encrypt};
    NSURLSessionDataTask *task = nil;
    
    void (^successBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = nil;
        NSDictionary *responseDic = [self deCompressedDataWith:responseObject err:err];
        SuccessLog(targetUrl, orignalContent, responseDic);
        if (DICTHASVALUE(responseDic) && !err) {
            if (success) success (task,responseDic);
        } else {
            if (failure) failure(task, err);
        }

    };
    void (^failureBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        FailureLog(targetUrl, orignalContent, error.localizedDescription);
        [OShowHud showErrorHudWith:@"网络连接失败" animated:YES];
        if (failure) {
            failure(task,error);
        }
    };
    
    switch (method) {
        case OrientalRequestMethodPost: {
            task = [self POST:url parameters:dict progress:nil success:successBlock failure:failureBlock];
        }
            break;
            
        default:
            break;
    }
    return task;
}

- (NSDictionary *)deCompressedDataWith:(id)responseObject err:(NSError *)decompressErr {
    NSData *resData = [[NSData alloc] initWithBase64EncodedData:responseObject options:0];
    NSData *decData = [resData dataByGZipDecompressingDataWithError:&decompressErr];
    return [decData mj_JSONObject];
}

- (NSString *)compressedString:(NSMutableDictionary *)content  {
    NSString *originalString = [content mj_JSONString];
    NSData *dataStr = [originalString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *compressErr = nil;
    NSData *gzipData = [dataStr dataByGZipCompressingWithError:&compressErr];
    NSData *encodedData = [gzipData base64EncodedDataWithOptions:0];
    return [[NSString alloc] initWithData:encodedData encoding:NSUTF8StringEncoding];
}


- (NSString *)encryptParamContent:(NSString *)content {
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"pem"];
    HBRSAHandler *handler = [[HBRSAHandler alloc] init];
    [handler importKeyWithType:KeyTypePrivate andPath:private_key_path];
    NSString *signStr = [handler signString:content];
    return signStr;
}


+ (NSString *)urlWithServiceType:(OrientalServiceType)serviceType{
    switch (serviceType) {
        case OrientalServiceTypeNormal:
            return [NSString stringWithFormat:@"%@",OriHost];
            break;
        case OrientalServiceTypeUnknow:
            return [NSString stringWithFormat:@"%@",OriHost];
            break;
            
        default:
            break;
    }
    return [NSString stringWithFormat:@"%@",OriHost];
}

@end
