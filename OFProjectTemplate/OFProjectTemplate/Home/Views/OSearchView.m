//
//  OSearchView.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OSearchView.h"
#import "OFUIkitMacro.h"
#import <ReactiveCocoa.h>
#import <Masonry.h>

@interface OSearchView ()
//@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) UIButton *searchbarsss;
@property (nonatomic, strong) QMUIButton *orderButton;

@end

@implementation OSearchView

- (instancetype)init {
    if (self = [super init]) {
        [[[self commitSubviews] subscribe] makeConstraints].backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)commitSubviews {
//    [self addSubview:self.searchBar];
    [self addSubview:self.searchbarsss];
    [self addSubview:self.orderButton];
    return self;
}

- (instancetype)subscribe {
    WEAKSELF
    [[self.searchbarsss rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        STRONGSELF
        if (self.didSelectedAction) self.didSelectedAction(YES);
    }];
    
    [[self.orderButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
       STRONGSELF
        if (self.didSelectedAction) self.didSelectedAction(NO);
    }];
    
    return self;
}

- (instancetype)makeConstraints {
    
    
    
    [self.searchbarsss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(self).insets(UIEdgeInsetsMake(10, 7.5, 10, 93.5));
//        make.width.mas_equalTo(270);
    }];
    
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"观看欢乐颂";
    label.textColor = UIColorMake(149, 151, 150);
    label.font = UIFontMake(13);
    label.textAlignment = NSTextAlignmentLeft;
    [self.searchbarsss addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.searchbarsss).insets(UIEdgeInsetsMake(0, 10, 0, 30));
    }];
    
    UIImageView *images = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_search"]];
    images.contentMode = UIViewContentModeScaleAspectFit;
    [self.searchbarsss addSubview:images];
    [images mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.searchbarsss).insets(UIEdgeInsetsMake(7.5, 0, 7.5, 0));
        make.left.equalTo(label.mas_right);
    }];
    
    [self.orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.searchbarsss.mas_right).offset(8);
        make.top.bottom.equalTo(self.searchbarsss);
        make.right.equalTo(self).offset(-8);
    }];
    return self;
}

- (UIButton *)searchbarsss{
    if (!_searchbarsss) {
        _searchbarsss = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchbarsss.layer.cornerRadius  = 15;
        _searchbarsss.backgroundColor = UIColorMake(236, 236, 236);
       
        
        
    }
    return _searchbarsss;
}



- (QMUIButton *)orderButton {
    if (!_orderButton) {
        _orderButton = [[QMUIButton alloc] initWithImage:ImageNamed(@"home_ appointment") title:@"预约"];
        _orderButton.layer.masksToBounds = YES;
        _orderButton.layer.cornerRadius = 14;
        _orderButton.titleLabel.font = UIFontMake(13);
        [_orderButton setTitleColor:DEFAULT_TEXT_COLOR forState:UIControlStateNormal];
        [_orderButton setBackgroundColor:DEFAULT_BG_COLOR];
        _orderButton.spacingBetweenImageAndTitle = 3;
        _orderButton.imagePosition = QMUIButtonImagePositionRight;
    }
    return _orderButton;
}

@end
