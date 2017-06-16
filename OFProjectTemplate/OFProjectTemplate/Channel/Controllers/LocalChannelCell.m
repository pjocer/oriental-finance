//
//  LocalChannelCell.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "LocalChannelCell.h"
#import "OFUIkitMacro.h"
#import <Masonry.h>
#import <ReactiveCocoa.h>

@interface LocalChannelCell ()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIImageView *channelIconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) QMUIButton *playIconView;
@end

@implementation LocalChannelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [[[self commitSubviews] subscribe] makeConstraints].selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (instancetype)commitSubviews {
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.channelIconView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.playIconView];
    return self;
}

- (instancetype)subscribe {
    [[self.playIconView rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (self.playAction) self.playAction();
    }];
    return self;
}

- (instancetype)makeConstraints {
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(8);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(110);
    }];
    [self.channelIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(18);
        make.centerY.equalTo(self.iconView.mas_centerY).offset(-15);
        make.width.height.mas_equalTo(30);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.channelIconView.mas_right).offset(18);
        make.centerY.equalTo(self.channelIconView.mas_centerY);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.channelIconView);
        make.centerY.equalTo(self.iconView.mas_centerY).offset(15);
        
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.timeLabel);
    }];
    [self.playIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconView);
        make.trailing.mas_equalTo(-25);
        make.width.height.mas_equalTo(25);
    }];
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"东方卫视";
        _titleLabel.textColor = DEFAULT_TEXT_COLOR;
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = UIFontMake(16);
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.text = @"欢乐颂 - 第54集";
        _detailLabel.textColor = DEFAULT_TEXT_COLOR_GRAY;
        _detailLabel.numberOfLines = 1;
        _detailLabel.font = UIFontMake(12);
    }
    return _detailLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.backgroundColor = UIColorMake(216, 216, 216);
        _timeLabel.text = @" 08:15 ";
        _timeLabel.textColor = DEFAULT_TEXT_COLOR_GRAY;
        _timeLabel.font = UIFontMake(12);
        _timeLabel.layer.masksToBounds = YES;
        _timeLabel.layer.cornerRadius = 5.5f;
    }
    return _timeLabel;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        _iconView.image = ImageNamed(@"7");
    }
    return _iconView;
}

- (QMUIButton *)playIconView {
    if (!_playIconView) {
        _playIconView = [[QMUIButton alloc] initWithImage:ImageNamed(@"channel_play") title:nil];
    }
    return _playIconView;
}

- (UIImageView *)channelIconView {
    if (!_channelIconView) {
        _channelIconView = [UIImageView new];
        _channelIconView.contentMode = UIViewContentModeScaleAspectFit;
        _channelIconView.image = ImageNamed(@"channel_TV");
    }
    return _channelIconView;
}

@end
