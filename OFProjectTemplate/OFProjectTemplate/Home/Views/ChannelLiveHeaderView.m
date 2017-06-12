//
//  ChannelLiveHeaderView.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ChannelLiveHeaderView.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"

@interface ChannelLiveHeaderView ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@end

@implementation ChannelLiveHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [[[self commitSubviews] makeConstraints] subscribe];
    }
    return self;
}

- (instancetype)commitSubviews {
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.timeLabel];
    return self;
}

- (instancetype)makeConstraints {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(150);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(12);
        make.top.equalTo(self.imageView.mas_bottom).offset(2);
        make.height.mas_equalTo(23);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(12);
        make.bottom.equalTo(self).offset(-12);
    }];
    return self;
}

- (instancetype)subscribe {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tap];
    return self;
}

- (void)tapAction {
    if (self.clickAction) self.clickAction();
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:ImageNamed(@"6")];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView ;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"特工皇妃";
        _titleLabel.font = UIFontMake(18);
        _titleLabel.textColor = DEFAULT_TEXT_COLOR;
    }
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.text = @"已播出15:30:21";
        _timeLabel.textColor = DEFAULT_TEXT_COLOR_GRAY;
        _timeLabel.font = UIFontMake(13);
    }
    return _timeLabel;
}

@end
