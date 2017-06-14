//
//  SurePayPasswordVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SurePayPasswordVC.h"
#import "SetUpPayPasswordView.h"
#import "Masonry.h"
#import "WBAlertController.h"
#import "AddBankCardSuccess.h"

@interface SurePayPasswordVC ()<SetUpPayPasswordViewDelegate>

@end

@implementation SurePayPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    SetUpPayPasswordView *view = [[SetUpPayPasswordView alloc]init];
    view.delegate = self;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
}

-(void)SetUpPayPasswordViewwithbtn:(NSString *)password{
    if ([self.password isEqualToString:password]) {
        AddBankCardSuccess *vc = [[AddBankCardSuccess alloc]initWithTitle:@"绑定成功" navBarBtns:NavBarBtnBack];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        
        WBAlertController *alert = [WBAlertController initWBAlerControllerWithTitle:@"提示" message:@"两次密码输入不一致" style:@"1" titleArr:[NSMutableArray arrayWithObjects:@"确定", nil] alerAction:^(NSInteger index) {
            
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
