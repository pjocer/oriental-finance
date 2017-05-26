//
//  ChannelViewController.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "ChannelViewController.h"
#import <Masonry.h>
#import "DetailsViewController.h"

@interface ChannelViewController ()

@end

@implementation ChannelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"频道";
    UIScrollView *hotView = [[UIScrollView alloc] init];
    hotView.contentSize = CGSizeMake(0, 900);
    [self.view addSubview:hotView];
    
    [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        //        make.height.equalTo(@1230);
    }];
    
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pingdao"]];
    image.frame = CGRectMake(0, 0, self.view.frame.size.width, 900);
    image.userInteractionEnabled = YES;
    [hotView addSubview:image];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [image addGestureRecognizer:tapGR];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tapAction:(UITapGestureRecognizer *)tap {
    DetailsViewController *vc = [[DetailsViewController alloc]init];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed=NO;
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
