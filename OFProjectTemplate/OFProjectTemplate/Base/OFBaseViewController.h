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

/**
 *  是否禁用滑动返回（默认启用）
 */
@property (nonatomic,assign) BOOL slideBackForbidden;
/**
 *  是否隐藏导航栏（默认为NO）
 */
@property (nonatomic,assign) BOOL hideNavgationBar;

- (instancetype)initWithTitle:(NSString *)title;

- (instancetype)initWithTitle:(NSString *)title
                   navBarBtns:(NavBarBtns)navBarBtns;

/**
 *  需要拦截NavBar的Back Action时，重写此方法。
 */
- (void)back NS_REQUIRES_SUPER;

/**
 *  Show Loading Toast
 */
- (void)startLoading;

/**
 *  Hidden Loading Toast
 */
- (void)stopLoading;

@end
