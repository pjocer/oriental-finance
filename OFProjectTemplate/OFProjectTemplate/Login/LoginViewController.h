//
//  LoginViewController.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OFBaseViewController.h"
#import "UserCenterMacros.h"

@interface LoginViewController : OFBaseViewController

@property (nonatomic, copy) void(^loginHandler)(ActionState state);

@end
