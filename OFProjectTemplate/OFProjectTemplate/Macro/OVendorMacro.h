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
    #define UMengAnalyticsKey @"592e7e46c895761d34000e5a"
    #define UMengLogEnabled YES
    #define IsDevelopEnvironment YES
#endif

#ifdef OF_DISTRIBUTION_ENVIRONMENT
    #define UMengAnalyticsKey @"592e7e46c895761d34000e5a"
    #define UMengLogEnabled NO
    #define IsDevelopEnvironment NO
#endif

#pragma mark - QQ开放平台
#define QQ_PLATFORM @"58wy1m0rMYvzPMtk"

#pragma mark - 微博开放平台
#define WB_APP_KEY @"3436841636"
#define WB_APP_Secret @"979dd66ee7546c5e67fbbdbf24704803"
#define WB_RedirectURL @""

#pragma mark - 微信开放平台
#define WX_APP_ID @""
#define WX_APP_Secret @""

#pragma mark - 科大讯飞
#define KDXF_ID @"5927fa81"

#pragma mark - 极光推送
#define JIG_APP_KEY @"403724dba51bd402c556dcff"
#define JIG_APP_SECRET @"26908a16660347d1c1ffa5f7"

#pragma mark - 友盟
#define UMENG_APP_KEY @"592e7e46c895761d34000e5a"

#endif /* OVendorMacro_h */
