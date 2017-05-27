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

@interface OSearchView () <UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *orderButton;
@end

@implementation OSearchView

- (instancetype)init {
    if (self = [super init]) {
        [[[self commitSubviews] subscribe] makeConstraints].backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)commitSubviews {
    [self addSubview:self.searchBar];
    [self addSubview:self.orderButton];
    return self;
}

- (instancetype)subscribe {
    WEAKSELF
    [[self rac_signalForSelector:@selector(searchBarTextDidBeginEditing:) fromProtocol:@protocol(UISearchBarDelegate)] subscribeNext:^(id x) {
        STRONGSELF
        DLog(@"XXXXXXXXXXXXXXXXXX");
    }];
    
    [[self.orderButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
       STRONGSELF
        DLog(@"OOOOOOOOOOOOOOOOOO");
    }];
    
    return self;
}

- (instancetype)makeConstraints {
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(300);
    }];
    [self.orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.searchBar.mas_right).offset(5);
        make.right.top.bottom.equalTo(self);
    }];
    return self;
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [UISearchBar new];
        _searchBar.delegate = self;
        _searchBar.searchBarStyle = UISearchBarStyleDefault;
    }
    return _searchBar;
}

- (UIButton *)orderButton {
    if (!_orderButton) {
        _orderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_orderButton setBackgroundImage:ImageNamed(@"shouye") forState:UIControlStateNormal];
    }
    return _orderButton;
}

@end
