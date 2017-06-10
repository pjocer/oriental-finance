//
//  AddFamilyVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/10.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "AddFamilyVC.h"
#import "AddFamilyView.h"
#import "Masonry.h"

@interface AddFamilyVC ()

@end

@implementation AddFamilyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    AddFamilyView *view = [[AddFamilyView alloc]init];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
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
