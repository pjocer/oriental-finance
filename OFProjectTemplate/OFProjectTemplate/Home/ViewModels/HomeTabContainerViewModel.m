//
//  HomeTabContainerViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "HomeTabContainerViewModel.h"
#import <UIColor+QMUI.h>

@implementation HomeTabContainerViewModel

- (NSInteger)numberOfControllersInPagerController
{
    return 5;
}


- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index
{
    return @"Tab";
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index
{
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor qmui_randomColor];
    return vc;
}

@end
