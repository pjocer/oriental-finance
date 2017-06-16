//
//  RemoteView.h
//  OFClient
//
//  Created by wangdongwen on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RemoteViewDelegate <NSObject>

-(void)remoteViewDelegate:(UIButton *)btn;

@end

@interface RemoteView : UIView

@property (nonatomic, weak) id <RemoteViewDelegate>delegate;

@property (nonatomic, strong) UIButton *textWriteBtn;

@property (nonatomic, strong) UIButton *TVPayBtn;

@property (nonatomic, strong) UIButton *centerBtn;

@property (nonatomic, strong) UIButton *topBtn;

@property (nonatomic, strong) UIButton *leftBtn;

@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UIButton *boomBtn;

@property (nonatomic, strong) UIButton *soundBigBtn;

@property (nonatomic, strong) UIButton *soundLowBtn;


@property (nonatomic, strong) UIButton *backBtn;

@property (nonatomic, strong) UIButton *homeBtn;

@property (nonatomic, strong) UIButton *exitBtn;


@property (nonatomic, strong) UIButton *sweepBtn;


@end
