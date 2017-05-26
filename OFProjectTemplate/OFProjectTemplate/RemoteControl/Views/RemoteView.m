//
//  RemoteView.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "RemoteView.h"
#import <Masonry.h>

@implementation RemoteView

- (void)drawRect:(CGRect)rect {
    [self addSubviews];
}


- (void)addSubviews {
    __weak RemoteView *weakSelf = self;
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.layer.masksToBounds = YES;
    backgroundView.layer.cornerRadius = self.frame.size.width/4;
    backgroundView.layer.borderColor = [UIColor grayColor].CGColor;
    backgroundView.layer.borderWidth = 0.5;
    [self addSubview:backgroundView];
    
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(-80);
        make.width.equalTo(@(weakSelf.frame.size.width/2));
        make.height.equalTo(@(weakSelf.frame.size.width/2));
    }];
    
    [self.centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(backgroundView);
        make.width.equalTo(@(weakSelf.frame.size.width/4));
        make.height.equalTo(@(weakSelf.frame.size.width/4));
    }];
    
    [self.topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backgroundView);
        make.bottom.equalTo(weakSelf.centerBtn.mas_top);
        make.width.equalTo(@(weakSelf.frame.size.width/4));
        make.height.equalTo(@(weakSelf.frame.size.width/8));
    }];
    
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backgroundView);
        make.right.equalTo(weakSelf.centerBtn.mas_left);
        make.width.equalTo(@(weakSelf.frame.size.width/8));
        make.height.equalTo(@(weakSelf.frame.size.width/4));
    }];
    
    [self.boomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backgroundView);
        make.top.equalTo(weakSelf.centerBtn.mas_bottom);
        make.width.equalTo(@(weakSelf.frame.size.width/4));
        make.height.equalTo(@(weakSelf.frame.size.width/8));
    }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backgroundView);
        make.left.equalTo(weakSelf.centerBtn.mas_right);
        make.width.equalTo(@(weakSelf.frame.size.width/8));
        make.height.equalTo(@(weakSelf.frame.size.width/4));
    }];
    
    [self.soundLowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_centerX).offset(-weakSelf.frame.size.width/16);
        make.top.equalTo(weakSelf.mas_top).offset(40);
        make.width.equalTo(@(weakSelf.frame.size.width/8));
        make.height.equalTo(@(weakSelf.frame.size.width/8));
    }];
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.soundLowBtn.mas_left).offset(-weakSelf.frame.size.width/8);
        make.top.equalTo(weakSelf.mas_top).offset(40);
        make.width.equalTo(@(weakSelf.frame.size.width/8));
        make.height.equalTo(@(weakSelf.frame.size.width/8));
    }];
    
    [self.soundBigBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_centerX).offset(weakSelf.frame.size.width/16);
        make.top.equalTo(weakSelf.mas_top).offset(40);
        make.width.equalTo(@(weakSelf.frame.size.width/8));
        make.height.equalTo(@(weakSelf.frame.size.width/8));
    }];
    
    [self.menuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.soundBigBtn.mas_right).offset(weakSelf.frame.size.width/8);
        make.top.equalTo(weakSelf.mas_top).offset(40);
        make.width.equalTo(@(weakSelf.frame.size.width/8));
        make.height.equalTo(@(weakSelf.frame.size.width/8));
    }];
    
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroundView.mas_bottom).offset(80);
        make.centerX.equalTo(weakSelf);
        make.width.equalTo(@(weakSelf.frame.size.width/5));
        make.height.equalTo(@(weakSelf.frame.size.width/9));
    }];
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroundView.mas_bottom).offset(80);
        make.right.equalTo(weakSelf.btn2.mas_left).offset(-weakSelf.frame.size.width/10);
        make.width.equalTo(@(weakSelf.frame.size.width/5));
        make.height.equalTo(@(weakSelf.frame.size.width/9));
    }];
    
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroundView.mas_bottom).offset(80);
        make.left.equalTo(weakSelf.btn2.mas_right).offset(weakSelf.frame.size.width/10);
        make.width.equalTo(@(weakSelf.frame.size.width/5));
        make.height.equalTo(@(weakSelf.frame.size.width/9));
    }];
    
    
    
    
    
}
- (UIButton *)centerBtn {
    if (!_centerBtn) {
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _centerBtn.tag = 101;
        [_centerBtn setTitle:@"OK"forState:UIControlStateNormal];
        [_centerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_centerBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_centerBtn];
    }
    return _centerBtn;
}

- (UIButton *)topBtn {
    if (!_topBtn) {
        _topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _topBtn.tag = 102;
        [_topBtn setImage:[UIImage imageNamed:@"less"] forState:UIControlStateNormal];
//        [_topBtn setTitle:@"top"forState:UIControlStateNormal];
        [_topBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_topBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_topBtn];
    }
    return _topBtn;
}


- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.tag = 103;
        [_leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//        [_leftBtn setTitle:@"left"forState:UIControlStateNormal];
        [_leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftBtn];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.tag = 104;
        [_rightBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
//        [_rightBtn setTitle:@"right"forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightBtn];
    }
    return _rightBtn;
}

- (UIButton *)boomBtn {
    if (!_boomBtn) {
        _boomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _boomBtn.tag = 105;
        [_boomBtn setImage:[UIImage imageNamed:@"more_unfold"] forState:UIControlStateNormal];
//        [_boomBtn setTitle:@"boom"forState:UIControlStateNormal];
        [_boomBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_boomBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_boomBtn];
    }
    return _boomBtn;
}

- (UIButton *)soundBigBtn {
    if (!_soundBigBtn) {
        _soundBigBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _soundBigBtn.tag = 111;
        [_soundBigBtn setImage:[UIImage imageNamed:@"big"] forState:UIControlStateNormal];
//        [_soundBigBtn setTitle:@"Big"forState:UIControlStateNormal];
        [_soundBigBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_soundBigBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _soundBigBtn.layer.masksToBounds = YES;
        _soundBigBtn.layer.cornerRadius = self.frame.size.width/16;
        _soundBigBtn.layer.borderColor = [UIColor grayColor].CGColor;
        _soundBigBtn.layer.borderWidth = 0.5;
        [self addSubview:_soundBigBtn];
    }
    return _soundBigBtn;
}

- (UIButton *)soundLowBtn {
    if (!_soundLowBtn) {
        _soundLowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _soundLowBtn.tag = 112;
        [_soundLowBtn setImage:[UIImage imageNamed:@"low"] forState:UIControlStateNormal];
//        [_soundLowBtn setTitle:@"low"forState:UIControlStateNormal];
        [_soundLowBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_soundLowBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _soundLowBtn.layer.masksToBounds = YES;
        _soundLowBtn.layer.cornerRadius = self.frame.size.width/16;
        _soundLowBtn.layer.borderColor = [UIColor grayColor].CGColor;
        _soundLowBtn.layer.borderWidth = 0.5;
        [self addSubview:_soundLowBtn];
    }
    return _soundLowBtn;
}

- (UIButton *)menuBtn {
    if (!_menuBtn) {
        _menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _menuBtn.tag = 113;
        [_menuBtn setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
//        [_menuBtn setTitle:@"menu"forState:UIControlStateNormal];
        [_menuBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_menuBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _menuBtn.layer.masksToBounds = YES;
        _menuBtn.layer.cornerRadius = self.frame.size.width/16;
        _menuBtn.layer.borderColor = [UIColor grayColor].CGColor;
        _menuBtn.layer.borderWidth = 0.5;
        [self addSubview:_menuBtn];
    }
    return _menuBtn;
}
- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.tag = 114;
        [_backBtn setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
//        [_backBtn setTitle:@"back"forState:UIControlStateNormal];
        [_backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.layer.masksToBounds = YES;
        _backBtn.layer.cornerRadius = self.frame.size.width/16;
        _backBtn.layer.borderColor = [UIColor grayColor].CGColor;
        _backBtn.layer.borderWidth = 0.5;
        [self addSubview:_backBtn];
    }
    return _backBtn;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.tag = 121;
        [_btn1 setTitle:@"xxx"forState:UIControlStateNormal];
        [_btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn1.layer.masksToBounds = YES;
        _btn1.layer.cornerRadius = 3;
        _btn1.layer.borderColor = [UIColor grayColor].CGColor;
        _btn1.layer.borderWidth = 0.5;
        [self addSubview:_btn1];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn2.tag = 122;
        [_btn2 setTitle:@"xxx"forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn2.layer.masksToBounds = YES;
        _btn2.layer.cornerRadius = 3;
        _btn2.layer.borderColor = [UIColor grayColor].CGColor;
        _btn2.layer.borderWidth = 0.5;
        [self addSubview:_btn2];
    }
    return _btn2;
}

- (UIButton *)btn3 {
    if (!_btn3) {
        _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn3.tag = 123;
        [_btn3 setTitle:@"xxx"forState:UIControlStateNormal];
        [_btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn3 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn3.layer.masksToBounds = YES;
        _btn3.layer.cornerRadius = 3;
        _btn3.layer.borderColor = [UIColor grayColor].CGColor;
        _btn3.layer.borderWidth = 0.5;
        [self addSubview:_btn3];
    }
    return _btn3;
}


- (void)clientAction: (UIButton *)btn {
    NSLog(@"%@",btn.titleLabel.text);
}

@end
