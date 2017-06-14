//
//  MyApplicationVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/13.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyApplicationVC.h"
#import "MyApplicationCell.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@interface MyApplicationVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{
    UICollectionView *mainCollectionView;
    NSMutableArray *dataSource;
}

@end

@implementation MyApplicationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dataSource = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [dataSource addObject:[NSString stringWithFormat:@"%d", i]];
    }

    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize =CGSizeMake(110, 150);
    
    mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:layout];
    
    
    // 删除
    UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc] initWithTitle:@"删除"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(respondsToBarButtonItem:)];
    self.navigationItem.rightBarButtonItem = deleteItem;
    [self.view addSubview:mainCollectionView];
    mainCollectionView.allowsSelection = NO;
    // 设置是否允许多选，默认NO
    mainCollectionView.allowsMultipleSelection = YES;
    mainCollectionView.backgroundColor = [UIColor clearColor];
    
    [mainCollectionView registerClass:[MyApplicationCell class] forCellWithReuseIdentifier:@"cellId"];
    
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
}

#pragma mark *** Events ***
- (void)respondsToBarButtonItem:(UIBarButtonItem *)sender {
    

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyApplicationCell *cell = (MyApplicationCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
    cell.topImage.image = [UIImage imageNamed:@"2048"];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 122.5);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 30, 10, 30);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 37.5;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyApplicationCell *cell = (MyApplicationCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *msg = cell.botlabel.text;
    NSLog(@"%@",msg);
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
