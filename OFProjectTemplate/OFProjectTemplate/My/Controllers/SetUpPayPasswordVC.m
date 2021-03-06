//
//  SetUpPayPasswordVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SetUpPayPasswordVC.h"
#import "SetUpPayPasswordView.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "SurePayPasswordVC.h"

@interface SetUpPayPasswordVC ()<SetUpPayPasswordViewDelegate>

@end

@implementation SetUpPayPasswordVC

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
    SurePayPasswordVC *vc = [[SurePayPasswordVC alloc]initWithTitle:@"确认支付密码" navBarBtns:NavBarBtnBack];
    vc.password = password;
    [self.navigationController pushViewController:vc animated:YES];
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
