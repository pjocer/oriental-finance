//
//  AddBanCardVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "AddBanCardVC.h"
#import "EditAddressCell.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "SetUpPayPasswordVC.h"

@interface AddBanCardVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation AddBanCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 330, 0));
    }];
    
    UIButton *outLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [outLoginBtn setTitle:@"下一步" forState:UIControlStateNormal];
    outLoginBtn.titleLabel.font = UIFontMake(16);
    outLoginBtn.backgroundColor = UIColorMake(229, 75, 20);
    outLoginBtn.layer.cornerRadius = 3;
    [outLoginBtn addTarget:self action:@selector(clientAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:outLoginBtn];
    
    [outLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.listTableView.mas_bottom);
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 12.5, 0, 12.5));
        make.height.equalTo(@44);
    }];
}

- (void)clientAction {
    SetUpPayPasswordVC *vc = [[SetUpPayPasswordVC alloc]initWithTitle:@"设置密码" navBarBtns:NavBarBtnBack];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3){
        return 57.5;
    } else{
        return 48.5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    EditAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[EditAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        
    }
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"持卡人姓名";
        cell.textsLabel.placeholder = @"输入卡主姓名";
    } else if (indexPath.row == 1) {
        cell.titleLabel.text = @"持卡人身份证号";
        cell.textsLabel.placeholder = @"输入卡主身份证号";
    } else if (indexPath.row == 2) {
        cell.titleLabel.text = @"银行卡号";
        cell.textsLabel.placeholder = @"输入银行卡号";
    } else if (indexPath.row == 3) {
        cell.titleLabel.text = @"手机号码";
        cell.textsLabel.placeholder = @"输入手机号码";
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 48.5, SCREEN_WIDTH, 10)];
        line.backgroundColor = UIColorMake(236, 236, 236);
        [cell.contentView addSubview:line];
        [cell.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.contentView).offset(-5);
            make.left.equalTo(cell.contentView.mas_left).offset(22.5);
        }];
        cell.separatorInset = UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0); // ViewWidth  [宏] 指的是手机屏幕的宽度
    } else if (indexPath.row == 4) {
        [cell.titleLabel setHidden:YES];
        
        cell.textsLabel.text = @"请输入验证码";
        [cell.textsLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell.contentView.mas_left).offset(22.5);
        }];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [btn setTitleColor:UIColorMake(229, 75, 20) forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 15;
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = UIColorMake(229, 75, 20).CGColor;
        btn.titleLabel.font = UIFontMake(13);
        [cell.contentView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.contentView);
            make.right.equalTo(cell.contentView.mas_right).offset(-15);
            make.height.equalTo(@30);
            make.width.equalTo(@80);
        }];
    }
    
    
    return cell;
}



- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc]init];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.separatorColor = UIColorMake(204, 204, 204);
        _listTableView.scrollEnabled = NO;
        _listTableView.tableFooterView = [[UIView alloc]init];
        
    }
    
    return _listTableView;
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
