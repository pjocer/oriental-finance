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
#import "TeleplayViewController.h"
#import "ProjectViewController.h"
#import "VarietyViewController.h"
#import "TVViewController.h"
#import "OriNetworking.h"
#import "OFHomeMacro.h"

@interface HomeTabContainerViewModel ()
@property (nonatomic, strong) NSArray *titles;
@end

@implementation HomeTabContainerViewModel

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"当前热播",@"购物",@"电影",@"电视剧",@"综艺"];
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
    } else if (index == 1){
        TeleplayViewController *teleplay = [[TeleplayViewController alloc]init];
        return teleplay;
    } else if (index == 2){
        ProjectViewController *teleplay = [[ProjectViewController alloc]init];
        return teleplay;
    } else if (index == 3){
        VarietyViewController *teleplay = [[VarietyViewController alloc]init];
        return teleplay;
    } else if (index == 4){
        TVViewController *teleplay = [[TVViewController alloc]init];
        return teleplay;
    }
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor qmui_randomColor];
    return vc;
}

- (void)fetchCatelog:(void (^)(id))compeletion {
    [OriNetwork requestWithTarget:ShowCatelog params:nil success:^(NSURLSessionDataTask *task, id responseObject, BOOL success) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

@end
