//
//  OShowHud.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OShowHud.h"
#import "OFUIkitMacro.h"

@interface OShowHud ()

@end

@implementation OShowHud
+ (void)showHudAnimated:(BOOL)animated autoHiden:(BOOL)autoHiden {
    [self hideHudAnimated:NO];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[OShowHud getTopWindow] animated:animated];
    hud.bezelView.color = [UIColor clearColor];
    hud.mode = MBProgressHUDModeIndeterminate;
    [hud setMinShowTime:0.2f];
    hud.userInteractionEnabled = YES;
    if (autoHiden) {
        [hud hideAnimated:YES afterDelay:DEFAULT_HIDDEN_TIME];
    }
}

+ (BOOL)isHudTextTooLong:(NSString *)hudText {
    return hudText.length > 10;
}


+ (CGFloat)showTimeWithText:(NSString *)hudText {
    if (hudText.length < 10) {
        return DEFAULT_HIDDEN_TIME;
    }else{
        return MIN(0.15 * hudText.length, LONG_HIDDEN_TIME);
    }
}

+ (void)showHudWith:(NSString *)info animated:(BOOL)animated autoHiden:(BOOL)autoHiden {
    [OShowHud showHudWith:info mode:MBProgressHUDModeIndeterminate animated:animated autoHiden:autoHiden];
}

+ (void)showHudWith:(NSString *)info mode:(MBProgressHUDMode)mode animated:(BOOL)animated autoHiden:(BOOL)autoHiden {
    [self hideHudAnimated:NO];
    if (!STRINGHASVALUE(info)) {
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[OShowHud getTopWindow] animated:animated];
    hud.mode = mode;
    if (info) {
        hud.detailsLabel.text = info;
    }
    [hud setMinShowTime:1.f];
    if (autoHiden) {
        [hud hideAnimated:YES afterDelay:[self showTimeWithText:info]];
    }
}

+ (void)showHudWith:(NSString *)info mode:(MBProgressHUDMode)mode animated:(BOOL)animated autoHiden:(BOOL)autoHiden OnView:(UIView *)onView {
    
    [self hideHudAnimated:NO];
    if (!STRINGHASVALUE(info)) {
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:nil == onView ? [OShowHud getTopWindow] : onView animated:animated];
    hud.mode = mode;
    
    if (info) {
        hud.detailsLabel.text = info;
    }
    [hud setMinShowTime:0.5f];
    if (autoHiden) {
        [hud hideAnimated:YES afterDelay:[self showTimeWithText:info]];
    }
}

+ (void)showErrorHudWith:(NSString *)info animated:(BOOL)animated {
    [OShowHud showHudWith:info mode:MBProgressHUDModeText animated:animated autoHiden:YES];
}

+ (void)hideHudAnimated:(BOOL)animated {
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:animated];
    NSArray *tmp = [UIApplication sharedApplication].windows;
    for (UIWindow *wd in tmp) {
        [MBProgressHUD hideHUDForView:wd animated:animated];
    }
}

+ (UIWindow *)getTopWindow {
    return [UIApplication sharedApplication].keyWindow;
}
@end
