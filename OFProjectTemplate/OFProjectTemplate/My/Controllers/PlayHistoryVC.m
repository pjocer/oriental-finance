//
//  PlayHistoryVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "PlayHistoryVC.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "PlayHistorycell.h"
#import "DetailsViewController.h"
#import "WBAlertController.h"
#import "MacroMy.h"
#import "UIImageView+WebCache.h"


@interface PlayHistoryVC ()<UITableViewDelegate, UITableViewDataSource>{
    UIButton *button;
    UIView *footerView;
    BOOL isAll;

}
@property(nonatomic,strong)NSMutableArray *array;//数据源
@property (nonatomic,strong)NSMutableArray *selectorPatnArray;//存放选中数据


@end

@implementation PlayHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    [self getData];

    self.selectorPatnArray = [NSMutableArray array];
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    
}
- (void)getData{
    NSDictionary *dic = @{@"start": @"0",@"length":@"10"};
    NSString *postURL;
    
    if ([self.type isEqualToString:@"History"]) {
        postURL = showWatchHistory;
    } else if ([self.type isEqualToString:@"Appointment"]){
        postURL = showProgAppointmentList;
    } else if ([self.type isEqualToString:@"Collection"]){
        postURL = showUserfavorite;
    }
    
    [[OrientalHttpManager sharedInstance] requestWithTarget:postURL params:dic success:^(NSURLSessionDataTask *task, id responseObject, BOOL success) {
        if (success) {
            self.array = [NSMutableArray arrayWithArray:[responseObject objectForKey:@"result"]];
            [self.listTableView reloadData];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)initNavigationBar {
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 35, 25);
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setTitle:@"更多" forState:UIControlStateNormal];
    button.titleLabel.font = UIFontMake(13);
    [button addTarget:self action:@selector(selectMore:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *negativeSeperator2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator2.width = -5;
    
    self.navigationItem.rightBarButtonItems = @[negativeSeperator2, buttonItem2];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //选中数据
    if (tableView.editing == YES) {
        [self.selectorPatnArray addObject:self.array[indexPath.row]];
    }else{
        DetailsViewController *vc = [[DetailsViewController alloc]initWithTitle:@"我的电视" navBarBtns:NavBarBtnBack];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    //从选中中取消
    if (tableView.editing == YES) {
        if (self.selectorPatnArray.count > 0) {
            
            [self.selectorPatnArray removeObject:self.array[indexPath.row]];
        }
    }
    
}
- (void)addFooterView{
    footerView =  [[UIView alloc]init];
//    footerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:footerView];
    
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@49);
    }];
    
    UIButton *selectAllBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:selectAllBtn];
    [selectAllBtn setTitle:@"全选" forState:UIControlStateNormal];
    [selectAllBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    selectAllBtn.titleLabel.font = UIFontMake(18);
    selectAllBtn.layer.borderColor = UIColorMake(151, 151, 151).CGColor;
    selectAllBtn.layer.borderWidth = 0.5;
    [selectAllBtn addTarget:self action:@selector(selectleAllAction:) forControlEvents:UIControlEventTouchUpInside];
    [selectAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(footerView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.equalTo(@(self.view.frame.size.width/2));
    }];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:cancelBtn];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = UIFontMake(18);
    cancelBtn.backgroundColor = UIColorMake(229, 75, 20);
    [cancelBtn addTarget:self action:@selector(cancelSelectleAction:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(footerView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.width.equalTo(@(self.view.frame.size.width/2));
    }];
    
    
}
- (void)cancelSelectleAction:(UIButton *)btn{
    for (NSInteger i = 0; i < self.array.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [self.listTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        [self.listTableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    [self.selectorPatnArray removeAllObjects];
    [footerView removeFromSuperview];
    [button setTitle:@"更多" forState:(UIControlStateNormal)];
    [self.listTableView setEditing:NO animated:YES];
    isAll = NO;
    
}
- (void)selectleAllAction:(UIButton *)btn{
    
    if ([btn.titleLabel.text isEqualToString:@"全选"]) {
        [btn setTitle:@"清空" forState:UIControlStateNormal];
        for (int i = 0; i < self.array.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.listTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
            [self.selectorPatnArray addObject:self.array[i]];
        }
    }else{
        [btn setTitle:@"全选" forState:UIControlStateNormal];
        for (int i = 0; i < self.array.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.listTableView deselectRowAtIndexPath:indexPath animated:YES];
            
        }
        [self.selectorPatnArray removeAllObjects];
    }
    
    
    
}
#pragma mark - 点击事件

- (void)selectMore:(UIBarButtonItem *)action{
    if ([button.titleLabel.text isEqualToString:@"更多"]) {
        [self addFooterView];
        //移除之前选中的内容
        if (self.selectorPatnArray.count > 0) {
            [self.selectorPatnArray removeAllObjects];
        }
        isAll = YES;
        [button setTitle:@"删除" forState:(UIControlStateNormal)];
        [self.listTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 49, 0));
        }];
        //进入编辑状态
        [self.listTableView setEditing:YES animated:YES];
    }else{
        if (_selectorPatnArray.count == 0) {
            WBAlertController *alert = [WBAlertController initWBAlerControllerWithTitle:@"提示" message:@"请选择要删除的内容" style:@"1" titleArr:[NSMutableArray arrayWithObjects:@"删除", nil] alerAction:^(NSInteger index) {
                
            }];
            [alert showWBAler];
        }else{
            WBAlertController *alert = [WBAlertController initWBAlerControllerWithTitle:@"提示" message:@"删除要删除勾选内容?" style:@"1" titleArr:[NSMutableArray arrayWithObjects:@"取消", @"删除", nil] alerAction:^(NSInteger index) {
                if (index == 1) {
                    [footerView removeFromSuperview];
                    [button setTitle:@"更多" forState:(UIControlStateNormal)];
                    //对选中内容进行操作
                    NSLog(@"选中个数是 : %lu   内容为 : %@",(unsigned long)self.selectorPatnArray.count,self.selectorPatnArray);
                    
                    for (NSInteger i = 0; i < self.selectorPatnArray.count; i++) {
                        
                        [self.array removeObject:[self.selectorPatnArray objectAtIndex:i]];
                    
                    }
                    [self.listTableView reloadData];

                    //取消编辑状态
                    [self.listTableView setEditing:NO animated:YES];
                    [self.selectorPatnArray removeAllObjects];
                }
            }];
            [alert showWBAler];
            isAll = NO;
        }
        [self.listTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (isAll) {
        return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
    }else{
        return UITableViewCellEditingStyleDelete;
    }
    
    
}

-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
        UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            
            NSDictionary *dic = @{@"id": [[self.array objectAtIndex:indexPath.row] objectForKey:@"id"]};
            
            if ([self.type isEqualToString:@"History"]) {
                [[OrientalHttpManager sharedInstance] requestWithTarget:delWatchHistory params:dic success:^(NSURLSessionDataTask *task, id responseObject, BOOL success) {
                    if (success) {
                        [self.listTableView reloadData];
                    }
                    
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    
                }];
            } else if ([self.type isEqualToString:@"Appointment"]){
                [[OrientalHttpManager sharedInstance] requestWithTarget:delProgAppointment params:dic success:^(NSURLSessionDataTask *task, id responseObject, BOOL success) {
                    if (success) {
                        [self.listTableView reloadData];
                    }
                    
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    
                }];
            }
            
            // 从数据源中删除
            
            [self.array removeObjectAtIndex:indexPath.row];
            // 从列表中删除
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            
        }];
        
        deleteAction.backgroundColor = [UIColor redColor];
        
        NSArray *actionArr = @[deleteAction];
        return actionArr;
   
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (tableView.editing == YES) {
//        return NO;
//        
//    }
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 89.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    PlayHistorycell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    cell.tintColor = [UIColor redColor];
    if (!cell) {
        cell = [[PlayHistorycell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    if ([self.type isEqualToString:@"History"]) {
        if (![[[self.array objectAtIndex:indexPath.row] objectForKey:@"intro"] isEqual:[NSNull null]]) {
            cell.centerLabel.text = [[self.array objectAtIndex:indexPath.row] objectForKey:@"intro"];

        }else{
            cell.centerLabel.text = @"未获取资源";

        }
        cell.nameLabel.text = [[self.array objectAtIndex:indexPath.row] objectForKey:@"program_name"];
        cell.timeLabel.text = [[self.array objectAtIndex:indexPath.row] objectForKey:@"ctime"];
        cell.stateLabel.text =[[self.array objectAtIndex:indexPath.row] objectForKey:@"channel_name"];
        [cell.coverImage sd_setImageWithURL:[[self.array objectAtIndex:indexPath.row] objectForKey:@"play_imgs"] placeholderImage:nil];
    } else if ([self.type isEqualToString:@"Appointment"]){
        cell.centerLabel.text = [[self.array objectAtIndex:indexPath.row] objectForKey:@"intro"];
        cell.nameLabel.text = [[self.array objectAtIndex:indexPath.row] objectForKey:@"programname"];
        cell.timeLabel.text = [[self.array objectAtIndex:indexPath.row] objectForKey:@"ctime"];
        cell.stateLabel.text =[[self.array objectAtIndex:indexPath.row] objectForKey:@"channel_name"];
        [cell.coverImage sd_setImageWithURL:[[self.array objectAtIndex:indexPath.row] objectForKey:@"playimgs"] placeholderImage:nil];
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
