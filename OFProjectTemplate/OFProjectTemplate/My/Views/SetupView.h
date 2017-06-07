//
//  SetupView.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/7.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SetupViewDelegate <NSObject>

-(void)setupViewDelegateWithBtn:(UIButton *)btn;

@end

@interface SetupView : UIView

@property (nonatomic, weak) id <SetupViewDelegate>delegate;

@property (nonatomic, strong) UILabel *titlabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIButton *sureBtn;

@end
