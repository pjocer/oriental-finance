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

@interface VerticalVideoCollectionCell ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation VerticalVideoCollectionCell

- (instancetype)init {
    if (self = [super init]) {
        [[[self commitSubviews] subscribe] makeConstraints];
    }
    return self;
}

- (instancetype)commitSubviews {
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    return self;
}

- (instancetype)subscribe {
    return self;
}

- (instancetype)makeConstraints {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(8);
        make.leading.mas_equalTo(8);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
        make.leading.mas_equalTo(8);
    }];
    return self;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:ImageNamed(@"1")];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = OFFont(15);
        _titleLabel.text = @"热播热播热播";
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = OFFont(13);
        _detailLabel.text = @"😝😋啦啦啦";
        _detailLabel.textColor = [UIColor lightGrayColor];
    }
    return _detailLabel;
}

@end
