//
//  FamilyViewController.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "FamilyViewController.h"
#import "FamilyView.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"
#import "AddFamilyVC.h"

@interface FamilyViewController ()<FamilyViewDelegate>

@end

@implementation FamilyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = @[@"1",@"1",@"1"];
    FamilyView *familyView = [[FamilyView alloc]initWithDatalist:arr];
    familyView.delegate = self;
    [self.view addSubview:familyView];
    
    [familyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

-(void)FamilyViewDelegateWithBtn:(UIButton *)btn {
    if (btn.tag == 100) {
        AddFamilyVC *vc = [[AddFamilyVC alloc]initWithTitle:@"添加家庭成员" navBarBtns:NavBarBtnBack];
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
