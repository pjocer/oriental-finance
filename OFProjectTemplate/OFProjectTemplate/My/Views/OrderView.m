//
//  OrderView.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/16.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OrderView.h"

@interface OrderView ()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *options;

@property (nonatomic, strong) UILabel *price;

@property (nonatomic, strong) UILabel *number;

@end

@implementation OrderView

- (instancetype)init {
    if (self = [super init]) {
        [[[self commitSubviews] makeConstriants] subscribe];
    }
    return self;
}

- (instancetype)commitSubviews {
    [self addSubview:self.iconView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.options];
    [self addSubview:self.price];
    [self addSubview:self.number];
    return self;
}

- (instancetype)makeConstriants {
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self);
        make.width.equalTo(self.mas_height);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) { //0x7fb129cd9500
        make.left.equalTo(self.iconView.mas_right).offset(10);
        make.top.right.equalTo(self);
    }];
    [self.options mas_makeConstraints:^(MASConstraintMaker *make) { //0x7fb129cd9790
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(3);
    }];
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) { //0x7fb129cd24f0
        make.right.equalTo(self);
        make.top.equalTo(self.options.mas_bottom);
    }];
    [self.number mas_makeConstraints:^(MASConstraintMaker *make) { //0x7fb129cd24f0
        make.right.equalTo(self);
        make.top.equalTo(self.price.mas_bottom).offset(3);
    }];
    return self;
}

- (instancetype)subscribe {
    return self;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithImage:ImageNamed(@"16")];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = UIFontMake(14);
        _titleLabel.textColor = DEFAULT_TEXT_COLOR;
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"杜鹃同款对白新款春装时尚撞色潮流穿搭2017高档雪纺连衣裙";
    }
    return _titleLabel;
}

- (UILabel *)options {
    if (!_options) {
        _options = [UILabel new];
        _options.font = UIFontMake(12);
        _options.textColor = DEFAULT_TEXT_COLOR_GRAY;
        _options.numberOfLines = 0;
        _options.text = @"颜色：白色；尺寸：XXL";
    }
    return _options;
}

- (UILabel *)price {
    if (!_price) {
        _price = [UILabel new];
        _price.font = UIFontMake(16);
        _price.textColor = UIColorMakeWithRGBA(247, 85, 85, 0.91);
        _price.text = @"￥128.00";
    }
    return _price;
}

- (UILabel *)number {
    if (!_number) {
        _number = [UILabel new];
        _number.font = UIFontMake(12);
        _number.textColor = DEFAULT_TEXT_COLOR_GRAY;
        _number.text = @"× 1";
    }
    return _number;
}

@end
