//
//  VerticalVideoCollectionCell.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "VerticalVideoCollectionCell.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"
#import "OFHomeMacro.h"

@interface VerticalVideoCollectionCell ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) QMUIButton *appointment;

@property (nonatomic, strong) UIView *atMaskView;

@end

@implementation VerticalVideoCollectionCell

- (instancetype)init {
    if (self = [super init]) {
        [[[self commitSubviews] subscribe] makeConstraints];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [[[self commitSubviews] subscribe] makeConstraints];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [[[self commitSubviews] subscribe] makeConstraints];
    }
    return self;
}

- (instancetype)commitSubviews {
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.atMaskView];
    [self.contentView addSubview:self.appointment];
    return self;
}

- (instancetype)subscribe {
    return self;
}

- (instancetype)makeConstraints {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.mas_equalTo(VerticalVideoCellHeight-40);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(8);
        make.leading.mas_equalTo(10);
        make.height.mas_equalTo(16);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(2);
        make.leading.mas_equalTo(10);
        make.height.mas_equalTo(14);
    }];
    [self.appointment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.contentView);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(60);
    }];
    [self.atMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.appointment);
    }];
    return self;
}

- (void)setShouldShowAppointBtns:(BOOL)shouldShowAppointBtns {
    self.atMaskView.hidden = !shouldShowAppointBtns;
    self.appointment.hidden = self.atMaskView.isHidden;
}

- (UIView *)atMaskView {
    if (!_atMaskView) {
        _atMaskView = [UIView new];
        _atMaskView.backgroundColor = UIColorBlack;
        _atMaskView.alpha = 0.5;
        _atMaskView.hidden = YES;
    }
    return _atMaskView;
}

- (QMUIButton *)appointment {
    if (!_appointment) {
        _appointment = [[QMUIButton alloc] initWithImage:ImageNamed(@"home_ appointment") title:@"预约"];
        _appointment.imagePosition = QMUIButtonImagePositionRight;
        _appointment.spacingBetweenImageAndTitle = 5;
        _appointment.titleLabel.font = UIFontMake(10);
        [_appointment setTitleColor:UIColorWhite forState:UIControlStateNormal];
        _appointment.contentEdgeInsets = UIEdgeInsetsMake(6, 12, 6, 12);
        _appointment.hidden = YES;
    }
    return _appointment;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:ImageNamed(@"hhhh")];
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = UIFontMake(14);
        _titleLabel.text = @"欢乐颂2";
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = UIFontMake(11);
        _detailLabel.text = @"上演经典都市爱情";
        _detailLabel.textColor = [UIColor grayColor
                                  ];
    }
    return _detailLabel;
}

@end
