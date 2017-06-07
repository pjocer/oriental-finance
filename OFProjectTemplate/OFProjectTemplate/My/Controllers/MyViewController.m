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

@interface MyViewController ()<myViewDelegate>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"个人中心";
    
    self.myView = [[MyView alloc]initWithFrame:self.view.frame];
    self.myView.backgroundColor = [UIColor whiteColor];
    self.myView.delegate = self;
    [self.view addSubview:self.myView];
}

- (void)myViewDelegateActionWithBtn:(UIButton *)btn{
    NSLog(@"%@",btn.titleLabel.text);
    if (btn.tag == 1001) {

        LoginViewController *login = [[LoginViewController alloc]initWithTitle:@"登录" navBarBtns:NavBarBtnBack];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:login];
        [self presentViewController:navc animated:YES completion:^{
            
        }];
    }else if (btn.tag == 101) {
        SetUpViewController *setup = [[SetUpViewController alloc]initWithTitle:@"设置" navBarBtns:NavBarBtnBack];
        setup.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:setup animated:YES];


    }else{
        OFBaseViewController *vc = [[OFBaseViewController alloc] initWithTitle:btn.titleLabel.text navBarBtns:NavBarBtnBack];
        vc.view.backgroundColor = [UIColor qmui_randomColor];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
   

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
