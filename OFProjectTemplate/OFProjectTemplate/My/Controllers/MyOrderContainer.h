//
//  MyOrderContainer.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OFBaseViewController.h"
#import "OrderViewController.h"

@interface MyOrderContainer : OFBaseViewController

@property (nonatomic, assign) OrderListType type;

- (instancetype)initWithControllerType:(OrderListType)type;

@end
