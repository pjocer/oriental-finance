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

@interface ApplicationViewController ()<UITableViewDelegate, UITableViewDataSource, applicationViewDelegate>

@end

@implementation ApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"应用";
    self.view.backgroundColor = [UIColor whiteColor];
    
    ApplicationView *view = [[ApplicationView alloc]init];
    view.delegate = self;
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@(self.view.frame.size.height*0.21 +80));
    }];
    
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 49, 0));
        make.top.equalTo(view.mas_bottom);
    }];
    
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
    ChanneldetailsVC *vc = [[ChanneldetailsVC alloc] initWithTitle:@"xxx电视台" navBarBtns:NavBarBtnBack];
    [self.navigationController pushViewController:vc animated:YES];
    
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
