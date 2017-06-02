//
//  LoginView.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol loginViewDelegate <NSObject>

-(void)loginViewDelegate:(UIButton *)btn;

@end

@interface LoginView : UIView

@property (nonatomic, weak) id <loginViewDelegate>delegate;


@property (nonatomic, strong)UIButton *forgotPasswordbBtn;

@property (nonatomic, strong)UIButton *registeredBtn;

@property (nonatomic, strong)UIButton *QQBtn;

@property (nonatomic, strong)UIButton *WeChatBtn;

@property (nonatomic, strong)UIButton *sinaBtn;



@end
