//
//  ConnectionEquipmentVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/9.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ConnectionEquipmentVC.h"
#import "ConnectionEquipmentView.h"
#import "Masonry.h"
#import "ODQTool.h"
#import "OFUIkitMacro.h"
#import "OShowHud.h"

@interface ConnectionEquipmentVC ()<ConnectionEquipmentVDelegate>

@end

@implementation ConnectionEquipmentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    ConnectionEquipmentView *view = [[ConnectionEquipmentView alloc]init];
    view.delegate = self;
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
}

-(void)ConnectionEquipmentVDelegate{
    if (IS_SIMULATOR) {
        [OShowHud showErrorHudWith:@"模拟器不支持" animated:YES];
    } else {
        ODQTool *dq = [[ODQTool alloc]initWithTitle:@"二维码扫描" navBarBtns:NavBarBtnBack];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:dq];
        [self presentViewController:navc animated:YES completion:^{
            
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
