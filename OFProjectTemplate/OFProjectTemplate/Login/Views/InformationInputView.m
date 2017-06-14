//
//  InformationInputView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "InformationInputView.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"


@implementation InformationInputView

- (instancetype)initWithType:(NSString *)type num:(NSInteger)num {
    if (self = [super init]) {
        [self addSubviewsWithType:type num:num];
    }
    return self;
}

- (void)addSubviewsWithType:(NSString *)type num:(NSInteger)num {
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.top.equalTo(self.titleLabel.mas_bottom).offset(9);
    }];
    
    [self addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 12.5, 12.5, 12.5));
        make.top.equalTo(self.textField.mas_bottom).offset(11);
        make.height.equalTo(@0.5);
    }];
    if (num == 2) {
        [self addSubview:self.titleLabel2];
        [self.titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
            make.top.equalTo(self.line.mas_bottom).offset(12.5);
        }];
        
        [self addSubview:self.textField2];
        [self.textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 122.5, 0, 122.5));
            make.top.equalTo(self.titleLabel2.mas_bottom).offset(9);
        }];
        
        [self addSubview:self.validationBtn];
        [self.validationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textField2.mas_right);
            make.top.equalTo(self.titleLabel2.mas_bottom).offset(9);
            make.right.equalTo(self.line);
        }];
        
        
        
        if (![type isEqualToString:@"show"]) {
            [self.validationBtn setHidden:YES];
            
        }else{
            [self.validationBtn setHidden:NO];
        }
        
        
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
            make.bottom.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 12.5, 0, 12.5));
        }];
    }else{
        [self addSubview:self.sureBtn];
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.line.mas_bottom).offset(51.5);
            make.height.equalTo(@44);
            make.bottom.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 12.5, 0, 12.5));
        }];
    }
    
    
    
    
    
    
    
    
    
    
    
}

- (void)clientAction:(UIButton *)btn{
    [self.delegate InformationInputDelegate:btn];
}

- (void)vailadAction:(UIButton *)btn{
    [self.delegate vailadCodeDelegate:btn];
}


- (UIButton *)validationBtn {
    if (!_validationBtn) {
        _validationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_validationBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _validationBtn.titleLabel.font = UIFontMake(16);
        [_validationBtn addTarget:self action:@selector(vailadAction:) forControlEvents:UIControlEventTouchUpInside];
        [_validationBtn setTitleColor:UIColorMake(229, 75, 20) forState:UIControlStateNormal];
    }
    return _validationBtn;
}



- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setTitle:@"登录" forState:UIControlStateNormal];
        _sureBtn.layer.masksToBounds = YES;
        _sureBtn.titleLabel.font = UIFontMake(16);
        _sureBtn.backgroundColor = UIColorMake(229, 75, 20);
        _sureBtn.layer.cornerRadius = 2;
        [_sureBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _sureBtn;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = UIFontMake(16);
        _titleLabel.textColor = UIColorMake(51, 51, 51);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
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
        _textField.font = UIFontMake(21);
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.clearButtonMode=UITextFieldViewModeAlways;
    }
    return _textField;
}

- (UILabel *)titleLabel2{
    if (!_titleLabel2) {
        _titleLabel2 = [[UILabel alloc]init];
        _titleLabel2.font = UIFontMake(16);
        _titleLabel2.textColor = UIColorMake(51, 51, 51);
        _titleLabel2.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel2;
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
        _textField2.font = UIFontMake(21);
        _textField2.textAlignment = NSTextAlignmentCenter;
        _textField2.clearButtonMode=UITextFieldViewModeAlways;
    }
    return _textField2;
}

@end
