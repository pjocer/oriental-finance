//
//  SetupPasswordVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SetupPasswordVC.h"
#import "InformationInputView.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "MacorLogin.h"
#import "OriNetworking.h"
#import "OShowHud.h"

@interface SetupPasswordVC ()<InformationInputDelegate>{
    InformationInputView *setPasswordView;
}

@end

@implementation SetupPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    setPasswordView = [[InformationInputView alloc]initWithType:@"" num:1];
    setPasswordView.titleLabel.text = @"设置您的密码";
    setPasswordView.textField.placeholder = @"6-20位字母、数字组合";
    if ([self.typeStr isEqualToString:@"Forgot"]) {
        [setPasswordView.sureBtn setTitle:@"找回并登陆" forState:UIControlStateNormal];
    }else{
        [setPasswordView.sureBtn setTitle:@"注册" forState:UIControlStateNormal];
    }
    
    setPasswordView.delegate = self;
    [self.view addSubview:setPasswordView];
    
    
    [setPasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(45, 0, 0, 0));
    }];
}

//-(void)back {
//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
//}

- (void)InformationInputDelegate:(UIButton *)btn {
    [self startLoading];
    NSDictionary *dic = @{@"phone": self.params,@"pwd":setPasswordView.textField.text};
    [[OrientalHttpManager sharedInstance] requestWithTarget:Register params:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        [self stopLoading];
        [OShowHud showErrorHudWith:responseObject[@"msg"] animated:YES];
        if ([responseObject[@"code"] integerValue] > 0) {
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self stopLoading];
    }];

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
