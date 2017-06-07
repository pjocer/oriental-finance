//
//  SetupView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/7.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SetupView.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"

@implementation SetupView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{
    UILabel *line1 = [[UILabel alloc]init];
    line1.backgroundColor = UIColorMake(204, 204, 204);
    [self addSubview:line1];
    
    UILabel *line2 = [[UILabel alloc]init];
    line2.backgroundColor = UIColorMake(204, 204, 204);
    [self addSubview:line2];
    
    [self addSubview:self.titlabel];
    
    [self addSubview:self.textField];
    
    [self addSubview:self.sureBtn];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self).insets(UIEdgeInsetsMake(12, 22.5, 0, 22.5));
        make.height.equalTo(@1);
    }];
    
    [self.titlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).insets(UIEdgeInsetsMake(12, 22.5, 0, 22.5));
        make.top.equalTo(line1.mas_bottom).offset(12);
    }];

    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).insets(UIEdgeInsetsMake(12, 22.5, 0, 22.5));
        make.left.equalTo(self.titlabel.mas_right).offset(15);
        make.centerY.equalTo(self.titlabel);
    }];

    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(12, 22.5, 0, 22.5));
        make.top.equalTo(self.titlabel.mas_bottom).offset(13.5);
        make.height.equalTo(@1);
    }];
    
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.mas_bottom).offset(36.5);
        make.centerX.equalTo(self);
        make.width.equalTo(@150);
        make.height.equalTo(@44);
    }];
    
    
    
}


- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        _sureBtn.layer.masksToBounds = YES;
        _sureBtn.titleLabel.font = UIFontMake(16);
        _sureBtn.backgroundColor = UIColorMake(245, 166, 35);
        _sureBtn.layer.cornerRadius = 22;
        [_sureBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _sureBtn;
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.font = UIFontMake(14);
        _textField.textColor = UIColorMake(153, 153, 153);
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.clearButtonMode=UITextFieldViewModeAlways;
    }
    return _textField;
}

- (UILabel *)titlabel{
    if (!_titlabel) {
        _titlabel = [[UILabel alloc]init];
        _titlabel.font = UIFontMake(16);
        _titlabel.textColor = UIColorMake(51, 51, 51);
        _titlabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titlabel;
}

- (void)clientAction: (UIButton *)btn {
    [self.delegate setupViewDelegateWithBtn:btn];
}
@end
