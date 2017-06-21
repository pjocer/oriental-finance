//
//  AppDelegate.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/26.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "AppDelegate.h"
#import "OFUIkitMacro.h"
#import "HomeContainerController.h"
#import "RemoteViewController.h"
#import "MyViewController.h"
#import "ApplicationViewController.h"
#import "ChannelContainerController.h"
#import "SocialAnalysisManager.h"
#import "SocialShareManager.h"
#import "OVendorMacro.h"
#import "Godzippa.h"
#import "HBRSAHandler.h"
#import "LoginViewController.h"
#import "OriNetworking.h"
#import "AccountManager.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initRootViewController];
    //    [self socialConfiguration];
    return YES;
}

- (void)socialConfiguration {
    SocialRegisterItem *wechat = [[SocialRegisterItem alloc] initWithPlatform:SocialPlatformSina appKey:WX_APP_ID appSecret:WX_APP_Secret redirectURL:nil];
    SocialRegisterItem *sina = [[SocialRegisterItem alloc] initWithPlatform:SocialPlatformSina appKey:WB_APP_KEY appSecret:WB_APP_Secret redirectURL:WB_RedirectURL];
    SocialRegisterItem *qq = [[SocialRegisterItem alloc] initWithPlatform:SocialPlatformSina appKey:QQ_PLATFORM appSecret:nil redirectURL:nil];
    SocialRegisterModel *model = [[SocialRegisterModel alloc] init];
    model.appKey = UMENG_APP_KEY;
    model.platforms = @[wechat, sina, qq];
    [SocialAnalysisManager registerWithModel:model];
    [SocialShareManager sharedInstance].defaultImage = ImageNamed(@"b1");
    [SocialShareManager sharedInstance].defaultTitle = @"东方遥控宝";
    [SocialShareManager sharedInstance].defaultContent = @"万能的遥控宝@3！！%#%￥##@";
    [SocialShareManager sharedInstance].defaultLinkUrl = @"www.baidu.com";
    [SocialAnalysisManager openLog:UMengLogEnabled];
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
        _rootController.tabBar.backgroundColor = UIColorWhite;
        _rootController.tabBar.barTintColor = UIColorWhite;
        HomeContainerController *home = [[HomeContainerController alloc] initWithTitle:@"东方遥控宝" navBarBtns:NavBarBtnNone];
        ChannelContainerController *channel = [[ChannelContainerController alloc] initWithTitle:@"频道" navBarBtns:NavBarBtnNone];
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
        NSArray *normalImages = @[ @"tab_home_normal", @"tab_channel_normal", @"remote_sele", @"tab_application_normal", @"tab_my_normal" ];
        NSArray *selectedImages = @[ @"tab_home_selected", @"tab_channel_selected", @"remote_sele", @"tab_application_selected", @"tab_my_selected" ];
        
        [_rootController.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx != 2) {
                item.title = titles[idx];
                [item setTitleTextAttributes:@{ NSForegroundColorAttributeName : DEFAULT_TEXT_COLOR,
                                                NSFontAttributeName : UIFontMake(10.0) } forState:UIControlStateNormal];
                [item setTitleTextAttributes:@{ NSForegroundColorAttributeName : DEFAULT_TEXT_COLOR_SELECTED,
                                                NSFontAttributeName : UIFontMake(10.0) } forState:UIControlStateSelected];
            } else {
                item.title = nil;
                item.imageInsets = UIEdgeInsetsMake(-5, 0, 5, 0);
            }
            
            UIImage *normalImage = OriImageNamed(normalImages[idx]);
            UIImage *selectedImage = OriImageNamed(selectedImages[idx]);
            item.image = normalImage;
            item.selectedImage = selectedImage;
        }];
    }
    return _rootController;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigation = (UINavigationController *)viewController;
        if (navigation.viewControllers.count > 0 && [navigation.viewControllers.firstObject isKindOfClass:[MyViewController class]]) {
            LoginViewController *vc = [[LoginViewController alloc]init];
            UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
            [self.rootController presentViewController:navc animated:YES completion:^{
                AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                [delegate.rootController setSelectedIndex:4];
                
            }];
            return NO;
        }
    }
    return YES;
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
