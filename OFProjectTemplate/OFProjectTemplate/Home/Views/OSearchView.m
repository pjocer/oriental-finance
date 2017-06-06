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

//@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) UIButton *searchbarsss;
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
//    [self addSubview:self.searchBar];
    [self addSubview:self.searchbarsss];
    [self addSubview:self.orderButton];
    return self;
}

- (instancetype)subscribe {
    WEAKSELF
//    [[self rac_signalForSelector:@selector(searchBarTextDidBeginEditing:) fromProtocol:@protocol(UISearchBarDelegate)] subscribeNext:^(id x) {
//        STRONGSELF
//        if (self.didSelectedAction) self.didSelectedAction(YES);
//    }];
    
    [[self.searchbarsss rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        STRONGSELF
        if (self.didSelectedAction) self.didSelectedAction(NO);
    }];
    
    [[self.orderButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
       STRONGSELF
        if (self.didSelectedAction) self.didSelectedAction(NO);
    }];
    
    return self;
}

- (instancetype)makeConstraints {
//    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.bottom.equalTo(self);
//        make.width.mas_equalTo(300);
//    }];
    
    [self.searchbarsss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self).insets(UIEdgeInsetsMake(7.5, 7.5, 7.5, 7.5));
        make.width.mas_equalTo(300);
    }];
    
    [self.orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.searchbarsss.mas_right).offset(8);
        make.top.bottom.equalTo(self.searchbarsss);
        make.right.equalTo(self).offset(-8);
    }];
    return self;
}

//- (UISearchBar *)searchBar {
//    if (!_searchBar) {
//        _searchBar = [UISearchBar new];
//        _searchBar.delegate = self;
//        [_searchBar setBarTintColor:[UIColor whiteColor]];
//        _searchBar.textField.backgroundColor = DEFAULT_BG_COLOR;
//        _searchBar.textField.layer.cornerRadius = 14;
//        _searchBar.textField.layer.masksToBounds = YES;
//        _searchBar.placeholder = @"欢乐颂";
//        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
//    }
//    return _searchBar;
//}

- (UIButton *)searchbarsss{
    if (!_searchbarsss) {
        _searchbarsss = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchbarsss.layer.cornerRadius  = 17.5;
        _searchbarsss.backgroundColor = UIColorMake(236, 236, 236);
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 260, 35)];
        label.text = @"观看欢乐颂";
        label.textColor = UIColorMake(149, 151, 150);
        label.font = UIFontMake(13);
        label.textAlignment = NSTextAlignmentLeft;
        [_searchbarsss addSubview:label];
        
        UIImageView *images = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_ appointment"]];
        images.frame = CGRectMake(260, 7.5, 20, 20);
        [_searchbarsss addSubview:images];
        
        
    }
    return _searchbarsss;
}



- (UIButton *)orderButton {
    if (!_orderButton) {
        _orderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _orderButton.layer.masksToBounds = YES;
        _orderButton.layer.cornerRadius = 14;
        _orderButton.titleLabel.font = UIFontMake(13);
        [_orderButton setTitle:@"预约" forState:UIControlStateNormal];
        [_orderButton setTitleColor:DEFAULT_TEXT_COLOR forState:UIControlStateNormal];
        [_orderButton setBackgroundColor:DEFAULT_BG_COLOR];
        UIImage *image = ImageNamed(@"home_ appointment");
        [_orderButton setImage:image forState:UIControlStateNormal];
        _orderButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_orderButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
        [_orderButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -60)];
    }
    return _orderButton;
}

@end
