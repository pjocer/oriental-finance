//
//  ApplicationViewController.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "ApplicationViewController.h"
#import "ApplicationView.h"
#import <Masonry.h>
#import "ApplicationTableViewCell.h"
#import "ApplicationDetailsViewController.h"
#import "ChanneldetailsVC.h"
#import "OFUIkitMacro.h"

@interface ApplicationViewController ()<UITableViewDelegate, UITableViewDataSource, applicationViewDelegate>
@property (nonatomic, strong) NSArray *dataArray;
@end

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kNavigationBarHeight  50.0
#define kBannerHeight 192.0

@implementation ApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"应用";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSString *imageName =@"1";
    
    //     创建将要显示控件
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview: imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@(self.view.frame.size.height*0.21 ));
        
    }];
    
    
    ApplicationView *view = [[ApplicationView alloc]init];
    view.delegate = self;
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    

    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(self.view.frame.size.height*0.21 );
        make.right.left.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@(0.15*SCREEN_HEIGHT +16+5+5));
    }];
    
    ApplicationView *view2 = [[ApplicationView alloc]init];
    view2.titlelabel1.text = @"全部应用";
    view2.delegate = self;
    view2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view2];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).offset(5);
        make.right.left.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@(0.15*SCREEN_HEIGHT +16+5+5));
    }];
    ApplicationView *view3 = [[ApplicationView alloc]init];
    view3.titlelabel1.text = @"我的应用";
    view3.delegate = self;
    view3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view3];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view2.mas_bottom).offset(5);
        make.right.left.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@(0.15*SCREEN_HEIGHT +16+5+5));
    }];
    
//    [self.view addSubview:self.listTableView];
//    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
//        make.top.equalTo(view.mas_bottom);
//    }];
    view.titlelabel1.text = @"热门应用";
    
}








-(void)applicationViewActionWithBtn:(UIButton *)btn {
    if (btn.tag == 100) {
        ApplicationDetailsViewController *vc = [[ApplicationDetailsViewController alloc]init];
        self.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.frame.size.width *0.35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    ApplicationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[ApplicationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        NSArray *arr = @[@"1",@"2",@"1"];
        cell.coverImage.backgroundColor = [UIColor redColor];
        cell.coverImage.image = [UIImage imageNamed:[arr objectAtIndex:indexPath.row]];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
}

- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc]init];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.separatorColor = [UIColor clearColor];
        
    }
    
    return _listTableView;
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
