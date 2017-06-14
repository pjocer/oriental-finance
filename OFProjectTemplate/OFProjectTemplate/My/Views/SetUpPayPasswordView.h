//
//  SetUpPayPasswordView.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SetUpPayPasswordViewDelegate <NSObject>

-(void)SetUpPayPasswordViewwithbtn:(NSString *)password;

@end

@interface SetUpPayPasswordView : UIView


@property (nonatomic, weak) id <SetUpPayPasswordViewDelegate>delegate;

@property (nonatomic, strong) UIButton *nextBtn;




@end
