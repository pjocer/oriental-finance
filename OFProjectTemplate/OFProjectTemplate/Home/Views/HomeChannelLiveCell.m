//
//  HomeChannelLiveCell.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "HomeChannelLiveCell.h"
#import "OFUIkitMacro.h"
#import "HoritalVideoCollectionCell.h"
#import <Masonry.h>
#import "HotTableViewCellViewModel.h"

@interface HomeChannelLiveCell ()
@property (nonatomic, strong) UIImageView *titleIcon;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *gapLabel;
@property (nonatomic, strong) UICollectionView *gridView;
@property (nonatomic, strong) HotTableViewCellViewModel *viewModel;
@end

@implementation HomeChannelLiveCell

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
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(10);
    }];
    [self.titleIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLabel);
        make.leading.mas_equalTo(12.5);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleIcon.mas_right).offset(13);
        make.top.equalTo(self.gapLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(22.5);
    }];
    [self.gridView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(11);
        make.left.right.bottom.equalTo(self.contentView);
    }];
    return self;
}

- (UILabel *)gapLabel {
    if (!_gapLabel) {
        _gapLabel = [UILabel new];
        _gapLabel.backgroundColor = DEFAULT_BG_COLOR;
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
        _titleLabel.font = UIFontMake(15);
        _titleLabel.text = @"频道直播";
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UICollectionView *)gridView {
    if (!_gridView) {
        _gridView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        _gridView.backgroundColor = [UIColor clearColor];
        _gridView.scrollEnabled = NO;
        _gridView.delegate = self.viewModel;
        _gridView.dataSource = self.viewModel;
        [_gridView registerClass:[HoritalVideoCollectionCell class] forCellWithReuseIdentifier:HoritalVideoCollectionCellIdentifier];
    }
    return _gridView;
}

- (HotTableViewCellViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HotTableViewCellViewModel alloc] initWithCellType:TableViewCellTypeLiving];
    }
    return _viewModel;
}

@end
