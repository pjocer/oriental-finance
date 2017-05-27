//
//  HomeTabContainerViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "HomeTabContainerViewModel.h"
#import <UIColor+QMUI.h>
#import "HotPlayController.h"

@interface HomeTabContainerViewModel ()
@property (nonatomic, strong) NSArray *titles;
@end

@implementation HomeTabContainerViewModel

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"当前热播",@"电视剧",@"专题",@"综艺",@"电视台"];
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
    if (index == 0) {
        HotPlayController *hot = [[HotPlayController alloc] init];
        return hot;
    }
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor qmui_randomColor];
    return vc;
}

@end
