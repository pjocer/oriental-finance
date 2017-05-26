//
//  ApplicationView.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "ApplicationView.h"
#import <Masonry.h>


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
    titlelabel1.font = [UIFont systemFontOfSize:18];
    [self addSubview:titlelabel1];
    
    [titlelabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 15, 0, 0));
        make.height.equalTo(@30);
    }];
    
    hotView = [[UIScrollView alloc] init];
    hotView.contentSize = CGSizeMake(5*80 +6*15, 0);
    hotView.showsHorizontalScrollIndicator = NO;
    [self addSubview:hotView];
    
    [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titlelabel1.mas_bottom).offset(5);
        make.left.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.height.equalTo(@(weakSelf.superview.frame.size.height *0.21));
    }];
    
    for (NSInteger i = 0; i < 5; i++) {
        NSArray *arr = @[@"2048",@"b2",@"b3",@"b4",@"b1"];
        NSArray *arr2 = @[@"2048",@"电视管家",@"钱袋",@"闪惠",@"钉钉"];
        UIButton *hotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        hotBtn.tag = 100 + i;
        [hotBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [hotBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [hotBtn setImage:[UIImage imageNamed:[arr objectAtIndex:i]] forState:UIControlStateNormal];
        [hotBtn setBackgroundColor:[UIColor redColor]];
        hotBtn.layer.masksToBounds = YES;
        hotBtn.layer.cornerRadius = 20;
        [hotView addSubview:hotBtn];
        
        [hotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hotView.mas_left).offset(80 *i+15*(1+i));
            make.centerY.equalTo(hotView).offset(-10);
            make.width.equalTo(@80);
            make.height.equalTo(@80);
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = [arr2 objectAtIndex:i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        [hotView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hotView.mas_left).offset(80 *i+15*(1+i));
            make.centerX.equalTo(hotBtn);
            make.top.equalTo(hotBtn.mas_bottom).offset(5);
            make.width.equalTo(@80);
        }];
    }
    

    UILabel *titlelabel2 = [[UILabel alloc]init];
    titlelabel2.text = @"全部应用";
    titlelabel2.font = [UIFont systemFontOfSize:18];
    [self addSubview:titlelabel2];
    
    [titlelabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 15, 0, 0));
        make.top.equalTo(hotView.mas_bottom).offset(20);
        make.height.equalTo(@30);
    }];

    

    
    
}



-(void)initButton:(UIButton*)btn{
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.imageView.frame.size.height ,-btn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,btn.titleLabel.bounds.size.height, -btn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
}

- (void)clientAction: (UIButton *)btn {
    [self.delegate applicationViewActionWithBtn:btn];
}
@end
