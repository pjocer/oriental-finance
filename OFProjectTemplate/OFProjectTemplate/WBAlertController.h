//
//  WBAlertController.h
//  UIButton
//
//  Created by 王 博 on 2017/3/29.
//  Copyright © 2017年 王 博. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void( ^ asd)(id response);

@interface WBAlertController : UIAlertController



+ (instancetype)initWBAlerControllerWithTitle:(NSString *)title message:(NSString *)message style:(NSString *)style titleArr:(NSMutableArray *)titleArr alerAction:(void (^)(NSInteger index))alerAction;

- (void)showWBAler;

@end
