//
//  RegisteredViewController.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OFBaseViewController.h"
#import "UserCenterMacros.h"

@interface RegisteredViewController : OFBaseViewController

@property (nonatomic, strong) NSString *typeStr;

@property (nonatomic, copy) void(^loginHandler)(ActionState state);

@end
