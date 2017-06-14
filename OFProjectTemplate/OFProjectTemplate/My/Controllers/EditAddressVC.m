//
//  EditAddressVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "EditAddressVC.h"
#import "EditAddressCell.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "ZHPickView.h"


@interface EditAddressVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation EditAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 111.5, 0));
    }];
    
    UIButton *outLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    outLoginBtn.layer.cornerRadius = 22;
    [outLoginBtn setTitle:@"删除地址" forState:UIControlStateNormal];
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
            cell.titleLabel.text = @"收货人";
            cell.textsLabel.placeholder = @"输入收货人姓名";
        } else if (indexPath.row == 1) {
            cell.titleLabel.text = @"联系电话";
            cell.textsLabel.placeholder = @"输入电话号码";
        } else if (indexPath.row == 2) {
            cell.titleLabel.text = @"所在地区";
            cell.textsLabel.placeholder = @"请选择地区";
        } else if (indexPath.row == 3) {
            cell.titleLabel.text = @"详细地址";
            cell.textsLabel.text = @"请填写详细地址";
            
            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 48.5, SCREEN_WIDTH, 10)];
            line.backgroundColor = UIColorMake(236, 236, 236);
            [cell.contentView addSubview:line];
            [cell.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell.contentView).offset(-5);
                make.left.equalTo(cell.contentView.mas_left).offset(22.5);
            }];
            cell.separatorInset = UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0); // ViewWidth  [宏] 指的是手机屏幕的宽度
        } else if (indexPath.row == 4) {
            cell.titleLabel.text = @"设为默认";
            [cell.textsLabel setHidden:YES];
            [cell.pushSwich setHidden:NO];
        }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EditAddressCell *cell = [self.listTableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == 2){
        ZHPickView *pickView = [[ZHPickView alloc] init];
        [pickView setDateViewWithTitle:@"出生日期"];
        [pickView showPickView:self];
        pickView.block = ^(NSString *selectedStr)
        {
            cell.textsLabel.text = selectedStr;
        };
    }
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
