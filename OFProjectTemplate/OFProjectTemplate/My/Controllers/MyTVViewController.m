//
//  MyTVViewController.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyTVViewController.h"
#import "MyTVTableViewCell.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"

@interface MyTVViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation MyTVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];



}
- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc]init];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.separatorColor = UIColorMake(204, 204, 204);
    }
    
    return _listTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    MyTVTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[MyTVTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"head"];
    }
    

    return cell;
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
