//
//  OrientalHttpManager.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSUInteger, OrientalServiceType) {
    OrientalServiceTypeNormal,
    OrientalServiceTypeUnknow,
};

typedef NS_ENUM(NSUInteger, OrientalRequestMethod) {
    OrientalRequestMethodPost,
};

@class OrientalUploadModel;
@interface OrientalHttpManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

/**
 *  最常用请求
 *
 *  @param targetUrl 请求地址
 *  @param params    参数字典
 *  @param method    请求方法
 *  @param success   网络成功回调（status == 200）
 *  @param failure   网络失败回调（包含404等网络错误，不包含逻辑失败，逻辑失败在success中自行判断）
 *
 *  @return 各页面dealloc时记得cancel掉请求
 */
- (NSURLSessionDataTask *)requestWithTarget:(NSString *)targetUrl
                                     params:(NSDictionary *)params
                                     method:(OrientalRequestMethod)method
                                    success:(void(^)(NSURLSessionDataTask *task,id responseObject))success
                                    failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;
/**
 *  自定义后台服务
 *
 *  @param targetUrl        请求地址
 *  @param params           参数字典
 *  @param method           请求方法
 *  @param serviceType      后台服务类型
 *  @param success          网络成功回调（status == 200）
 *  @param failure          网络失败回调（包含404等网络错误，不包含逻辑失败，逻辑失败在success中自行判断）
 *
 *  @return                 各页面dealloc时记得cancel掉请求
 */
- (NSURLSessionDataTask *)requestWithTarget:(NSString *)targetUrl
                                     params:(NSDictionary *)params
                                     method:(OrientalRequestMethod)method
                                serviceType:(OrientalServiceType)serviceType
                                    success:(void(^)(NSURLSessionDataTask *task,id responseObject))success
                                    failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;
/**
 *  更多自定义项的请求
 *
 *  @param targetUrl        请求地址
 *  @param params           参数字典
 *  @param method           请求方法
 *  @param serviceType      请求业务线
 *  @param cachePolicy      缓存策略
 *  @param progress         进度
 *  @param success          网络成功回调（status == 200）
 *  @param failure          网络失败回调（不包含逻辑失败，逻辑失败在success中自行判断）
 *
 *  @return 各页面dealloc时记得cancel掉请求
 */
- (NSURLSessionDataTask *)requestWithTarget:(NSString *)targetUrl
                                     params:(NSDictionary *)params
                                     method:(OrientalRequestMethod)method
                                serviceType:(OrientalServiceType)serviceType
                                cachePolicy:(NSURLRequestCachePolicy)cachePolicy
                            timeoutInterval:(NSTimeInterval)timeoutInterval
                                   progress:(void(^)(NSProgress *progress))progress
                                    success:(void(^)(NSURLSessionDataTask *task,id responseObject))success
                                    failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;



/**
 上传文件到服务器
 
 @param uploadModel 上传文件Model
 @param targetUrl   上传URL
 @param params      上传参数
 @param serviceType 上传Type
 @return 各页面dealloc时记得cancel掉请求
 */
- (NSURLSessionDataTask *)uploadWithUploadModel:(OrientalUploadModel *)uploadModel
                                         target:(NSString *)targetUrl
                                         params:(NSDictionary *)params
                                    serviceType:(OrientalServiceType)serviceType
                                       progress:(void(^)(NSProgress *uploadProgress))progress
                                        success:(void(^)(NSURLSessionDataTask *task,id responseObject))success
                                        failure:(void(^)(NSURLSessionDataTask *task,NSError *error))failure;

@end
