//
//  MyOrderContainerViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyOrderContainerViewModel.h"
#import <UIColor+QMUI.h>
#import "OrderViewController.h"

@interface MyOrderContainerViewModel ()
@property (nonatomic, copy) NSArray *titles;
@end

@implementation MyOrderContainerViewModel
- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"全部",@"待支付",@"待发货",@"待收货",@"待评价"];
    }
    return _titles;
}

- (NSInteger)numberOfControllersInPagerController {
    return self.titles.count;
}

- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index {
    return self.titles[index];
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index {
    OrderViewController *vc = [[OrderViewController alloc] initWithControllerType:index];
    vc.view.backgroundColor = [UIColor qmui_randomColor];
    return vc;
}
@end
