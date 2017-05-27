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


- (void)drawRect:(CGRect)rect {
    [self addSubviews];
    
}

- (void)addSubviews {
    self.backgroundView.image = [UIImage imageNamed:@"1"];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@(self.frame.size.width*0.58));
    }];
    
    UIVisualEffectView *effectView =[[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    effectView.alpha = 0.9;
    effectView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width*0.58);
    [self.backgroundView addSubview:effectView];
    
    
    self.coverImage.image = [UIImage imageNamed:@"1"];
    [self.coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.backgroundView).insets(UIEdgeInsetsMake(15, 20, 30, 0));
        make.width.equalTo(@((self.frame.size.width*0.58 - 45)*3/4));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImage.mas_top);
        make.left.equalTo(self.coverImage.mas_right).offset(10);
        make.right.equalTo(self.backgroundView.mas_right).offset(10);
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
        [self addSubview:_coverImage];
    }
    return _coverImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"欢乐颂第二季";
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        [self addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)directorLabel {
    if (!_directorLabel) {
        _directorLabel = [[UILabel alloc] init];
        _directorLabel.text = @"导演    王吉吉";
        _directorLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_directorLabel];
    }
    return _directorLabel;
}

- (UILabel *)actorLabel {
    if (!_actorLabel) {
        _actorLabel = [[UILabel alloc] init];
        _actorLabel.text = @"演员    刘涛  王子文  杨紫  杨硕  阿萨德教   刘德华";
        _actorLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_actorLabel];
    }
    return _actorLabel;
}

- (UILabel *)yearLabel {
    if (!_yearLabel) {
        _yearLabel = [[UILabel alloc] init];
        _yearLabel.text = @"年代    2016";
        _yearLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_yearLabel];
    }
    return _yearLabel;
}

- (UILabel *)playcount {
    if (!_playcount) {
        _playcount = [[UILabel alloc] init];
        _playcount.text = @"年代    2016";
        _playcount.font = [UIFont systemFontOfSize:14];
        [self addSubview:_playcount];
    }
    return _playcount;
}




@end
