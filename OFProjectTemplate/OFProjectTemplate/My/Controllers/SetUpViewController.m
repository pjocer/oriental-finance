//
//  SetUpViewController.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SetUpViewController.h"
#import "Masonry.h"
#import "SetUpTableViewCell.h"
#import "SetUpHeadTableViewCell.h"
#import "OFUIkitMacro.h"

@interface SetUpViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SetUpViewController
//- (void)viewWillDisappear:(BOOL)animated{
//    [self.navigationController.navigationBar setTranslucent:NO];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 111.5, 0));
    }];
    
    UIButton *outLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    outLoginBtn.layer.cornerRadius = 22;
    [outLoginBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    outLoginBtn.titleLabel.font = UIFontMake(16);
    [outLoginBtn setTitleColor:UIColorMake(51, 51, 51) forState:UIControlStateNormal];
    outLoginBtn.backgroundColor = UIColorMake(216, 216, 213);
    [outLoginBtn addTarget:self action:@selector(clientAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:outLoginBtn];
    
    [outLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.listTableView.mas_bottom).offset(30.5);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@150);
        make.height.equalTo(@44);
    }];
}

- (void)clientAction {
    [self back];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 9;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 87;
    } else if (indexPath.row == 5){
        return 57.5;
    } else{
        return 48.5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    SetUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    SetUpHeadTableViewCell *headcell = [tableView dequeueReusableCellWithIdentifier:@"head"];
    if (indexPath.row == 0) {
        if (!headcell) {
            headcell = [[SetUpHeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"head"];
            
        }
        return headcell;
    }else{
        if (!cell) {
            cell = [[SetUpTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            
        }
        if (indexPath.row == 1) {
            cell.titleLabel.text = @"真实姓名";
            cell.textsLabel.text = @"王博";
        } else if (indexPath.row == 2) {
            cell.titleLabel.text = @"昵称";
            cell.textsLabel.text = @"小王";
        } else if (indexPath.row == 3) {
            cell.titleLabel.text = @"性别";
            cell.textsLabel.text = @"男";
        } else if (indexPath.row == 4) {
            cell.titleLabel.text = @"出生日期";
            cell.textsLabel.text = @"1991.12.31";
        } else if (indexPath.row == 5) {
            cell.titleLabel.text = @"绑定手机号";
            cell.textsLabel.text = @"17603607917";
        } else if (indexPath.row == 6) {
            cell.titleLabel.text = @"消息推送";
            [cell.textsLabel setHidden:YES];
        } else if (indexPath.row == 7) {
            cell.titleLabel.text = @"清除缓存";
            cell.textsLabel.text = @"25.87M";
        } else if (indexPath.row == 8) {
            cell.titleLabel.text = @"服务条款";
            [cell.textsLabel setHidden:YES];
        }
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
        _listTableView.separatorColor = UIColorMake(204, 204, 204);
        _listTableView.scrollEnabled = NO;
        
    }
    
    return _listTableView;
}
@end
