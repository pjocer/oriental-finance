//
//  HotTableViewCell.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "HomeVerticalTableViewCell.h"
#import "OFUIkitMacro.h"
#import "HotTableViewCellViewModel.h"
#import "VerticalVideoCollectionCell.h"
#import <Masonry.h>
#import <ReactiveCocoa.h>

@interface HomeVerticalTableViewCell ()
@property (nonatomic, strong) UIImageView *titleIcon;
@property (nonatomic, strong) QMUIButton *refreshButton;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *gapLabel;
@property (nonatomic, strong) UICollectionView *gridView;
@property (nonatomic, strong) HotTableViewCellViewModel *viewModel;
@end

@implementation HomeVerticalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [[[self commitSubviews] subscribe] makeConstraints].selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (instancetype)commitSubviews {
    [self.contentView addSubview:self.gapLabel];
    [self.contentView addSubview:self.titleIcon];
    [self.contentView addSubview:self.refreshButton];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.gridView];
    return self;
}

- (instancetype)subscribe {
    [[self.viewModel rac_signalForSelector:@selector(collectionView:didSelectItemAtIndexPath:) fromProtocol:@protocol(UICollectionViewDelegate)] subscribeNext:^(RACTuple *x) {
        if (_block) _block(TableViewSelectTypeHot, nil);
    }];
    [[self.refreshButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        if (_block) _block(TableViewSelectTypeRefresh, nil);
    }];
    return self;
}

- (instancetype)makeConstraints {
    [self.gapLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.mas_equalTo(10);
    }];
    [self.titleIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gapLabel.mas_bottom).offset(8);
        make.leading.mas_equalTo(13);
        make.width.height.mas_equalTo(17);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleIcon.mas_right).offset(8);
        make.centerY.equalTo(self.titleIcon);
    }];
    [self.refreshButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleIcon);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    [self.gridView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleIcon.mas_bottom).offset(8);
        make.leading.mas_equalTo(0);
        make.trailing.mas_equalTo(0);
        make.bottom.mas_equalTo(-8);
    }];
    
    return self;
}

- (void)setShouldShowAppointBtn:(BOOL)shouldShowAppointBtn {
    _shouldShowAppointBtn = shouldShowAppointBtn;
    self.viewModel.shouldShowAppointBtn = self.shouldShowAppointBtn;
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
        _titleIcon.image = ImageNamed(@"home_hotplay");
        _titleIcon.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _titleIcon;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = UIFontMake(15);
        _titleLabel.text = @"正在热播";
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (QMUIButton *)refreshButton {
    if (!_refreshButton) {
        _refreshButton = [[QMUIButton alloc] initWithImage:[ImageNamed(@"home_F5") qmui_imageWithScaleToSize:CGSizeMake(11, 11)] title:@"换一批"];
        _refreshButton.spacingBetweenImageAndTitle = 5;
        [_refreshButton setTitleColor:DEFAULT_TEXT_COLOR_GRAY forState:UIControlStateNormal];
        _refreshButton.titleLabel.font = UIFontMake(14);
    }
    return _refreshButton;
    
}

- (UICollectionView *)gridView {
    if (!_gridView) {
        _gridView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        _gridView.backgroundColor = [UIColor clearColor];
        _gridView.delegate = self.viewModel;
        _gridView.dataSource = self.viewModel;
        _gridView.scrollEnabled = NO;
        [_gridView registerClass:[VerticalVideoCollectionCell class] forCellWithReuseIdentifier:VerticalVideoCollectionCellIdentifier];
        [_gridView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"123"];
    }
    return _gridView;
}

- (HotTableViewCellViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HotTableViewCellViewModel alloc] initWithCellType:TableViewCellTypeHot];
    }
    return _viewModel;
}

@end
