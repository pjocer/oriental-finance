//
//  AderView.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/6.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "AderView.h"
#import "OFUIkitMacro.h"
#import <ReactiveCocoa.h>

@interface AderView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *bornView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@end

@implementation AderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.bornView];
        [self addSubview:self.scrollView];
        [self.scrollView addSubview:self.textLabel];
        [self.scrollView addSubview:self.bottomLabel];
        [self subscribe];
    }
    return self;
}

- (void)subscribe {
    RACSignal *adsSignal = [RACObserve(self, ads) filter:^BOOL(id value) {
        return value!=nil;
    }];
    RACSignal *endDeceSignal = [self rac_signalForSelector:@selector(scrollViewDidEndScrollingAnimation:) fromProtocol:@protocol(UIScrollViewDelegate)];
    
    [adsSignal subscribeNext:^(NSArray *x) {
        self.textLabel.text = [x firstObject];
        self.bottomLabel.text = x[1];
        [[[[RACSignal interval:3 onScheduler:[RACScheduler mainThreadScheduler]] takeUntil:[self rac_willDeallocSignal]] startWith:[NSDate date]] subscribeNext:^(id x) {
            [self.scrollView setContentOffset:CGPointMake(0, CGRectGetHeight(self.bounds)) animated:YES];
        }];
    }];
    
    [endDeceSignal subscribeNext:^(id x) {
        static NSUInteger idx = 1;
        static NSUInteger tIdx = 2;
        CGRect top = self.textLabel.frame;
        CGRect bottom = self.bottomLabel.frame;
        self.bottomLabel.frame = top;
        self.textLabel.frame = bottom;
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        if (idx++%2) {
            self.textLabel.text = self.ads[tIdx];
        } else {
            self.bottomLabel.text = self.ads[tIdx];
        };
        tIdx = (tIdx!=self.ads.count-1?tIdx+1:0);
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
        self.ads = @[@"鹿晗跑男2大秀舞步，秒杀邓超",@"拜托了冰箱，看何尔萌怼死大张伟",@"生化危机6 最终章，Alex拯救世界"];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.bornView.frame = CGRectMake(18, CGPointGetCenterWithRect(self.bounds).y-6.5, 13, 13);
    self.scrollView.frame = CGRectMake(CGRectGetMaxX(self.bornView.frame)+14, 0, CGRectGetWidth(self.bounds)-18-8-14-13, CGRectGetHeight(self.bounds));
    self.textLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
    self.bottomLabel.frame = CGRectMake(0, CGRectGetMaxY(self.textLabel.frame), CGRectGetWidth(self.scrollView.bounds), CGRectGetHeight(self.scrollView.bounds));
}

- (UIImageView *)bornView {
    if (!_bornView) {
        _bornView = [[UIImageView alloc] initWithImage:ImageNamed(@"message")];
        _bornView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _bornView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds)-18-8-14-13, 60);
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = DEFAULT_TEXT_COLOR;
        _textLabel.text = @"鹿晗跑男2大秀舞步，秒杀邓超";
        _textLabel.font = UIFontMake(14);
        _textLabel.numberOfLines = 1;
    }
    return _textLabel;
}

- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.textColor = DEFAULT_TEXT_COLOR;
        _bottomLabel.text = @"拜托了冰箱，看何尔萌怼死大张伟";
        _bottomLabel.font = UIFontMake(14);
        _bottomLabel.numberOfLines = 1;
    }
    return _bottomLabel;
}

@end
