//
//  OriNetworking.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#ifndef OriNetworking_h
#define OriNetworking_h


#import "OrientalHttpManager.h"
#import "OrientalUploadModel.h"

#define NetworkRequestParamsError @"数据错误"  // 入参不合法

#define OriNetwork    [OrientalHttpManager sharedInstance]

//#define OriHost @"http://192.168.1.142:8080"

#define OriHost @"http://192.168.1.79:8080/app/gateway"

#endif /* OriNetworking_h */
