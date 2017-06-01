//
//  OVendorMacro.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/26.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OEnviroment.h"

#ifndef OVendorMacro_h
#define OVendorMacro_h


#ifdef OF_DEVELOP_ENVIRONMENT
    #define UMengAnalyticsKey @""
    #define UMengLogEnabled YES
    #define IsDevelopEnvironment YES
#endif

#ifdef OF_DISTRIBUTION_ENVIRONMENT
    #define UMengAnalyticsKey @""
    #define UMengLogEnabled NO
    #define IsDevelopEnvironment NO
#endif

#pragma mark - QQ开放平台
#define QQ_PLATFORM @""

#pragma mark - 微博开放平台
#define WB_APP_KEY @""
#define WB_APP_Secret @""
#define wb_RedirectURL @""

#pragma mark - 微信开放平台
#define WX_APP_ID @""
#define WX_APP_Secret @""

#pragma mark - 科大讯飞
#define KDXF_ID @"5927fa81"

#pragma mark - 友盟
#define UMENG_APP_KEY @"592e7e46c895761d34000e5a"

#endif /* OVendorMacro_h */
