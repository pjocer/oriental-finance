
//
//  SetUpPayPasswordView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SetUpPayPasswordView.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@implementation SetUpPayPasswordView{
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
    UILabel *label5;
    UILabel *label6;
    UITextField *textfield;
}

- (instancetype)init{
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{

    UILabel *label = [[UILabel alloc]init];
    label.font = UIFontMake(21);
    label.text = @"设置6位支付密码";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UIColorMake(51, 51, 51);
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self).insets(UIEdgeInsetsMake(22.5, 0, 0, 0));
    }];
    
    
    label1 = [[UILabel alloc]init];
    label1.font = UIFontMake(25);
//    label1.text = @"●";
    label1.tag = 101;
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = UIColorMake(236, 236, 236);
    [self addSubview:label1];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(33.5);
        make.left.equalTo(self.mas_left).offset(20);
        make.width.height.equalTo(@50);
    }];
    
    label2 = [[UILabel alloc]init];
    label2.font = UIFontMake(25);
//    label2.text = @"●";
    label2.tag = 102;
    label2.textAlignment = NSTextAlignmentCenter;
    label2.backgroundColor = UIColorMake(236, 236, 236);
    [self addSubview:label2];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(33.5);
        make.left.equalTo(label1.mas_right).offset(5);
        make.width.height.equalTo(@50);
    }];
    
    label3 = [[UILabel alloc]init];
    label3.font = UIFontMake(25);
//    label3.text = @"●";
    label3.tag = 103;
    label3.textAlignment = NSTextAlignmentCenter;
    label3.backgroundColor = UIColorMake(236, 236, 236);
    [self addSubview:label3];
    
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(33.5);
        make.left.equalTo(label2.mas_right).offset(5);
        make.width.height.equalTo(@50);
    }];
    
    label4 = [[UILabel alloc]init];
    label4.font = UIFontMake(25);
//    label4.text = @"●";
    label4.tag = 104;
    label4.textAlignment = NSTextAlignmentCenter;
    label4.backgroundColor = UIColorMake(236, 236, 236);
    [self addSubview:label4];
    
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(33.5);
        make.left.equalTo(label3.mas_right).offset(5);
        make.width.height.equalTo(@50);
    }];
    
    label5 = [[UILabel alloc]init];
    label5.font = UIFontMake(25);
//    label5.text = @"●";
    label5.tag = 105;
    label5.textAlignment = NSTextAlignmentCenter;
    label5.backgroundColor = UIColorMake(236, 236, 236);
    [self addSubview:label5];
    
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(33.5);
        make.left.equalTo(label4.mas_right).offset(5);
        make.width.height.equalTo(@50);
    }];
    
    label6 = [[UILabel alloc]init];
    label6.font = UIFontMake(25);
//    label6.text = @"●";
    label6.tag = 106;
    label6.textAlignment = NSTextAlignmentCenter;
    label6.backgroundColor = UIColorMake(236, 236, 236);
    [self addSubview:label6];
    
    [label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(33.5);
        make.left.equalTo(label5.mas_right).offset(5);
        make.width.height.equalTo(@50);
    }];
    
    
    
    textfield = [[UITextField alloc]init];
    textfield.backgroundColor = [UIColor clearColor];
    [textfield addTarget:self action:@selector(searchTextFieldChangeAction:)   forControlEvents:UIControlEventEditingChanged];
    textfield.tintColor =[UIColor clearColor];
    textfield.textColor =[UIColor clearColor];
    [self addSubview:textfield];
    
    [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.top.equalTo(label.mas_bottom).offset(33.5);
        make.height.equalTo(@50);
    }];
    
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    self.nextBtn.titleLabel.font = UIFontMake(16);
    self.nextBtn.backgroundColor = UIColorMake(229, 75, 20);
    self.nextBtn.layer.cornerRadius = 3;
    [self.nextBtn addTarget:self action:@selector(clientAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.nextBtn];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label5.mas_bottom).offset(59.5);
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 12.5, 0, 12.5));
        make.height.equalTo(@44);
    }];
    
}

- (void)clientAction{
    [self.delegate SetUpPayPasswordViewwithbtn:textfield.text];
}

- (void)searchTextFieldChangeAction: (UITextField *)text
{
    if ([text.text length] == 0 ){
        label1.text = @"";
        label2.text = @"";
        label3.text = @"";
        label4.text = @"";
        label5.text = @"";
        label6.text = @"";
    }else if ([text.text length] == 1){
        label1.text = @"*";
        label2.text = @"";
        label3.text = @"";
        label4.text = @"";
        label5.text = @"";
        label6.text = @"";
        
    }else if ([text.text length] == 2){
        label1.text = @"*";
        label2.text = @"*";
        label3.text = @"";
        label4.text = @"";
        label5.text = @"";
        label6.text = @"";
        
    }else if ([text.text length] == 3){
        label1.text = @"*";
        label2.text = @"*";
        label3.text = @"*";
        label4.text = @"";
        label5.text = @"";
        label6.text = @"";
        
    }else if ([text.text length] == 4){
        label1.text = @"*";
        label2.text = @"*";
        label3.text = @"*";
        label4.text = @"*";
        label5.text = @"";
        label6.text = @"";
        
    }else if ([text.text length] == 5){
        label1.text = @"*";
        label2.text = @"*";
        label3.text = @"*";
        label4.text = @"*";
        label5.text = @"*";
        label6.text = @"";
        
    }else if ([text.text length] == 6){
        label1.text = @"*";
        label2.text = @"*";
        label3.text = @"*";
        label4.text = @"*";
        label5.text = @"*";
        label6.text = @"*";
        
    }
    if ([text.text length] > 6) {
        text.text = [text.text substringToIndex:6];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [textfield resignFirstResponder];
}
@end
