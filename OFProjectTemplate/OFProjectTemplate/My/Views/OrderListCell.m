//
//  OrderListCell.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/16.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OrderListCell.h"
#import "OrderView.h"
#import <ReactiveCocoa.h>

@interface OrderListCell ()
@property (nonatomic, strong) UILabel *bottomLine;
@property (nonatomic, strong) UILabel *price;
@property (nonatomic, strong) UILabel *bottomGap;
@property (nonatomic, strong) QMUIGhostButton *ghostButton;
@property (nonatomic, strong) UIButton *fillButton;
@property (nonatomic, strong) MASConstraint *showGhost;
@end

@implementation OrderListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [[self commitSubviews] subscribe].selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)commitSubviews {
    UIView *temp = nil;
    for (int i = 0; i < 3; i++) {
        OrderView *view = [[OrderView alloc] init];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(12);
            make.right.equalTo(self.contentView).offset(-12);
            make.top.equalTo(temp?temp.mas_bottom:self.contentView).offset(10);
            make.height.mas_equalTo(100).priorityHigh();
        }];
        temp = view;
    }
    [self.contentView addSubview:self.bottomLine];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.right.equalTo(self.contentView).offset(-12);
        make.top.equalTo(temp?temp.mas_bottom:self.contentView).offset(15);
        make.height.mas_equalTo(0.5).priorityHigh();
    }];
    [self.contentView addSubview:self.price];
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomLine.mas_bottom).offset(5);
        make.right.equalTo(self.bottomLine);
    }];
    [self.contentView addSubview:self.fillButton];
    [self.fillButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.price.mas_bottom).offset(15).priorityHigh();
        make.right.equalTo(self.bottomLine);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    [self.contentView addSubview:self.ghostButton];
    [self.ghostButton mas_makeConstraints:^(MASConstraintMaker *make) {
        self.showGhost = make.right.equalTo(self.fillButton.mas_left).offset(-15).priority(UILayoutPriorityRequired);
        make.right.equalTo(self.bottomLine).priorityHigh();
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
        make.top.equalTo(self.price.mas_bottom).offset(15).priorityHigh();
    }];
    [self.showGhost deactivate];
    [self.contentView addSubview:self.bottomGap];
    [self.bottomGap mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.top.equalTo(self.ghostButton.mas_bottom).offset(10);
        make.height.mas_equalTo(10).priorityHigh();
    }];
    return self;
}

- (instancetype)subscribe {
    WEAKSELF
    [[RACObserve(self, type) skip:1] subscribeNext:^(id x) {
        STRONGSELF
        NSString *title = self.type==OrderListTypePending?@"立即付款":(self.type==OrderListTypeCompleted?@"确认收货":(self.type==OrderListTypeEvaluated?@"评价":@""));
        [self.fillButton setTitle:title forState:UIControlStateNormal];
    }];
    [[self rac_prepareForReuseSignal] subscribeNext:^(id x) {
        
    }];
    [RACObserve(self, type) subscribeNext:^(id x) {
        OrderListType type = [x integerValue];
        if (type == OrderListTypePending) {
            self.ghostButton.hidden = YES;
        }
        if (type == OrderListTypeShipment) {
            self.fillButton.hidden = YES;
        }
        if (type == OrderListTypeCompleted || type == OrderListTypeEvaluated) {
            self.ghostButton.hidden = NO;
            self.fillButton.hidden = NO;
            [self.showGhost activate];
        }
        
    }];
    return self;
}

- (UILabel *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UILabel alloc] init];
        _bottomLine.backgroundColor = DEFAULT_BOTTOM_LINE_COLOR;
    }
    return _bottomLine;
}

- (UILabel *)bottomGap {
    if (!_bottomGap) {
        _bottomGap = [[UILabel alloc] init];
        _bottomGap.backgroundColor = DEFAULT_BG_COLOR;
    }
    return _bottomGap;
}

- (UILabel *)price {
    if (!_price) {
        _price = [[UILabel alloc] init];
        _price.text = @"共2件商品 总计¥256.00";
        _price.textColor = DEFAULT_TEXT_COLOR;
        _price.font = UIFontMake(14);
    }
    return _price;
}

- (QMUIGhostButton *)ghostButton {
    if (!_ghostButton) {
        _ghostButton = [[QMUIGhostButton alloc] initWithGhostColor:DEFAULT_TEXT_COLOR_SELECTED];
        _ghostButton.cornerRadius = 3;
        _ghostButton.titleLabel.font = UIFontMake(14);
        [_ghostButton setTitle:@"追踪物流" forState:UIControlStateNormal];
    }
    return _ghostButton;
}

- (UIButton *)fillButton {
    if (!_fillButton) {
        _fillButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _fillButton.backgroundColor = DEFAULT_TEXT_COLOR_SELECTED;
        [_fillButton setTitleColor:UIColorWhite forState:UIControlStateNormal];
        _fillButton.titleLabel.font = UIFontMake(14);
        _fillButton.layer.cornerRadius = 3;
        _fillButton.layer.masksToBounds = YES;
    }
    return _fillButton;
}

@end
