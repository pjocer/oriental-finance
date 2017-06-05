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
//    backgroundView.layer.masksToBounds = YES;
//    backgroundView.layer.cornerRadius = 10;
//    backgroundView.layer.borderColor = [UIColor grayColor].CGColor;
//    backgroundView.layer.borderWidth = 0.5;
    backgroundView.transform = CGAffineTransformMakeRotation (M_PI_4);
    [self addSubview:backgroundView];
    
    
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(-80);
        make.width.equalTo(@(weakSelf.frame.size.width/2));
        make.height.equalTo(@(weakSelf.frame.size.width/2));
    }];
    
   
    [backgroundView addSubview:self.topBtn];
    [backgroundView addSubview:self.leftBtn];
    [backgroundView addSubview:self.rightBtn];
    [backgroundView addSubview:self.boomBtn];
    [backgroundView addSubview:self.centerBtn];
    
    
    [self.centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(backgroundView);
        make.width.equalTo(@(weakSelf.frame.size.width/4 + 6));
        make.height.equalTo(@(weakSelf.frame.size.width/4 + 6));
    }];
    
    [self.topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(backgroundView);
        make.bottom.equalTo(backgroundView.mas_centerY);
        make.right.equalTo(backgroundView.mas_centerX);
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
        make.left.equalTo(weakSelf.mas_left).offset(35);
        make.top.equalTo(weakSelf.boomBtn.mas_bottom).offset(77);
        make.width.equalTo(@(50));
        make.height.equalTo(@(50));
    }];
    
    [self.soundBigBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-35);
        make.top.equalTo(weakSelf.boomBtn.mas_bottom).offset(77);
        make.width.equalTo(@(50));
        make.height.equalTo(@(50));
    }];
    
    [self.homeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(35);
        make.top.equalTo(weakSelf.soundLowBtn.mas_bottom).offset(40);
        make.width.equalTo(@(50));
        make.height.equalTo(@(50));
    }];
    
    [self.exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-35);
        make.top.equalTo(weakSelf.soundBigBtn.mas_bottom).offset(40);
        make.width.equalTo(@(50));
        make.height.equalTo(@(50));
    }];
    

    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.homeBtn);
        make.centerX.equalTo(self);
        make.height.equalTo(@50);
        make.width.equalTo(@125);
    }];
    
    
    [self.textWriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeBtn.mas_centerX);
        make.bottom.equalTo(backgroundView.mas_top).offset(-40);
        make.height.equalTo(@55);
        make.width.equalTo(@100);
    }];
    
    [self.TVPayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.soundBigBtn.mas_centerX);
        make.bottom.equalTo(backgroundView.mas_top).offset(-40);
        make.height.equalTo(@55);
        make.width.equalTo(@100);
    }];
    



    
    
    
    
    
}
- (UIButton *)centerBtn {
    if (!_centerBtn) {
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _centerBtn.tag = 101;
//        _centerBtn.backgroundColor = [UIColor blackColor];
        [_centerBtn setImage:[UIImage imageNamed:@"remote_round"] forState:UIControlStateNormal];
        [_centerBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _centerBtn.layer.masksToBounds = YES;
        _centerBtn.layer.cornerRadius = SCREEN_WIDTH/8 +3;
        
    }
    return _centerBtn;
}

- (UIButton *)topBtn {
    if (!_topBtn) {
        _topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _topBtn.tag = 102;
        [_topBtn setImage:[UIImage imageNamed:@"remote_top"] forState:UIControlStateNormal];
        [_topBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_topBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topBtn;
}


- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.tag = 103;
        [_leftBtn setImage:[UIImage imageNamed:@"remote_down"] forState:UIControlStateNormal];
//        [_leftBtn setImage:[UIImage imageNamed:@"remote_left_seleted"] forState:UIControlStateHighlighted];
        [_leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.tag = 104;
        [_rightBtn setImage:[UIImage imageNamed:@"remote_right"] forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

- (UIButton *)boomBtn {
    if (!_boomBtn) {
        _boomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _boomBtn.tag = 105;
        [_boomBtn setImage:[UIImage imageNamed:@"remote_left"] forState:UIControlStateNormal];
        [_boomBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_boomBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _boomBtn;
}

- (UIButton *)soundBigBtn {
    if (!_soundBigBtn) {
        _soundBigBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _soundBigBtn.tag = 111;
        [_soundBigBtn setImage:[UIImage imageNamed:@"soundbig"] forState:UIControlStateNormal];
        [_soundBigBtn setBackgroundImage:[UIImage imageNamed:@"soundbig"] forState:UIControlStateNormal];
        [_soundBigBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        [_soundBigBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_soundBigBtn];
    }
    return _soundBigBtn;
}

- (UIButton *)soundLowBtn {
    if (!_soundLowBtn) {
        _soundLowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _soundLowBtn.tag = 112;
        [_soundLowBtn setImage:[UIImage imageNamed:@"soundlow"] forState:UIControlStateNormal];
//        [_soundLowBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_soundLowBtn];
    }
    return _soundLowBtn;
}

- (UIButton *)textWriteBtn {
    if (!_textWriteBtn) {
        _textWriteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _textWriteBtn.tag = 113;
        [_textWriteBtn setImage:[UIImage imageNamed:@"textWrite"] forState:UIControlStateNormal];
//        [_textWriteBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_textWriteBtn];
    }
    return _textWriteBtn;
}

- (UIButton *)TVPayBtn {
    if (!_TVPayBtn) {
        _TVPayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _TVPayBtn.tag = 113;
        [_TVPayBtn setImage:[UIImage imageNamed:@"TVpay"] forState:UIControlStateNormal];
//        [_TVPayBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_TVPayBtn];
    }
    return _TVPayBtn;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.tag = 114;
        [_backBtn setImage:[UIImage imageNamed:@"remote_back"] forState:UIControlStateNormal];
//        [_backBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
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
        [_homeBtn setImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
        [_homeBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_homeBtn];
    }
    return _homeBtn;
}

- (UIButton *)exitBtn {
    if (!_exitBtn) {
        _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _exitBtn.tag = 122;
        [_exitBtn setImage:[UIImage imageNamed:@"exit"] forState:UIControlStateNormal];
        [_exitBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_exitBtn];
    }
    return _exitBtn;
}




- (void)clientAction: (UIButton *)btn {
    NSLog(@"%ld",(long)btn.tag);
    [self.delegate remoteViewDelegate:btn];
    
}

@end
