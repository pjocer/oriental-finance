//
//  InformationInputView.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol InformationInputDelegate <NSObject>

-(void)InformationInputDelegate:(UIButton *)btn;
-(void)vailadCodeDelegate:(UIButton *)btn;

@end


@interface InformationInputView : UIView

@property (nonatomic, weak) id <InformationInputDelegate>delegate;

- (instancetype)initWithType:(NSString *)type num:(NSInteger)num;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UILabel *line;

@property (nonatomic, strong) UILabel *titleLabel2;

@property (nonatomic, strong) UITextField *textField2;

@property (nonatomic, strong) UILabel *line2;

@property (nonatomic, strong)UIButton *sureBtn;

@property (nonatomic, strong)UIButton *validationBtn;

@end
