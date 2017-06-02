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

//static NSInteger rowHeight = HotTableViewCellRowHeight;

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
//    self.backgroundColor = [UIColor greenColor];
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
    return self;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:ImageNamed(@"1")];
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = OFFont(14);
        _titleLabel.text = @"热播热播热播";
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = OFFont(11);
        _detailLabel.text = @"嗯嗯嗯嗯嗯";
        _detailLabel.textColor = [UIColor grayColor
                                  ];
    }
    return _detailLabel;
}

@end
