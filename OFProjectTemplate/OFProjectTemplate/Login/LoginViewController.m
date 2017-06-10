//
//  LoginViewController.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "LoginViewController.h"
#import "InformationInputView.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "LoginView.h"
#import "RegisteredViewController.h"
#import "AppDelegate.h"
#import "MacorLogin.h"
#import "OriNetworking.h"


@interface LoginViewController ()<loginViewDelegate, InformationInputDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    InformationInputView *loginView = [[InformationInputView alloc]initWithType:@"" num:2];
    loginView.titleLabel.text = @"昵称";
    loginView.textField.placeholder = @"用户名 / 手机号码";
    loginView.titleLabel2.text = @"密码";
    loginView.textField2.placeholder = @"登录密码";
    loginView.delegate = self;
    [self.view addSubview:loginView];
    
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(45, 0, 0, 0));
    }];
    
    
    LoginView *footerview = [[LoginView alloc]init];
    footerview.delegate = self;
    [self.view addSubview:footerview];
    
    [footerview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginView.mas_bottom).offset(12);
        make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    NSDictionary *dic = @{@"asd": @""};
    
    [[OrientalHttpManager sharedInstance] requestWithTarget:Register params:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
     
    }];
    
    
}

-(void)back{
    [super back];
    [self dismissViewControllerAnimated:YES completion:^{
//        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        [delegate.rootController setSelectedIndex:4];
    }];
}


- (void)InformationInputDelegate:(UIButton *)btn {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)loginViewDelegate:(UIButton *)btn {
    if (btn.tag == 202) {
        RegisteredViewController *vc = [[RegisteredViewController alloc]initWithTitle:@"手机注册" navBarBtns:NavBarBtnBack];
        
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btn.tag == 201){
        RegisteredViewController *vc = [[RegisteredViewController alloc]initWithTitle:@"忘记密码" navBarBtns:NavBarBtnBack];
        vc.typeStr = @"Forgot";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
