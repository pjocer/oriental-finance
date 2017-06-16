//
//  ChannelTabViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ChannelContainerViewModel.h"
#import "ChannelViewController.h"

@interface ChannelContainerViewModel ()
@property (nonatomic, strong) NSArray *titles;
@end

@implementation ChannelContainerViewModel
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
    ChannelViewController *vc = [[ChannelViewController alloc] initWithChannelType:index];
    return vc;
}
@end
