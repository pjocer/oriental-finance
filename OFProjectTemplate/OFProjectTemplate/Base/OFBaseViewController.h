//
//  OFBaseViewController.h
//  OFClient
//
//  Created by 吉冠虎 on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, NavBarBtns) {
    NavBarBtnNone = 0,
    NavBarBtnBack = 1UL << 0,//后退
};

@interface OFBaseViewController : UIViewController

- (instancetype)initWithTitle:(NSString *)title;

- (instancetype)initWithTitle:(NSString *)title
                   navBarBtns:(NavBarBtns)navBarBtns;

- (void)back;

- (void)startLoading;

- (void)stopLoading;

@end
