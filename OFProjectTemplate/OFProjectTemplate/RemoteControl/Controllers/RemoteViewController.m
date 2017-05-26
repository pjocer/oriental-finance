//
//  RemoteViewController.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "RemoteViewController.h"
#import "RemoteView.h"
#import <Masonry.h>

@interface RemoteViewController ()

@end

@implementation RemoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"遥控器";
    
    RemoteView *view = [[RemoteView alloc]initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    

    
    
//    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"remote"]];
//    
//    [self.view addSubview:image];
//    
//    [image mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.bottom.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 49, 0));
//    }];
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
