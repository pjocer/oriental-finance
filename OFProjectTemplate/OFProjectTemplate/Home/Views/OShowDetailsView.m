//
//  OShowDetailsView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/5/26.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OShowDetailsView.h"
#import <Masonry.h>

@implementation OShowDetailsView {
    UIButton *dropDownBtn;
}


- (instancetype)init {
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    self.backgroundView.image = [UIImage imageNamed:@"1"];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.width*0.58));
    }];
    
    UIVisualEffectView *effectView =[[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    effectView.alpha = 0.8;
    effectView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.58);
    [self.backgroundView addSubview:effectView];
    
    
    self.coverImage.image = [UIImage imageNamed:@"1"];
    [self.coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.backgroundView).insets(UIEdgeInsetsMake(15, 20, 30, 0));
        make.width.equalTo(@(([UIScreen mainScreen].bounds.size.width*0.58 - 45)*3/4));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImage.mas_top).offset(10);
        make.left.equalTo(self.coverImage.mas_right).offset(10);
        make.right.equalTo(self.backgroundView.mas_right).offset(-10);
    }];
    
    [self.directorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(15);
        make.left.right.equalTo(self.nameLabel);
    }];
    
    [self.actorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.directorLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.nameLabel);
    }];
    
    [self.yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.actorLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.nameLabel);
    }];
    
    [self.playcount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yearLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.nameLabel);
    }];
    
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.playcount.mas_bottom).offset(10);
        make.left.right.equalTo(self.nameLabel);
    }];
    
    [self.platTVBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backgroundView.mas_bottom).offset(10);
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        make.height.equalTo(@35);
        
    }];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"简介";
    label.font = [UIFont systemFontOfSize:16];
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.platTVBtn.mas_bottom).offset(15);
        make.left.equalTo(self.platTVBtn);
    }];
    
    [self.introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(10);
        make.left.right.bottom.equalTo(self).insets(UIEdgeInsetsMake(0, 20, 55, 20));
    }];
    
    self.userInteractionEnabled = YES;
    

    
    CGFloat labelHeight = [self.introductionLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width-40, MAXFLOAT)].height;
    NSNumber *count = @((labelHeight) / self.introductionLabel.font.lineHeight);
    if ([count integerValue] > 3 ) {
        self.introductionLabel.numberOfLines = 3;
        dropDownBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [dropDownBtn setTitle:@"∨" forState:UIControlStateNormal];
        [dropDownBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        dropDownBtn.layer.cornerRadius = 5;
        dropDownBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        dropDownBtn.selected = NO;
        [dropDownBtn addTarget:self action:@selector(dropDownAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:dropDownBtn];
        
        [dropDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.introductionLabel.mas_bottom);
            make.left.right.equalTo(self.introductionLabel);
            make.height.equalTo(@30);
        }];
    }

    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"评论";
    label2.font = [UIFont systemFontOfSize:16];
    [self addSubview:label2];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dropDownBtn.mas_bottom);
        make.left.equalTo(self.platTVBtn);
    }];


    
    
    
    
    
}


- (void)dropDownAction:(UIButton *)btn {
    if (btn.selected == NO) {
        self.introductionLabel.numberOfLines = 0;
        [dropDownBtn setTitle:@"∧" forState:UIControlStateNormal];
        btn.selected = YES;
    }else{
        self.introductionLabel.numberOfLines = 3;
        [dropDownBtn setTitle:@"∨" forState:UIControlStateNormal];
        btn.selected = NO;
    }
    [self setNeedsLayout];
    [self setNeedsUpdateConstraints];
    [self layoutIfNeeded];
    NSLog(@"%f",btn.frame.origin.y);
    
    
}

- (UIImageView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc]init];
        _backgroundView.backgroundColor = [UIColor redColor];
        [self addSubview:_backgroundView];
    }
    return _backgroundView;
}

- (UIImageView *)coverImage {
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc]init];
        [self.backgroundView addSubview:_coverImage];
    }
    return _coverImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"欢乐颂第二季";
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.backgroundView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)directorLabel {
    if (!_directorLabel) {
        _directorLabel = [[UILabel alloc] init];
        _directorLabel.text = @"导演    王吉吉";
        _directorLabel.font = [UIFont systemFontOfSize:14];
        [self.backgroundView addSubview:_directorLabel];
    }
    return _directorLabel;
}

- (UILabel *)actorLabel {
    if (!_actorLabel) {
        _actorLabel = [[UILabel alloc] init];
        _actorLabel.text = @"演员    刘涛  王子文  杨紫  杨硕  阿萨德教   刘德华";
        _actorLabel.font = [UIFont systemFontOfSize:14];
        [self.backgroundView addSubview:_actorLabel];
    }
    return _actorLabel;
}

- (UILabel *)yearLabel {
    if (!_yearLabel) {
        _yearLabel = [[UILabel alloc] init];
        _yearLabel.text = @"年代    2016";
        _yearLabel.font = [UIFont systemFontOfSize:14];
        [self.backgroundView addSubview:_yearLabel];
    }
    return _yearLabel;
}

- (UILabel *)playcount {
    if (!_playcount) {
        _playcount = [[UILabel alloc] init];
        _playcount.text = @"播放    2016";
        _playcount.font = [UIFont systemFontOfSize:14];
        [self.backgroundView addSubview:_playcount];
    }
    return _playcount;
}

- (UILabel *)scoreLabel {
    if (!_scoreLabel) {
        _scoreLabel = [[UILabel alloc] init];
        _scoreLabel.text = @"评分    83.6分";
        _scoreLabel.font = [UIFont systemFontOfSize:14];
        [self.backgroundView addSubview:_scoreLabel];
    }
    return _scoreLabel;
}

- (UIButton *)platTVBtn {
    if (!_platTVBtn) {
        _platTVBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_platTVBtn setTitle:@"在电视机上播放" forState:UIControlStateNormal];
        _platTVBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:162/255.0 blue:65/255.0 alpha:1];
        _platTVBtn.layer.cornerRadius = 5;
        _platTVBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_platTVBtn];
    }
    return _platTVBtn;
}

- (UILabel *)introductionLabel {
    if (!_introductionLabel) {
        _introductionLabel = [[UILabel alloc] init];
        _introductionLabel.text = @"爱上都爱;大买咯三德科技爱马仕大排档;啦没收到收到叫什么等级评定猫爬架安排圣诞节马上地破解啊安排搜大家按平时大家平时都将阿萨德阿萨德跑搜到骄傲拍摄大片时代就安排都是;哦啊接收到爱普生大家按平时大家按平时大家安排多久啊谁都怕圣诞节阿婆说大家安排上的啊";
        _introductionLabel.numberOfLines = 0;
        _introductionLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_introductionLabel];
    }
    return _introductionLabel;
}




@end
