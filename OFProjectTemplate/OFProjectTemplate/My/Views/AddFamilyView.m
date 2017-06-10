//
//  AddFamilyView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/10.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "AddFamilyView.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"

@implementation AddFamilyView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{
    
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self).insets(UIEdgeInsetsMake(15, 29, 0, 29));
    }];
    
    [self addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 12.5, 12.5, 12.5));
        make.top.equalTo(self.textField.mas_bottom).offset(11);
        make.height.equalTo(@0.5);
    }];
    
        [self addSubview:self.textField2];
        [self.textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 29, 0, 102.5));
            make.top.equalTo(self.line.mas_bottom).offset(23);
        }];
        
        [self addSubview:self.validationBtn];
        [self.validationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textField2.mas_right);
            make.centerY.equalTo(self.textField2);
            make.right.equalTo(self.line);
        }];

        
    
        [self addSubview:self.line2];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 12.5, 12.5, 12.5));
            make.top.equalTo(self.textField2.mas_bottom).offset(11);
            make.height.equalTo(@0.5);
        }];

        [self addSubview:self.sureBtn];
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.line2.mas_bottom).offset(51.5);
            make.height.equalTo(@44);
            make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 12.5, 0, 12.5));
        }];
    
    

    
    
    
    
    
    
    
    
}

- (void)clientAction:(UIButton *)btn{
    
}

- (UIButton *)validationBtn {
    if (!_validationBtn) {
        _validationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_validationBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        _validationBtn.titleLabel.font = UIFontMake(14);
        [_validationBtn setTitleColor:UIColorMake(229, 75, 20) forState:UIControlStateNormal];
        _validationBtn.layer.borderColor = UIColorMake(229, 75, 20).CGColor;
        _validationBtn.layer.borderWidth = 0.5;
    }
    return _validationBtn;
}



- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setTitle:@"确认添加" forState:UIControlStateNormal];
        _sureBtn.layer.masksToBounds = YES;
        _sureBtn.titleLabel.font = UIFontMake(16);
        _sureBtn.backgroundColor = UIColorMake(229, 75, 20);
        _sureBtn.layer.cornerRadius = 2;
        [_sureBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _sureBtn;
}



- (UILabel *)line{
    if (!_line) {
        _line = [[UILabel alloc]init];
        _line.backgroundColor = UIColorMake(204, 204, 204);
    }
    return _line;
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.placeholder = @"输入手机成员号码";
        _textField.font = UIFontMake(16);
//        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.clearButtonMode=UITextFieldViewModeAlways;
    }
    return _textField;
}


- (UILabel *)line2{
    if (!_line2) {
        _line2 = [[UILabel alloc]init];
        _line2.backgroundColor = UIColorMake(204, 204, 204);
    }
    return _line2;
}

- (UITextField *)textField2{
    if (!_textField2) {
        _textField2 = [[UITextField alloc]init];
        _textField2.font = UIFontMake(16);
        _textField2.placeholder = @"输入验证码";
//        _textField2.textAlignment = NSTextAlignmentCenter;
        _textField2.clearButtonMode=UITextFieldViewModeAlways;
    }
    return _textField2;
}

@end
