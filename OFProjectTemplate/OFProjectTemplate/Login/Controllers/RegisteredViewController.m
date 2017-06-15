//
//  RegisteredViewController.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "RegisteredViewController.h"
#import "InformationInputView.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "SetupPasswordVC.h"
#import "MacorLogin.h"
#import "OriNetworking.h"
#import "WBAlertController.h"

@interface RegisteredViewController ()<InformationInputDelegate>{
    InformationInputView *loginView;
}

@end

@implementation RegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    loginView = [[InformationInputView alloc]initWithType:@"show" num:2];
    loginView.titleLabel.text = @"您的手机号码";
    loginView.textField.placeholder = @"输入手机号码";
    loginView.titleLabel2.text = @"验证码";
    loginView.textField2.placeholder = @"输入验证码";
    [loginView.sureBtn setTitle:@"下一步" forState:UIControlStateNormal];
    loginView.delegate = self;
    [self.view addSubview:loginView];
    
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(45, 0, 0, 0));
    }];
    
    


}

- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)vailadCodeDelegate:(UIButton *)btn {

    if (loginView.textField.text.length != 0 && loginView.textField.text.length == 11) {
        
        __block NSInteger time = 59; //倒计时时间
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        
        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
        
        dispatch_source_set_event_handler(_timer, ^{
            
            if(time <= 0){ //倒计时结束，关闭
                
                dispatch_source_cancel(_timer);
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    //设置按钮的样式
                    [btn setTitle:@"重新发送" forState:UIControlStateNormal];
                    [btn setTitleColor:UIColorMake(229, 75, 20) forState:UIControlStateNormal];
                    btn.userInteractionEnabled = YES;
                });
                
            }else{
                
                int seconds = time % 60;
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    //设置按钮显示读秒效果
                    [btn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                    btn.userInteractionEnabled = NO;
                });
                time--;
            }
        });
        dispatch_resume(_timer);

        NSDictionary *dic = @{@"phone": loginView.textField.text};
        
        [[OrientalHttpManager sharedInstance] requestWithTarget:SendCode params:dic success:^(NSURLSessionDataTask *task, id responseObject) {
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    }else{
        WBAlertController *alert = [WBAlertController initWBAlerControllerWithTitle:@"提示" message:@"请输入正确的手机号码" style:@"1" titleArr:[NSMutableArray arrayWithObjects:@"确定", nil] alerAction:^(NSInteger index) {
            
            
            
        }];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }
}
 

- (void)InformationInputDelegate:(UIButton *)btn {
    if (loginView.textField.text.length != 0 && loginView.textField2.text.length !=0) {
        NSDictionary *dic = @{@"phone": loginView.textField.text,@"code":loginView.textField2.text};
        
        [[OrientalHttpManager sharedInstance] requestWithTarget:VailadCode params:dic success:^(NSURLSessionDataTask *task, id responseObject) {
            SetupPasswordVC *vc = [[SetupPasswordVC alloc]initWithTitle:@"设置密码" navBarBtns:NavBarBtnBack];
            vc.typeStr = self.typeStr;
            [self.navigationController pushViewController:vc animated:YES];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    }else{
        WBAlertController *alert = [WBAlertController initWBAlerControllerWithTitle:@"提示" message:@"请输入正确的手机号码" style:@"1" titleArr:[NSMutableArray arrayWithObjects:@"确定", nil] alerAction:^(NSInteger index) {
            
        }];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
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
