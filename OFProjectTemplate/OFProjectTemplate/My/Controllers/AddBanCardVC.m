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
#import "SetUpPayPasswordView.h"
#import "AddBankCardSuccess.h"
#import "WBAlertController.h"

@interface AddBanCardVC ()<UITableViewDelegate, UITableViewDataSource, SetUpPayPasswordViewDelegate>

@end

@implementation AddBanCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 330, 0));
    }];
    
    SetUpPayPasswordView *view = [[SetUpPayPasswordView alloc]init];
    view.delegate = self;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.listTableView.mas_bottom);
        make.bottom.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];

}
-(void)SetUpPayPasswordViewwithbtn:(NSString *)password{
    
    if (password.length < 6) {
        WBAlertController *alert = [WBAlertController initWBAlerControllerWithTitle:@"提示" message:@"请输入6位密码" style:@"1" titleArr:[NSMutableArray arrayWithObjects:@"确定", nil] alerAction:^(NSInteger index) {
            
        }];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        
    }else{
        AddBankCardSuccess *vc = [[AddBankCardSuccess alloc]initWithTitle:@"绑定成功" navBarBtns:NavBarBtnBack];
        [self.navigationController pushViewController:vc animated:YES];

    }
}
- (void)keyboardWillChange:(NSNotification *)note
{
    NSDictionary *userInfo = note.userInfo;
    CGFloat duration = [userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    CGRect keyFrame = [userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat moveY = keyFrame.origin.y - self.view.frame.size.height-64;    
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, moveY);
    }];
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
