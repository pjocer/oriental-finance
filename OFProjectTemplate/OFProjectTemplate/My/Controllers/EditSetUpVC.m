//
//  EditSetUpVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/7.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "EditSetUpVC.h"
#import "SetupView.h"
#import "Masonry.h"

@interface EditSetUpVC ()<SetupViewDelegate>

@end

@implementation EditSetUpVC

- (void)viewWillAppear:(BOOL)animated{
    SetupView *setupview = [[SetupView alloc]init];
    setupview.titlabel.text = self.titlelabel;
    setupview.textField.placeholder = self.placorlabel;
    setupview.delegate = self;
    [self.view addSubview:setupview];
    
    [setupview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)setupViewDelegateWithBtn:(UIButton *)btn{
    
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
