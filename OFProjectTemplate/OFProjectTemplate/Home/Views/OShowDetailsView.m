//
//  OShowDetailsView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/5/26.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OShowDetailsView.h"
#import <Masonry.h>

@implementation OShowDetailsView 

- (instancetype)init {
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}



- (void)addSubviews {
    self.backgroundView.image = [UIImage imageNamed:@"hhhh"];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.width*0.58));
    }];
    
    UIVisualEffectView *effectView =[[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.58);
    [self.backgroundView addSubview:effectView];
    
    
    self.coverImage.image = [UIImage imageNamed:@"hhhh"];
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




@end
