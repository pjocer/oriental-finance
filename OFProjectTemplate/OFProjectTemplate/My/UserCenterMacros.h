//
//  UserCenterMacros.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#ifndef UserCenterMacros_h
#define UserCenterMacros_h

typedef enum : NSUInteger {
    LoginStateSuccess,
    LoginStateFailure,
    LoginStateUserCancel,
} LoginState;

typedef enum : NSUInteger {
    RegisterStateSuccess,
    RegisterStateFailure,
    RegisterStateUserCancel,
} RegisterState;

typedef enum : NSUInteger {
    ActionStateSuccess,
    ActionStateFailure,
    ActionStateUserCancel,
} ActionState;

#endif /* UserCenterMacros_h */
