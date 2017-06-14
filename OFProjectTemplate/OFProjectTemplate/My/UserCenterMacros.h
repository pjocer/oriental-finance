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

typedef NS_ENUM(NSInteger,OrderListType) {
    OrderListTypeAllOrder,      //全部订单
    OrderListTypePending,       //待支付订单
    OrderListTypeShipment,      //待发货订单
    OrderListTypeCompleted,     //待收货订单
    OrderListTypeEvaluated,     //待评价订单
};

#endif /* UserCenterMacros_h */
