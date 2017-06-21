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
#import "EditSetUpVC.h"
#import "ZHPickView.h"

@interface SetUpViewController ()<UITableViewDelegate, UITableViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation SetUpViewController
//- (void)viewWillDisappear:(BOOL)animated{
//    [self.navigationController.navigationBar setTranslucent:NO];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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
            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 48.5, SCREEN_WIDTH, 10)];
            line.backgroundColor = UIColorMake(236, 236, 236);
            [cell.contentView addSubview:line];
            cell.titleLabel.text = @"绑定手机号";
            cell.textsLabel.text = @"17603607917";
            [cell.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell.contentView).offset(-5);
                make.left.equalTo(cell.contentView.mas_left).offset(22.5);
            }];
            cell.separatorInset = UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0); // ViewWidth  [宏] 指的是手机屏幕的宽度
        } else if (indexPath.row == 6) {
            [cell.newxtImage setHidden:YES];
            cell.titleLabel.text = @"消息推送";
            [cell.textsLabel setHidden:YES];
            [cell.pushSwich setHidden:NO];
            

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
    SetUpTableViewCell *cell = [self.listTableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
        
        //设置图片源类型
        pickVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //取出所有图片资源的相簿
        
        //设置代理
        pickVC.delegate = self;
        
        
        [self presentViewController:pickVC animated:YES completion:nil];
    }else if (indexPath.row == 1){
        EditSetUpVC *vc = [[EditSetUpVC alloc]initWithTitle:@"真实姓名" navBarBtns:NavBarBtnBack];
        vc.titlelabel = @"姓名";
        vc.placorlabel = cell.textsLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 2){
        EditSetUpVC *vc = [[EditSetUpVC alloc]initWithTitle:@"修改昵称" navBarBtns:NavBarBtnBack];
        vc.titlelabel = @"昵称";
        vc.placorlabel = cell.textsLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 3){
        
        ZHPickView *pickView = [[ZHPickView alloc] init];
        [pickView setDataViewWithItem:@[@"男",@"女"] title:@"选择性别"];
        [pickView showPickView:self];
        pickView.block = ^(NSString *selectedStr)
        {
            cell.textsLabel.text = selectedStr;
        };
        
    }else if (indexPath.row == 4){
        ZHPickView *pickView = [[ZHPickView alloc] init];
        [pickView setDateViewWithTitle:@"出生日期"];
        [pickView showPickView:self];
        pickView.block = ^(NSString *selectedStr)
        {
            cell.textsLabel.text = selectedStr;
        };
    }else if (indexPath.row == 5){
        EditSetUpVC *vc = [[EditSetUpVC alloc]initWithTitle:@"修改手机号" navBarBtns:NavBarBtnBack];
        vc.titlelabel = @"手机号";
        vc.placorlabel = cell.textsLabel.text;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 6){
        
    }else if (indexPath.row == 7){
        
    }else if (indexPath.row == 8){
        
    }
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    //dismiss
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    //取出选中的图片
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
    SetUpHeadTableViewCell *headcell = [self.listTableView cellForRowAtIndexPath:index];
    
    headcell.headImage.image = info[UIImagePickerControllerOriginalImage];
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
