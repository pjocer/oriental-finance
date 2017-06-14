
//
//  SetUpPayPasswordView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SetUpPayPasswordView.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@implementation SetUpPayPasswordView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{

    UILabel *label = [[UILabel alloc]init];
    label.font = UIFontMake(21);
    label.text = @"设置6位支付密码";
    [self addSubview:label];
    
}
@end
