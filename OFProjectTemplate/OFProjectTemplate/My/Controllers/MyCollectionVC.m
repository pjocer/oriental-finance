//
//  MyCollectionVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyCollectionVC.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "PlayHistorycell.h"
#import "DetailsViewController.h"

@interface MyCollectionVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MyCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsViewController *vc = [[DetailsViewController alloc]initWithTitle:@"我的电视" navBarBtns:NavBarBtnBack];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 15;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 89.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    PlayHistorycell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[PlayHistorycell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
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
