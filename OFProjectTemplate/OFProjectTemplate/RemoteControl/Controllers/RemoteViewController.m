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

@interface RemoteViewController ()<RemoteViewDelegate,UIScrollViewDelegate>
{
    UIPageControl *_pageControl;
}

@end

@implementation RemoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//     Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorMake(25, 24, 29);
    self.title = @"遥控器";
    
//    
//    RemoteView *view = [[RemoteView alloc]initWithFrame:self.view.frame];
//    view.backgroundColor = UIColorMake(25, 24, 29);
//    view.delegate = self;
//    [self.view addSubview:view];
//
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50)];
    scroll.backgroundColor = UIColorMake(236, 236, 236);
    scroll.contentSize = CGSizeMake(2*self.view.frame.size.width, 0);
    scroll.pagingEnabled = YES;
    scroll.delegate = self;
    [self.view addSubview:scroll];

    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.bounds = CGRectMake(0, 70, 150, 50);
    pageControl.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height - 60);

    pageControl.numberOfPages = 2; // 一共显示多少个圆点（多少页）
    // 设置非选中页的圆点颜色
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    // 设置选中页的圆点颜色
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    // 禁止默认的点击功能
    pageControl.enabled = NO;

    [self.view addSubview:pageControl];
    _pageControl = pageControl;
    

    
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jia_remote"]];
    image.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50-49);
    image.contentMode = UIViewContentModeScaleAspectFit;
    image.backgroundColor = UIColorMake(236, 236, 236);
    image.userInteractionEnabled = YES;
    [scroll addSubview:image];
    
    UIImageView *image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"num_remote"]];
    image2.frame = CGRectMake(self.view.frame.size.width, -50, self.view.frame.size.width, self.view.frame.size.height-50+20);
    image2.contentMode = UIViewContentModeScaleAspectFit;
    image2.backgroundColor = UIColorMake(236, 236, 236);
    image2.userInteractionEnabled = YES;
    [scroll addSubview:image2];

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    //    NSLog(@"%d", page);
    
    // 设置页码
    _pageControl.currentPage = page;
}

-(void)remoteViewDelegate:(UIButton *)btn{
    if (btn.tag == 122) {
//        [self dismissViewControllerAnimated:YES completion:^{
//            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//            [delegate.rootController setSelectedIndex:0];
//        }];
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
