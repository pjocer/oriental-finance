//
//  HomeViewController.m
//  OFClient
//
//  Created by 吉冠虎 on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewModel.h"
#import <ReactiveCocoa.h>
#import <Masonry.h>
#import "DetailsViewController.h"

@interface HomeViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeTableViewModel *tableViewModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *hotView = [[UIScrollView alloc] init];
    hotView.contentSize = CGSizeMake(0, 1230);
    [self.view addSubview:hotView];
    
    [hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shouye"]];
    image.frame = CGRectMake(0, 0, self.view.frame.size.width, 1230);
    image.userInteractionEnabled = YES;
    [hotView addSubview:image];
    
     UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [image addGestureRecognizer:tapGR];
    
    
//    
//    [image mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(hotView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
//        make.top.equalTo(hotView);
//        make.height.equalTo(@1230);
//    }];

    
    
//    [self.tableViewModel fetchDataWithCompeletion:^(NSArray<HomeModel *> *source) {
//        [self.tableView reloadData];
//    }];
}

- (void)initNavigationBar {
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -5;
    self.navigationItem.leftBarButtonItems = @[negativeSeperator, buttonItem];
    [self.backBtn setImage:[UIImage imageNamed:@"erweim"] forState:UIControlStateNormal];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 32, 32);
    [btn setImage:[UIImage imageNamed:@"xiaoxi"] forState:UIControlStateNormal];
    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSeperator2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator2.width = -5;
    self.navigationItem.rightBarButtonItems = @[negativeSeperator2, buttonItem2];
    
    
    
    
    
    

}
- (void)setup {
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    DetailsViewController *vc = [[DetailsViewController alloc]init];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(0, 0, 32, 32);
        [_backBtn addTarget:self action:@selector(setup) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backBtn;
}
//- (UITableView *)tableView {
//    if (!_tableView) {
//        _tableView.delegate = self.tableViewModel;
//        _tableView.dataSource = self.tableViewModel;
//    }
//    return _tableView;
//}
//
//- (HomeTableViewModel *)tableViewModel {
//    if (!_tableViewModel) {
//        _tableViewModel = [[HomeTableViewModel alloc] init];
//        _tableViewModel.didSelectedBlock = ^(HomeModel *model) {
//            NSLog(@"aaaa");
//        };
//    }
//    return _tableViewModel;
//}

@end
