//
//  AddBankCardSuccess.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/15.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "AddBankCardSuccess.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@interface AddBankCardSuccess ()

@end

@implementation AddBankCardSuccess

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tab_remote_selected"]];
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius = 25;
    image.backgroundColor = UIColorMake(23, 199, 159);
    [self.view addSubview:image];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(57);
        make.centerX.equalTo(self.view);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"添加银行卡成功";
    label.font = UIFontMake(18);
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(image.mas_bottom).offset(18.5);
        make.centerX.equalTo(self.view);
    }];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setTitle:@"完成" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = UIFontMake(16);
    sureBtn.backgroundColor = UIColorMake(229, 75, 20);
    sureBtn.layer.cornerRadius = 3;
    [sureBtn addTarget:self action:@selector(clientAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];
    
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(54);
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 12.5, 0, 12.5));
        make.height.equalTo(@44);
    }];
    
}


- (void)clientAction{
    [self dismissViewControllerAnimated:YES completion:^{
        
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
