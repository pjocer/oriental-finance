//
//  MyView.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "MyView.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"


@implementation MyView{
    UIScrollView *scrollView;
}



- (void)drawRect:(CGRect)rect {
    [self addSubviews];
    
}

- (void)addSubviews {
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height)];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(0, SCREEN_HEIGHT +SCREEN_WIDTH/3 + 49);
    [self addSubview:scrollView];
    
    __weak MyView *weakSelf = self;
    [self.headerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView.mas_top).offset(30);
        make.centerX.equalTo(weakSelf);
        make.width.equalTo(@(150));
        make.height.equalTo(@(150));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.headerBtn.mas_bottom).offset(15);
        make.centerX.equalTo(weakSelf);
    }];
    
    [self.introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLabel.mas_bottom).offset(5);
        make.centerX.equalTo(weakSelf);
    }];
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLabel.mas_bottom).offset(40);
        make.left.equalTo(weakSelf);
        make.right.equalTo(weakSelf.mas_centerX).offset(0.25);
        make.height.equalTo(@80);
    }];
    
    UILabel *line1 = [[UILabel alloc] init];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line1];
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1.mas_top).offset(30);
        make.bottom.equalTo(self.btn1.mas_bottom).offset(-30);
        make.centerX.equalTo(self);
        make.width.equalTo(@1);
    }];
    
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLabel.mas_bottom).offset(40);
        make.right.equalTo(weakSelf).offset(-0.25);
        make.left.equalTo(weakSelf.mas_centerX);
        make.height.equalTo(@80);
    }];
    
    UILabel *line2 = [[UILabel alloc] init];
    line2.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0];
    [self addSubview:line2];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1.mas_bottom);
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@10);
    }];
    

    
    
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.btn1.mas_bottom).offset(20);
        make.left.equalTo(weakSelf);
        make.width.equalTo(@(weakSelf.frame.size.width/3));
        make.height.equalTo(@(weakSelf.frame.size.width/3));
    }];
    [self initButton:_btn3];
    
    [self.btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.btn1.mas_bottom).offset(20);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(0.25);
        make.width.equalTo(@(weakSelf.frame.size.width/3));
        make.height.equalTo(@(weakSelf.frame.size.width/3));
    }];
    [self initButton:_btn4];

    [self.btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.btn1.mas_bottom).offset(20);
        make.right.equalTo(weakSelf.mas_right);
        make.width.equalTo(@(weakSelf.frame.size.width/3));
        make.height.equalTo(@(weakSelf.frame.size.width/3));
    }];
    [self initButton:_btn5];


    [self.btn6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.btn3.mas_bottom).offset(-0.25);
        make.centerX.equalTo(weakSelf.btn3);
        make.size.equalTo(weakSelf.btn3);
    }];
    [self initButton:_btn6];

    [self.btn7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.btn6);
        make.centerX.equalTo(weakSelf.btn4);
        make.size.equalTo(weakSelf.btn4);
    }];
    [self initButton:_btn7];

    [self.btn8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.btn7);
        make.centerX.equalTo(weakSelf.btn5);
        make.size.equalTo(weakSelf.btn5);
    }];
    [self initButton:_btn8];
    
    [self.btn9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.btn6.mas_bottom).offset(-0.25);
        make.centerX.equalTo(weakSelf.btn3);
        make.size.equalTo(weakSelf.btn3);
    }];
    [self initButton:_btn9];
    
    [self.btn10 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.btn9);
        make.centerX.equalTo(weakSelf.btn4);
        make.size.equalTo(weakSelf.btn4);
    }];
    [self initButton:_btn10];
    
    [self.btn11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.btn9);
        make.centerX.equalTo(weakSelf.btn5);
        make.size.equalTo(weakSelf.btn5);
    }];
    [self initButton:_btn11];
    
    



    
    
    
}

