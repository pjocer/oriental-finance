//
//  RemoteView.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "RemoteView.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"

@implementation RemoteView

- (void)drawRect:(CGRect)rect {
    [self addSubviews];
}


- (void)addSubviews {
    __weak RemoteView *weakSelf = self;
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.layer.masksToBounds = YES;
    backgroundView.layer.cornerRadius = 10;
    backgroundView.layer.borderColor = [UIColor grayColor].CGColor;
    backgroundView.layer.borderWidth = 0.5;
    backgroundView.transform = CGAffineTransformMakeRotation (M_PI_4);
    [self addSubview:backgroundView];
    
    
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(-80);
        make.width.equalTo(@(weakSelf.frame.size.width/2));
        make.height.equalTo(@(weakSelf.frame.size.width/2));
    }];
    
    [backgroundView addSubview:self.centerBtn];
    [backgroundView addSubview:self.topBtn];
    [backgroundView addSubview:self.leftBtn];
    [backgroundView addSubview:self.rightBtn];
    [backgroundView addSubview:self.boomBtn];
    
    
    [self.centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(backgroundView);
        make.width.equalTo(@(weakSelf.frame.size.width/4));
        make.height.equalTo(@(weakSelf.frame.size.width/4));
    }];
    
    [self.topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(backgroundView);
        make.bottom.equalTo(backgroundView.mas_centerY);
        make.right.equalTo(backgroundView.mas_centerX);
//        make.width.equalTo(@(weakSelf.frame.size.width/4));
//        make.height.equalTo(@(weakSelf.frame.size.width/8));
    }];
    
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(backgroundView);
        make.top.equalTo(backgroundView.mas_centerY);
        make.right.equalTo(backgroundView.mas_centerX);
    }];
    
    [self.boomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(backgroundView);
        make.top.equalTo(backgroundView.mas_centerY);
        make.left.equalTo(backgroundView.mas_centerX);
    }];
    
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(backgroundView);
        make.bottom.equalTo(backgroundView.mas_centerY);
        make.left.equalTo(backgroundView.mas_centerX);
    }];

    [self.soundLowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(25);
        make.top.equalTo(weakSelf.boomBtn.mas_bottom).offset(77);
        make.width.equalTo(@(40));
        make.height.equalTo(@(40));
    }];
    
    [self.soundBigBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-25);
        make.top.equalTo(weakSelf.boomBtn.mas_bottom).offset(77);
        make.width.equalTo(@(40));
        make.height.equalTo(@(40));
    }];
//
//    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(weakSelf.soundLowBtn.mas_left).offset(-weakSelf.frame.size.width/8);
//        make.top.equalTo(weakSelf.mas_top).offset(40);
//        make.width.equalTo(@(weakSelf.frame.size.width/8));
//        make.height.equalTo(@(weakSelf.frame.size.width/8));
//    }];
//    

//    
//    [self.menuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf.soundBigBtn.mas_right).offset(weakSelf.frame.size.width/8);
//        make.top.equalTo(weakSelf.mas_top).offset(40);
//        make.width.equalTo(@(weakSelf.frame.size.width/8));
//        make.height.equalTo(@(weakSelf.frame.size.width/8));
//    }];

    
    
    
    
    
}
- (UIButton *)centerBtn {
    if (!_centerBtn) {
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _centerBtn.tag = 101;
        [_centerBtn setTitle:@"OK"forState:UIControlStateNormal];
        [_centerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_centerBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _centerBtn.layer.masksToBounds = YES;
        _centerBtn.layer.cornerRadius = SCREEN_WIDTH/8;
//        [self addSubview:_centerBtn];
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
//        [self addSubview:_topBtn];
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
//        [self addSubview:_leftBtn];
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
//        [self addSubview:_rightBtn];
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
//        [self addSubview:_boomBtn];
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

- (UIButton *)homeBtn {
    if (!_homeBtn) {
        _homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _homeBtn.tag = 121;
        [_homeBtn setTitle:@"xxx"forState:UIControlStateNormal];
        [_homeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_homeBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _homeBtn.layer.masksToBounds = YES;
        _homeBtn.layer.cornerRadius = 3;
        _homeBtn.layer.borderColor = [UIColor grayColor].CGColor;
        _homeBtn.layer.borderWidth = 0.5;
        [self addSubview:_homeBtn];
    }
    return _homeBtn;
}

- (UIButton *)exitBtn {
    if (!_exitBtn) {
        _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _exitBtn.tag = 122;
        [_exitBtn setTitle:@"xxx"forState:UIControlStateNormal];
        [_exitBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_exitBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _exitBtn.layer.masksToBounds = YES;
        _exitBtn.layer.cornerRadius = 3;
        _exitBtn.layer.borderColor = [UIColor grayColor].CGColor;
        _exitBtn.layer.borderWidth = 0.5;
        [self addSubview:_exitBtn];
    }
    return _exitBtn;
}



- (void)clientAction: (UIButton *)btn {
    NSLog(@"%@",btn.titleLabel.text);
}

@end
