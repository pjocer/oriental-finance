//
//  OShowHud.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

static const NSTimeInterval DEFAULT_HIDDEN_TIME = 1.5;
static const NSTimeInterval LONG_HIDDEN_TIME = 4.0;

@interface OShowHud : NSObject

#pragma mark - HUD
/**
 *  只有转圈
 *
 *  @param animated  <#animated description#>
 *  @param autoHiden 是否自动隐藏
 */
+ (void)showHudAnimated:(BOOL)animated autoHiden:(BOOL)autoHiden;

/**
 *  转圈+文字
 *
 *  @param info      <#info description#>
 *  @param animated  <#animated description#>
 *  @param autoHiden 是否自动隐藏
 */
+ (void)showHudWith:(NSString *)info animated:(BOOL)animated autoHiden:(BOOL)autoHiden;

/**
 *  只有文字，2s后自动隐藏
 *
 *  @param info     <#info description#>
 *  @param animated <#animated description#>
 */
+ (void)showErrorHudWith:(NSString *)info animated:(BOOL)animated;

/**
 *  隐藏HUD
 *
 *  @param animated <#animated description#>
 *
 */
+ (void)hideHudAnimated:(BOOL)animated;


+ (void)showHudWith:(NSString *)info mode:(MBProgressHUDMode)mode animated:(BOOL)animated autoHiden:(BOOL)autoHiden OnView:(UIView *)onView;

@end
