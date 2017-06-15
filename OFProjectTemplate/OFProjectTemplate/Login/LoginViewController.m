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
#import "WBAlertController.h"
#import "OShowHud.h"
#import "AccountManager.h"

@interface LoginViewController ()<loginViewDelegate, InformationInputDelegate>{
    InformationInputView *loginView;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    loginView = [[InformationInputView alloc]initWithType:@"" num:2];
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
    
    
    
}

-(void)back{
    self.loginHandler(ActionStateUserCancel);
    [super back];
}


- (void)InformationInputDelegate:(UIButton *)btn {
    if (loginView.textField.text.length != 0 && loginView.textField2.text.length !=0) {
        NSDictionary *dic = @{@"phone": loginView.textField.text,@"pwd":loginView.textField2.text};
        [self startLoading];
        [[OrientalHttpManager sharedInstance] requestWithTarget:Login params:dic success:^(NSURLSessionDataTask *task, id responseObject) {
            [self stopLoading];
            [OShowHud showErrorHudWith:responseObject[@"msg"] animated:YES];
            if ([responseObject[@"code"] integerValue]>0) {
                [AccountManager saveLocalAccountData:responseObject[@"result"]];
                self.loginHandler(ActionStateSuccess);
                [super back];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self stopLoading];
        }];
    }else{
        
        
    }
    
    
    
    
}

-(void)loginViewDelegate:(UIButton *)btn {
    if (btn.tag == 202) {
        RegisteredViewController *vc = [[RegisteredViewController alloc]initWithTitle:@"手机注册" navBarBtns:NavBarBtnBack];
        vc.loginHandler = self.loginHandler;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btn.tag == 201){
        RegisteredViewController *vc = [[RegisteredViewController alloc]initWithTitle:@"忘记密码" navBarBtns:NavBarBtnBack];
        vc.loginHandler = self.loginHandler;
        vc.typeStr = @"Forgot";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
