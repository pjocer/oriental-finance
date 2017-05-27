//
//  DetailsViewController.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "DetailsViewController.h"
#import <Masonry.h>
#import "CommentsCell.h"

@interface DetailsViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    scrollView.contentSize = CGSizeMake(0, 0);
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    self.detailesView = [[OShowDetailsView alloc]init];
    [scrollView addSubview:self.detailesView];
    
    [self.detailesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(scrollView);
    }];
    
    [scrollView addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.top.equalTo(self.detailesView.mas_bottom);
        make.height.equalTo(@(self.view.frame.size.width *0.35*10));
    }];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.listTableView.mas_bottom);
    }];

    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.frame.size.width *0.35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    CommentsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[CommentsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        NSArray *arr = @[@"1",@"2",@"1",@"1",@"2",@"1",@"1",@"2",@"1",@"2"];
        cell.coverImage.backgroundColor = [UIColor redColor];
        cell.coverImage.image = [UIImage imageNamed:[arr objectAtIndex:indexPath.row]];
    }
    
    return cell;
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
