//
//  AppDelegate.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/26.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "AppDelegate.h"
#import "OFUIkitMacro.h"
#import "HomeViewController.h"
#import "RemoteViewController.h"
#import "MyViewController.h"
#import "ApplicationViewController.h"
#import "ChannelViewController.h"


@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initRootViewController];
    return YES;
}


- (void)initRootViewController {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = self.rootController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

- (UITabBarController *)rootController {
    if (!_rootController) {
        _rootController = [[UITabBarController alloc] init];
        _rootController.delegate = self;
        _rootController.tabBar.barTintColor = [UIColor whiteColor];
        HomeViewController *home = [[HomeViewController alloc] initWithTitle:@"东方遥控宝" navBarBtns:NavBarBtnNone];
        ChannelViewController *channel = [[ChannelViewController alloc] initWithTitle:@"频道" navBarBtns:NavBarBtnNone];
        RemoteViewController *vc3 = [[RemoteViewController alloc] initWithTitle:@"遥控器" navBarBtns:NavBarBtnNone];
        ApplicationViewController *vc4 = [[ApplicationViewController alloc] initWithTitle:@"应用" navBarBtns:NavBarBtnNone];
        MyViewController *vc5 = [[MyViewController alloc] initWithTitle:@"我的" navBarBtns:NavBarBtnNone];
        
        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:home];
        UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:channel];
        UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
        UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
        UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:vc5];
        
        _rootController.viewControllers = @[ nav1, nav2, nav3, nav4, nav5 ];
        
        NSArray *titles = @[ @"推荐", @"频道", @"遥控器", @"应用", @"我的" ];
        NSArray *normalImages = @[ @"tab_home_normal", @"tab_channel_normal", @"tab_remote_normal", @"tab_application_normal", @"tab_my_normal" ];
        NSArray *selectedImages = @[ @"tab_home_selected", @"tab_channel_selected", @"tab_remote_selected", @"tab_application_selected", @"tab_my_selected" ];
        
        [_rootController.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
            item.title = titles[idx];
            [item setTitleTextAttributes:@{ NSForegroundColorAttributeName : HexColor(0x969696),
                                            NSFontAttributeName : OFFont(10.0) } forState:UIControlStateNormal];
            [item setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:237/255.0 green:73/255.0 blue:25/255.0 alpha:1],
                                            NSFontAttributeName : OFFont(10.0) } forState:UIControlStateSelected];
            
            UIImage *normalImage = [[UIImage imageNamed:normalImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UIImage *selectedImage = [[UIImage imageNamed:selectedImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            item.image = normalImage;
            item.selectedImage = selectedImage;
        }];
    }
    return _rootController;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
