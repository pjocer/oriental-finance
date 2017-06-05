//
//  RemoteViewController.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.


#import "RemoteViewController.h"
#import "RemoteView.h"
#import <Masonry.h>
#import "OFUIkitMacro.h"
#import "AppDelegate.h"

@interface RemoteViewController ()<RemoteViewDelegate>

@end

@implementation RemoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//     Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorMake(25, 24, 29);
    self.title = @"遥控器";
    
    
    RemoteView *view = [[RemoteView alloc]initWithFrame:self.view.frame];
    view.backgroundColor = UIColorMake(25, 24, 29);
    view.delegate = self;
    [self.view addSubview:view];
    

    
    
//    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"remote-1"]];
//    image.userInteractionEnabled = YES;
//    [self.view addSubview:image];
//    
//    [image mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.bottom.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
//    }];
//    
//    UIButton *btn = [[UIButton alloc]init];
//    [btn addTarget:self action:@selector(closes) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//    
//    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
//        make.width.equalTo(@90);
//        make.height.equalTo(@120);
//    }];
}

-(void)remoteViewDelegate:(UIButton *)btn{
    if (btn.tag == 122) {
        [self dismissViewControllerAnimated:YES completion:^{
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [delegate.rootController setSelectedIndex:0];
        }];
    }

}

- (void)closes{
    [self dismissViewControllerAnimated:YES completion:^{
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate.rootController setSelectedIndex:0];
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
