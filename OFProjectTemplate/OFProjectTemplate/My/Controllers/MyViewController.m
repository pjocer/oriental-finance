//
//  MyViewController.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "MyViewController.h"
#import "OFUIkitMacro.h"
#import "LoginViewController.h"
#import "SetUpViewController.h"
#import "MyTVViewController.h"
#import "FamilyViewController.h"
#import "MyCollectionVC.h"
#import "PlayHistoryVC.h"
#import "MessageViewController.h"
#import "ShareMenu.h"
#import "MyApplicationVC.h"
#import "MyAddressVC.h"
#import "MyBankCardVC.h"
#import "MyOrderContainer.h"

@interface MyViewController ()<myViewDelegate>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"个人中心";
    [self initNavigationBar];
    
    self.myView = [[MyView alloc]initWithFrame:self.view.frame];
    self.myView.backgroundColor = [UIColor whiteColor];
    self.myView.delegate = self;
    [self.view addSubview:self.myView];
}

- (void)myViewDelegateActionWithBtn:(UIButton *)btn{
    NSLog(@"%@",btn.titleLabel.text);
    if (btn.tag == 101) {
        FamilyViewController *vc = [[FamilyViewController alloc] initWithTitle:@"家庭成员" navBarBtns:NavBarBtnBack];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];


    } else if (btn.tag == 102) {
        MyOrderContainer *vc = [[MyOrderContainer alloc] initWithTitle:@"我的订单" navBarBtns:NavBarBtnBack];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btn.tag == 111) {
        PlayHistoryVC *vc = [[PlayHistoryVC alloc]initWithTitle:@"播放历史" navBarBtns:NavBarBtnBack];
        vc.type =  @"History";
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (btn.tag == 112) {
        PlayHistoryVC *vc = [[PlayHistoryVC alloc]initWithTitle:@"我的预约" navBarBtns:NavBarBtnBack];
        vc.type =  @"Appointment";
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (btn.tag == 113) {
        MyCollectionVC *vc = [[MyCollectionVC alloc]initWithTitle:@"我的收藏" navBarBtns:NavBarBtnBack];
//        vc.type =  @"Collection";
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (btn.tag == 121) {
        MyTVViewController *vc = [[MyTVViewController alloc]initWithTitle:@"我的电视" navBarBtns:NavBarBtnBack];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (btn.tag == 122) {
        MyAddressVC *vc = [[MyAddressVC alloc]initWithTitle:@"我的地址" navBarBtns:NavBarBtnBack];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (btn.tag == 123) {
        MyBankCardVC *vc = [[MyBankCardVC alloc]initWithTitle:@"我的银行卡" navBarBtns:NavBarBtnBack];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if (btn.tag == 131) {
        [ShareMenu showDefaultTypesWithStyle:ShareMenuStyleBorderCancel compeletion:^(ShareMenuItemView *item) {
            
        } canceled:^{
            
        }];
        
    } else if (btn.tag == 132) {
        
    } else if (btn.tag == 133) {

        NSURL *url = [NSURL URLWithString:@"telprompt://10010"];
        [[UIApplication sharedApplication] openURL:url];
    }
    
   

}



- (void)initNavigationBar {
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *left = [QMUINavigationButton barButtonItemWithImage:OriImageNamed(@"setup") position:QMUINavigationButtonPositionLeft target:self action:@selector(pushSetup)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 25, 25);
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [btn setImage:[UIImage imageNamed:@"home_xiaoxi"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushMessage) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSeperator2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator2.width = -5;

    self.navigationItem.rightBarButtonItems = @[negativeSeperator2, buttonItem2];
    
}
- (void)pushSetup {
    SetUpViewController *setup = [[SetUpViewController alloc] initWithTitle:@"设置" navBarBtns:NavBarBtnBack];
    setup.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setup animated:YES];

}
- (void)pushMessage {
    MessageViewController *setup = [[MessageViewController alloc]initWithTitle:@"消息" navBarBtns:NavBarBtnBack];
    setup.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setup animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
