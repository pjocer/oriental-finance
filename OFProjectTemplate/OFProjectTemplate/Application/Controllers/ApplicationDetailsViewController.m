//
//  ApplicationDetailsViewController.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "ApplicationDetailsViewController.h"

@interface ApplicationDetailsViewController ()

@end

@implementation ApplicationDetailsViewController

- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setTranslucent:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"试玩 2048";
    
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://219.233.175.86/2048.html"]];
    webView.scrollView.bounces = NO;
    [self.view addSubview: webView];
    [webView loadRequest:request];
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
