//
//  HotTableViewCell.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "HotTableViewCell.h"
#import "OFUIkitMacro.h"
#import "HotTableViewCellViewModel.h"
#import "VerticalVideoCollectionCell.h"
#import <Masonry.h>

@interface HotTableViewCell () 
@property (nonatomic, strong) UIImageView *titleIcon;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *gapLabel;
@property (nonatomic, strong) UICollectionView *gridView;
@property (nonatomic, strong) HotTableViewCellViewModel *viewModel;
@end

@implementation HotTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [[[self commitSubviews] subscribe] makeConstraints].selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (instancetype)commitSubviews {
    [self.contentView addSubview:self.gapLabel];
    [self.contentView addSubview:self.titleIcon];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.gridView];
    return self;
}

- (instancetype)subscribe {
    return self;
}

- (instancetype)makeConstraints {
    [self.gapLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.mas_equalTo(10);
    }];
    [self.titleIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gapLabel.mas_bottom).offset(8);
        make.leading.mas_equalTo(8);
        make.width.height.mas_equalTo(30);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleIcon.mas_right).offset(8);
        make.centerY.equalTo(self.titleIcon);
    }];
    [self.gridView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleIcon.mas_bottom).offset(8);
        make.leading.mas_equalTo(8);
        make.trailing.mas_equalTo(-8);
        make.bottom.mas_equalTo(-8);
    }];
    return self;
}

- (UILabel *)gapLabel {
    if (!_gapLabel) {
        _gapLabel = [UILabel new];
        _gapLabel.backgroundColor = [UIColor blueColor];
    }
    return _gapLabel;
}

- (UIImageView *)titleIcon {
    if (!_titleIcon) {
        _titleIcon = [UIImageView new];
        _titleIcon.image = ImageNamed(@"2048");
        _titleIcon.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _titleIcon;
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

- (UICollectionView *)gridView {
    if (!_gridView) {
        _gridView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        _gridView.backgroundColor = [UIColor clearColor];
        _gridView.delegate = self.viewModel;
        _gridView.dataSource = self.viewModel;
        _gridView.scrollEnabled = NO;
        [_gridView registerClass:[VerticalVideoCollectionCell class] forCellWithReuseIdentifier:VerticalVideoCollectionCellIdentifier];
    }
    return _gridView;
}

- (HotTableViewCellViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HotTableViewCellViewModel alloc] init];
    }
    return _viewModel;
}

@end