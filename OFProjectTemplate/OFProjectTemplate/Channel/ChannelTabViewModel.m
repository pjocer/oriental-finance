//
//  ChannelTabViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ChannelTabViewModel.h"
#import <UIColor+QMUI.h>
#import "LocalChannelController.h"

@interface ChannelTabViewModel ()
@property (nonatomic, strong) NSArray *titles;
@end

@implementation ChannelTabViewModel
- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"上海",@"卫视",@"央视",@"高清"];
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
        LocalChannelController *vc = [[LocalChannelController alloc] initWithTitle:@"上海"];
        return vc;
    }
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor qmui_randomColor];
    return vc;
}
@end
