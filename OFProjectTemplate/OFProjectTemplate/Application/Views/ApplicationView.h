//
//  ApplicationView.h
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol applicationViewDelegate <NSObject>

-(void)applicationViewActionWithBtn:(UIButton *)btn;

@end

@interface ApplicationView : UIView

@property (nonatomic, weak) id <applicationViewDelegate>delegate;

@property (nonatomic, strong) UIButton *hotBtn1;
@property (nonatomic, strong) UIButton *hotBtn2;
@property (nonatomic, strong) UIButton *hotBtn3;

@end
