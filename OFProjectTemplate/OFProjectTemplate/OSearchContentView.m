//
//  OSearchContentView.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OSearchContentView.h"

@interface OSearchContentView ()
@property (nonatomic, strong) QMUIFloatLayoutView *floatLayoutView;
@property (nonatomic, strong) QMUIFloatLayoutView *hFloatLayoutView;
@property (nonatomic, strong) QMUILabel *hotSearch;
@property (nonatomic, strong) QMUIButton *clearBtn;
@property (nonatomic, strong) QMUILabel *searchHistory;
@end

@implementation OSearchContentView

- (instancetype)init {
    if (self = [super init]) {
        [[self commitSubviews] subscribe].backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (instancetype)subscribe {
    [[RACObserve(self, sources) combineLatestWith:RACObserve(self, histories)] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(NSArray *hot,NSArray *histories) = x;
        [self.floatLayoutView qmui_removeAllSubviews];
        [self.hFloatLayoutView qmui_removeAllSubviews];
        for (NSInteger i = 0; i < histories.count; i++) {
            QMUIGhostButton *button = [[QMUIGhostButton alloc] initWithGhostType:QMUIGhostButtonColorGray];
            [button setTitle:histories[i] forState:UIControlStateNormal];
            button.titleLabel.font = UIFontMake(14);
            button.contentEdgeInsets = UIEdgeInsetsMake(6, 20, 6, 20);
            [self.floatLayoutView addSubview:button];
        }
        for (NSInteger i = 0; i < hot.count; i++) {
            QMUIGhostButton *button = [[QMUIGhostButton alloc] initWithGhostType:QMUIGhostButtonColorGray];
            [button setTitle:hot[i] forState:UIControlStateNormal];
            button.titleLabel.font = UIFontMake(14);
            button.contentEdgeInsets = UIEdgeInsetsMake(6, 20, 6, 20);
            [self.hFloatLayoutView addSubview:button];
        }
    }];
    self.clearBtnSignal = [self.clearBtn rac_signalForControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (instancetype)commitSubviews {
    self.searchHistory = [[QMUILabel alloc] initWithFont:OFFont(15) textColor:UIColorBlack];
    self.searchHistory.text = @"搜索历史";
    [self addSubview:self.searchHistory];
    
    self.clearBtn = [[QMUIButton alloc] initWithImage:ImageNamed(@"tab_home_selected") title:nil];
    [self addSubview:self.clearBtn];
    
    self.floatLayoutView = [[QMUIFloatLayoutView alloc] init];
    self.floatLayoutView.itemMargins = UIEdgeInsetsMake(0, 0, 10, 10);
    self.floatLayoutView.minimumItemSize = CGSizeMake(69, 29);// 以2个字的按钮作为最小宽度
    [self addSubview:self.floatLayoutView];
    
    self.hotSearch = [[QMUILabel alloc] initWithFont:OFFont(15) textColor:UIColorBlack];
    self.hotSearch.text = @"大家都在搜";
    [self addSubview:self.hotSearch];
    
    self.hFloatLayoutView = [[QMUIFloatLayoutView alloc] init];
    self.hFloatLayoutView.itemMargins = UIEdgeInsetsMake(0, 0, 10, 10);
    self.hFloatLayoutView.minimumItemSize = CGSizeMake(69, 29);// 以2个字的按钮作为最小宽度
    
    [self addSubview:self.hFloatLayoutView];
    return self;
}

// QMUIKit不支持AutoLayout
- (void)layoutSubviews {
    [super layoutSubviews];
    self.searchHistory.frame = CGRectMake(10, 10, 100, 15);
    [self.clearBtn sizeToFit];
    self.clearBtn.center = CGPointMake(SCREEN_WIDTH-10-CGRectGetWidth(self.clearBtn.frame), self.searchHistory.center.y);
    CGSize fSize = [self.floatLayoutView sizeThatFits:CGSizeMake(SCREEN_WIDTH-20, CGFLOAT_MAX)];
    self.floatLayoutView.frame = CGRectMake(10, CGRectGetMaxY(self.searchHistory.frame)+10, fSize.width, fSize.height);
    self.hotSearch.frame = CGRectMake(10, CGRectGetMaxY(self.floatLayoutView.frame)+10, 100, 15);
    CGSize fhSize = [self.hFloatLayoutView sizeThatFits:CGSizeMake(SCREEN_WIDTH-20, CGFLOAT_MAX)];
    self.hFloatLayoutView.frame = CGRectMake(10, CGRectGetMaxY(self.hotSearch.frame)+10, fhSize.width, fhSize.height);
}

@end
