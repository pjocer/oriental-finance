//
//  LoginView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "LoginView.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"

@implementation LoginView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {


    [self addSubview:self.forgotPasswordbBtn];
    [self.forgotPasswordbBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).insets(UIEdgeInsetsMake(0, 12.5, 0, 12.5));
    }];
    
    [self addSubview:self.registeredBtn];
    [self.registeredBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self).insets(UIEdgeInsetsMake(0, 12.5, 0, 12.5));
    }];
    
    UILabel *line = [[UILabel alloc]init];
    line.backgroundColor = UIColorMake(204, 204, 204);
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.registeredBtn.mas_bottom).offset(19);
        make.right.left.equalTo(self).insets(UIEdgeInsetsMake(0, 12.5, 0, 12.5));
        make.height.equalTo(@1);
    }];
    
    [self addSubview:self.QQBtn];
    [self.QQBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(22.5);
        make.left.equalTo(self.mas_left).offset(45);
        make.width.height.equalTo(@42);
    }];
    
    [self addSubview:self.WeChatBtn];
    [self.WeChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(22.5);
        make.centerX.equalTo(self);
        make.width.height.equalTo(@42);
    }];
    
    [self addSubview:self.sinaBtn];
    [self.sinaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(22.5);
        make.right.equalTo(self.mas_right).offset(-45);
        make.width.height.equalTo(@42);
    }];
}

- (UIButton *)QQBtn {
    if (!_QQBtn) {
        _QQBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_QQBtn setTitle:@"QQ" forState:UIControlStateNormal];
        [_QQBtn setTitleColor:UIColorMake(66, 183, 246) forState:UIControlStateNormal];
        _QQBtn.layer.masksToBounds = YES;
        _QQBtn.layer.cornerRadius = 21;
        _QQBtn.layer.borderColor = UIColorMake(66, 183, 246).CGColor;
        _QQBtn.layer.borderWidth = 1;
        _QQBtn.titleLabel.font = UIFontMake(16);
        
    }
    return _QQBtn;
}

- (UIButton *)WeChatBtn {
    if (!_WeChatBtn) {
        _WeChatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_WeChatBtn setTitle:@"WeChat" forState:UIControlStateNormal];
        [_WeChatBtn setTitleColor:UIColorMake(126, 211, 33) forState:UIControlStateNormal];
        _WeChatBtn.layer.masksToBounds = YES;
        _WeChatBtn.layer.cornerRadius = 21;
        _WeChatBtn.layer.borderColor = UIColorMake(126, 211, 33).CGColor;
        _WeChatBtn.layer.borderWidth = 1;
        _WeChatBtn.titleLabel.font = UIFontMake(16);
        
    }
    return _WeChatBtn;
}

- (UIButton *)sinaBtn {
    if (!_sinaBtn) {
        _sinaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sinaBtn setTitle:@"sina" forState:UIControlStateNormal];
        [_sinaBtn setTitleColor:UIColorMake(251, 61, 24) forState:UIControlStateNormal];
        _sinaBtn.layer.masksToBounds = YES;
        _sinaBtn.layer.cornerRadius = 21;
        _sinaBtn.layer.borderColor = UIColorMake(251, 61, 24).CGColor;
        _sinaBtn.layer.borderWidth = 1;
        _sinaBtn.titleLabel.font = UIFontMake(16);
        
    }
    return _sinaBtn;
}



- (UIButton *)forgotPasswordbBtn {
    if (!_forgotPasswordbBtn) {
        _forgotPasswordbBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgotPasswordbBtn.tag = 201;
        [_forgotPasswordbBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
        _forgotPasswordbBtn.titleLabel.font = UIFontMake(16);
        [_forgotPasswordbBtn setTitleColor:UIColorMake(153, 153, 153) forState:UIControlStateNormal];
        [_forgotPasswordbBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _forgotPasswordbBtn;
}

- (UIButton *)registeredBtn {
    if (!_registeredBtn) {
        _registeredBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registeredBtn setTitle:@"快速注册" forState:UIControlStateNormal];
        _registeredBtn.titleLabel.font = UIFontMake(16);
        _registeredBtn.tag = 202;
        [_registeredBtn setTitleColor:UIColorMake(153, 153, 153) forState:UIControlStateNormal];
        [_registeredBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _registeredBtn;
}

- (void)clientAction:(UIButton *)btn{
    [self.delegate loginViewDelegate:btn];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
