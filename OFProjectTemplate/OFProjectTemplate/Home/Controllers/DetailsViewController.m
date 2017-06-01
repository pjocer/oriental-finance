//
//  DetailsViewController.m
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "DetailsViewController.h"
#import <Masonry.h>
#import "CommentsCell.h"
#import "IntroductionCell.h"


@interface DetailsViewController ()<UITableViewDelegate, UITableViewDataSource, IntroductionCellDelegate>

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    self.view.backgroundColor = [UIColor whiteColor];
    

    
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.listTableView setNeedsLayout];
    [self.listTableView layoutIfNeeded];

    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    
    self.detailesView = [[OShowDetailsView alloc] init];
    [headView addSubview:self.detailesView];
    
    [self.detailesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(headView);
    }];

    
    CGFloat height = [headView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect frame = headView.frame;
    frame.size.height = height;
    
    headView.frame = frame;

    self.listTableView.tableHeaderView = headView;


    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    CommentsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    IntroductionCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (indexPath.row == 0) {
        cell1 = [[IntroductionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell1.delegate = self;
        return cell1;
    }else{
        if (!cell) {
            cell = [[CommentsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            NSArray *arr = @[@"1",@"2",@"1",@"1",@"2",@"1",@"1",@"2",@"1",@"2"];
            cell.coverImage.backgroundColor = [UIColor redColor];
            cell.coverImage.image = [UIImage imageNamed:[arr objectAtIndex:indexPath.row]];
        }
        if (indexPath.row == 2) {
            cell.contentLabel.text = @"农安抖擞ID哦啊上的傲视对讲机噢爱接收到奥圣诞节哦啊上的奥圣诞节啊大家谁都奥斯达哦啊的奥圣诞节奥圣诞节啊iOS的奥斯达较深的奥斯多久奥斯达奥圣诞节奥斯达骄傲扫地机奥圣诞节啊老师都没奶欧舒丹艾吉奥四大家爱哦圣诞节奥圣诞节啊ISO多久爱哦圣诞节奥斯多久奥斯达偶就安排三等奖阿萨德按实际的抛售的浸泡圣诞节阿婆圣诞节阿普斯的静安寺坡静安寺皮带机安排搜到骄傲平时大家安排圣诞节哦怕受打击安排时间都怕时间都怕死的骄傲破碎的骄傲平时吃的可哦啊是";
        }else if (indexPath.row == 5){
            cell.contentLabel.text = @"emeememmememememmeem";
        }

    }
    
    return cell;
}

-(void)IntroductionCellDelegate:(UIButton *)btn {
    [self.listTableView beginUpdates];
    [self.listTableView endUpdates];
}

- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc]init];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.separatorColor = [UIColor clearColor];
        _listTableView.estimatedRowHeight = 50;
        _listTableView.rowHeight = UITableViewAutomaticDimension;
        
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
