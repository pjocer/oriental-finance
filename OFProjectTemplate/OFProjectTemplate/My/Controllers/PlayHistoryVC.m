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
    self.array = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", @"01", @"10", @"11", @"14", @"15", @"17", @"18", @"19", nil];
    self.selectorPatnArray = [NSMutableArray array];
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
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
    footerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:footerView];
    
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@49);
    }];
    
    UIButton *selectAllBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:selectAllBtn];
    [selectAllBtn setTitle:@"全选" forState:UIControlStateNormal];
    [selectAllBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    selectAllBtn.titleLabel.font = UIFontMake(18);
    [selectAllBtn addTarget:self action:@selector(selectleAllAction:) forControlEvents:UIControlEventTouchUpInside];
    [selectAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(footerView).insets(UIEdgeInsetsMake(0, 30, 0, 0));
    }];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:cancelBtn];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = UIFontMake(18);
    [cancelBtn addTarget:self action:@selector(cancelSelectleAction:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(footerView).insets(UIEdgeInsetsMake(0, 30, 0, 30));
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
            // 从数据源中删除
            
            [self.array removeObjectAtIndex:indexPath.row];
            // 从列表中删除
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            //从数据库中删除
            
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
