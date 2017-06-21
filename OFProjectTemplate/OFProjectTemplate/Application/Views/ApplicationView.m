//
//  ApplicationView.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "ApplicationView.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"


@implementation ApplicationView{
    UIScrollView *hotView;
}


- (void)drawRect:(CGRect)rect {
    [self addSubviews];
}

- (void)addSubviews {
    __weak ApplicationView *weakSelf = self;
    UILabel *titlelabel1 = [[UILabel alloc]init];
    titlelabel1.text = @"热门应用";
    titlelabel1.font = [UIFont systemFontOfSize:16];
    [self addSubview:titlelabel1];
    
    [titlelabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(13, 15, 0, 0));
        make.height.equalTo(@16);
    }];
    
    hotView = [[UIScrollView alloc] init];
    hotView.contentSize = CGSizeMake(5*80 +6*15, 0);
    hotView.showsHorizontalScrollIndicator = NO;
    [self addSubview:hotView];
    
    [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titlelabel1.mas_bottom).offset(5);
        make.left.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@(0.15*SCREEN_HEIGHT +16+15+5+5));
    }];
    
    for (NSInteger i = 0; i < 5; i++) {
        NSArray *arr = @[@"2048",@"b2",@"b3",@"b4",@"b1"];
        NSArray *arr2 = @[@"2048",@"电视管家",@"钱袋",@"闪惠",@"钉钉"];
        UIButton *hotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        hotBtn.tag = 100 + i;
        [hotBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [hotBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [hotBtn setImage:[UIImage imageNamed:[arr objectAtIndex:i]] forState:UIControlStateNormal];
        hotBtn.layer.masksToBounds = YES;
        hotBtn.layer.cornerRadius = 20;
        [hotView addSubview:hotBtn];
        
        [hotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hotView.mas_left).offset(0.13*SCREEN_HEIGHT *i+15*(1+i));
//            make.centerY.equalTo(hotView).offset(-10);
            make.top.equalTo(hotView.mas_top);
            make.width.equalTo(@(0.115*SCREEN_HEIGHT));
            make.height.equalTo(@(0.12*SCREEN_HEIGHT));
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = [arr2 objectAtIndex:i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        [hotView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(hotView.mas_left).offset(80 *i+15*(1+i));
            make.centerX.equalTo(hotBtn);
            make.top.equalTo(hotBtn.mas_bottom).offset(5);
            make.height.equalTo(@15);
            make.width.equalTo(hotBtn);
        }];
    }

    
    
}



- (void)clientAction: (UIButton *)btn {
//    [self.delegate applicationViewActionWithBtn:btn];
}
@end
