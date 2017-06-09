//
//  WBAlertController.m
//  UIButton
//
//  Created by 王 博 on 2017/3/29.
//  Copyright © 2017年 王 博. All rights reserved.
//

#import "WBAlertController.h"

@interface WBAlertController ()

@end

@implementation WBAlertController


+ (instancetype)initWBAlerControllerWithTitle:(NSString *)title message:(NSString *)message style:(NSString *)style titleArr:(NSMutableArray *)titleArr alerAction:(void (^)(NSInteger index))alerAction{
    
    if ([style isEqualToString:@"1"]) {
            WBAlertController *alert = [WBAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            for (NSInteger i = 0; i < titleArr.count; i++) {
                UIAlertAction *confirm = [UIAlertAction actionWithTitle:[titleArr objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    if (alerAction) {
                        alerAction(i);
                    }

                }];
                [alert addAction:confirm];
            }
            return alert;

    }else{
        WBAlertController *alert = [WBAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
        for (NSInteger i = 0; i < titleArr.count; i++) {
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:[titleArr objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if (alerAction) {
                    alerAction(i);
                }
                
            }];
            [alert addAction:confirm];
        }

        return alert;
    }
    
}

-(void)showWBAler{
    [[self getCurrentVC] presentViewController:self animated:YES completion:nil];
}
- (UIViewController *)viewBelongToController {
    
    //通过响应者链，取得此视图所在的视图控制器
    UIResponder *next = self.nextResponder;
    do {
        
        //判断响应者对象是否是视图控制器类型
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
        
    }while(next != nil);
    
    return nil;
}
//获取当前屏幕显示的ViewController
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    return result;
}


@end
