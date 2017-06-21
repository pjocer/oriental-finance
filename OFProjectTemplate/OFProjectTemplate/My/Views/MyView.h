//
//  MyView.h
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol myViewDelegate <NSObject>

-(void)myViewDelegateActionWithBtn:(UIButton *)btn;

@end

@interface MyView : UIView

@property (nonatomic, weak) id <myViewDelegate>delegate;

@property (nonatomic, strong) UIButton *headerBtn;

@property (nonatomic, strong) UILabel *nameLabel;
//@property (nonatomic, strong) UILabel *introductionLabel;

//@property (nonatomic, strong) UIButton *btn1;
//@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UIButton *btn3;
@property (nonatomic, strong) UIButton *btn4;
@property (nonatomic, strong) UIButton *btn5;
@property (nonatomic, strong) UIButton *btn6;
@property (nonatomic, strong) UIButton *btn7;
@property (nonatomic, strong) UIButton *btn8;
@property (nonatomic, strong) UIButton *btn9;
@property (nonatomic, strong) UIButton *btn10;
@property (nonatomic, strong) UIButton *btn11;




@end
