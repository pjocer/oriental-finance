//
//  ConnectionEquipmentView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/9.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ConnectionEquipmentView.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"

@implementation ConnectionEquipmentView

- (instancetype)init {
    if (self = [super init]) {
        [self commitSubviews] ;
    }
    return self;
}

- (void)commitSubviews {
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = UIColorMake(236, 236, 236);
    [self addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@234.5);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor whiteColor];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 56.25;
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(35);
        make.width.equalTo(@112.5);
        make.height.equalTo(@112.5);
        make.centerX.equalTo(self);
    }];
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text = @"扫一扫\n添加机顶盒";
    label4.textColor = UIColorMake(51, 51, 51);
    label4.font = UIFontMake(16);
    label4.numberOfLines = 2;
    label4.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label4];
    
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(btn.mas_bottom).offset(15);
    }];
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"7"]];
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius = 7.5;
    [self addSubview:image];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).offset(29);
        make.left.equalTo(self.mas_left).offset(12.5);
        make.width.height.equalTo(@15);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"温馨提示";
    label.textColor = UIColorMake(51, 51, 51);
    label.font = UIFontMake(14);
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(image.mas_right).offset(8);
        make.centerY.equalTo(image);
    }];
    
    
    UILabel *dian1 = [[UILabel alloc]init];
    dian1.backgroundColor = UIColorMake(221, 221, 221);
    dian1.layer.masksToBounds = YES;
    dian1.layer.cornerRadius = 3;
    [self addSubview:dian1];
    
    [dian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(image.mas_bottom).offset(15);
        make.centerX.equalTo(image);
        make.width.height.equalTo(@6);
    }];
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"当前只支持东方有线设备";
    label1.textColor = UIColorMake(51, 51, 51);
    label1.font = UIFontMake(14);
    [self addSubview:label1];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_left);
        make.centerY.equalTo(dian1);
    }];
    
    UILabel *dian2 = [[UILabel alloc]init];
    dian2.backgroundColor = UIColorMake(221, 221, 221);
    dian2.layer.masksToBounds = YES;
    dian2.layer.cornerRadius = 3;
    [self addSubview:dian2];
    
    [dian2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dian1.mas_bottom).offset(15);
        make.centerX.equalTo(image);
        make.width.height.equalTo(@6);
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"请确保设备和手机在同一局域网环境下";
    label2.textColor = UIColorMake(51, 51, 51);
    label2.font = UIFontMake(14);
    [self addSubview:label2];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_left);
        make.centerY.equalTo(dian2);
    }];
    
    UILabel *dian3 = [[UILabel alloc]init];
    dian3.backgroundColor = UIColorMake(221, 221, 221);
    dian3.layer.masksToBounds = YES;
    dian3.layer.cornerRadius = 3;
    [self addSubview:dian3];
    
    [dian3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dian2.mas_bottom).offset(15);
        make.centerX.equalTo(image);
        make.width.height.equalTo(@6);
    }];
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @"请尝试使用扫一扫添加机顶盒";
    label3.textColor = UIColorMake(51, 51, 51);
    label3.font = UIFontMake(14);
    [self addSubview:label3];
    
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_left);
        make.centerY.equalTo(dian3);
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


- (void)btnAction{
    [self.delegate ConnectionEquipmentVDelegate];
}
@end