- (UIButton *)headerBtn {
    if (!_headerBtn) {
        _headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headerBtn setImage:[UIImage imageNamed:@"Oval"] forState:UIControlStateNormal];
        _headerBtn.tag = 1001;
        [_headerBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_headerBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _headerBtn.layer.masksToBounds = YES;
        _headerBtn.layer.cornerRadius = 75;
        _headerBtn.layer.borderColor = [UIColor grayColor].CGColor;
        _headerBtn.layer.borderWidth = 0.5;
        [scrollView addSubview:_headerBtn];
    }
    return _headerBtn;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"东方有线电视";
        _nameLabel.font = [UIFont systemFontOfSize:15];
        [scrollView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)introductionLabel {
    if (!_introductionLabel) {
        _introductionLabel = [[UILabel alloc]init];
        _introductionLabel.text = @"东方有线电视欢迎您使用,好用得很!";
        _introductionLabel.font = [UIFont systemFontOfSize:13];
        [scrollView addSubview:_introductionLabel];
    }
    return _introductionLabel;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn1.tag = 101;
        [_btn1 setTitle:@"    家庭成员"forState:UIControlStateNormal];
        [_btn1 setImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
        [_btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn1 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn1.titleLabel.font = UIFontMake(13);
        [scrollView addSubview:_btn1];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn2.tag = 102;
        [_btn2 setTitle:@"    我的订单"forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn2.titleLabel.font = UIFontMake(13);
        [_btn2 setImage:[UIImage imageNamed:@"homepage"] forState:UIControlStateNormal];
        [scrollView addSubview:_btn2];
    }
    return _btn2;
}

- (UIButton *)btn3 {
    if (!_btn3) {
        _btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn3.tag = 111;
        [_btn3 setTitle:@"观看历史"forState:UIControlStateNormal];
        [_btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn3 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn3.titleLabel.font = UIFontMake(13);
        _btn3.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_btn3 setImage:[UIImage imageNamed:@"playon"] forState:UIControlStateNormal];
        [scrollView addSubview:_btn3];
    }
    return _btn3;
}

- (UIButton *)btn4 {
    if (!_btn4) {
        _btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn4.tag = 112;
        [_btn4 setTitle:@"我的预约"forState:UIControlStateNormal];
        [_btn4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn4 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn4.titleLabel.font = UIFontMake(13);
        [_btn4 setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
        [scrollView addSubview:_btn4];
    }
    return _btn4;
}


- (UIButton *)btn5 {
    if (!_btn5) {
        _btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn5.tag = 113;
        [_btn5 setTitle:@"我的收藏"forState:UIControlStateNormal];
        [_btn5 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn5 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn5.titleLabel.font = UIFontMake(13);
        [_btn5 setImage:[UIImage imageNamed:@"integral"] forState:UIControlStateNormal];
        [scrollView addSubview:_btn5];
    }
    return _btn5;
}

- (UIButton *)btn6 {
    if (!_btn6) {
        _btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn6.tag = 121;
        [_btn6 setTitle:@"我的应用"forState:UIControlStateNormal];
        [_btn6 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn6 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn6.titleLabel.font = UIFontMake(13);
        [scrollView addSubview:_btn6];
        [_btn6 setImage:[UIImage imageNamed:@"prompt"] forState:UIControlStateNormal];
    }
    return _btn6;
}

- (UIButton *)btn7 {
    if (!_btn7) {
        _btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn7.tag = 122;
        [_btn7 setTitle:@"我的地址"forState:UIControlStateNormal];
        [_btn7 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn7 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn7.titleLabel.font = UIFontMake(13);
        [_btn7 setImage:[UIImage imageNamed:@"redpacket"] forState:UIControlStateNormal];
        [scrollView addSubview:_btn7];
    }
    return _btn7;
}

- (UIButton *)btn8 {
    if (!_btn8) {
        _btn8 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn8.tag = 123;
        [_btn8 setTitle:@"绑定银行卡"forState:UIControlStateNormal];
        [_btn8 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn8 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:_btn8];
        _btn8.titleLabel.font = UIFontMake(13);
        [_btn8 setImage:[UIImage imageNamed:@"service"] forState:UIControlStateNormal];
    }
    return _btn8;
}

- (UIButton *)btn9 {
    if (!_btn9) {
        _btn9 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn9.tag = 131;
        [_btn9 setTitle:@"分享好友"forState:UIControlStateNormal];
        [_btn9 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn9 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn9.titleLabel.font = UIFontMake(13);
        [_btn9 setImage:[UIImage imageNamed:@"time"] forState:UIControlStateNormal];
        [scrollView addSubview:_btn9];
    }
    return _btn9;
}
- (UIButton *)btn10 {
    if (!_btn10) {
        _btn10 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn10.tag = 132;
        [_btn10 setTitle:@"我的电视"forState:UIControlStateNormal];
        [_btn10 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn10 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        _btn10.titleLabel.font = UIFontMake(13);
        [_btn10 setImage:[UIImage imageNamed:@"stealth"] forState:UIControlStateNormal];
        [scrollView addSubview:_btn10];
    }
    return _btn10;
}

- (UIButton *)btn11 {
    if (!_btn11) {
        _btn11 = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn11.tag = 133;
        [_btn11 setTitle:@"意见反馈"forState:UIControlStateNormal];
        [_btn11 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn11 addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [_btn11 setImage:[UIImage imageNamed:@"stealth"] forState:UIControlStateNormal];
        _btn11.titleLabel.font = UIFontMake(13);
        [scrollView addSubview:_btn11];
    }
    return _btn11;
}


-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height+15 ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,btn.titleLabel.bounds.size.height+15, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}

- (void)clientAction: (UIButton *)btn {
    [self.delegate myViewDelegateActionWithBtn:btn];
}
@end
