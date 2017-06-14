
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
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UIColorMake(51, 51, 51);
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self).insets(UIEdgeInsetsMake(22.5, 0, 0, 0));
    }];
    
    
    for (NSInteger i = 0; i < 6; i++) {
        UILabel *labela = [[UILabel alloc]init];
        labela.font = UIFontMake(25);
        labela.text = @"●";
        labela.textAlignment = NSTextAlignmentCenter;
        labela.backgroundColor = UIColorMake(236, 236, 236);
        [self addSubview:labela];
        
        [labela mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.mas_bottom).offset(33.5);
            make.left.equalTo(self.mas_left).offset((20+(50*i)+(5*(i+1))));
            make.width.height.equalTo(@50);
        }];
        
    }
    
    
    UITextField *textfield = [[UITextField alloc]init];
    textfield.backgroundColor = [UIColor clearColor];
    
    
}
@end
