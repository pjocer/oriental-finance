//
//  ChanneldetailsVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/1.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ChanneldetailsVC.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"
#import "ZYBannerView.h"
#import "CommentsCell.h"
#import "IntroductionCell.h"
#import "OShowDetailsView.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kNavigationBarHeight  50.0
#define kBannerHeight 192.0

@interface ChanneldetailsVC () <ZYBannerViewDataSource, ZYBannerViewDelegate, UITableViewDelegate, UITableViewDataSource>{
    UIScrollView *scrollView;
}


@property (nonatomic, strong) ZYBannerView *banner;
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong)UIButton *platTVBtn;
@end

@implementation ChanneldetailsVC






- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

   
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 49, 0));
    }];
    [self.listTableView setNeedsLayout];
    [self.listTableView layoutIfNeeded];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];

    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    scrollView.contentSize = CGSizeMake(kScreenWidth/3*self.dataArray.count, 0);
    scrollView.scrollEnabled = NO;
    [headView addSubview:scrollView];
    
    
    NSArray *timeARR = @[@"15:37", @"16:37", @"17:37", @"18:37", @"19:37", @"20:37"];
    
    UIImageView *timeline = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"channel_timeLine"]];
//    timeline.frame = CGRectMake(kScreenWidth/6, 7.5, kScreenWidth, 1);
    [scrollView addSubview:timeline];
    
    [timeline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView.mas_top).offset(9.5);
        make.left.equalTo(headView);
        make.right.equalTo(headView);
        make.height.equalTo(@1);
    }];
    
    
    
    for (NSInteger i = 0; i < self.dataArray.count; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/3 + kScreenWidth/3*i, 20, kScreenWidth/3, 30)];
        
        label.text = [NSString  stringWithFormat:@"%@\n第%ld集",[timeARR objectAtIndex:i],i+1];
        label.numberOfLines = 2;
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:label];
        
        UILabel *roundLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/6 + kScreenWidth/3 + kScreenWidth/3*i -2.5 , 7.5, 5, 5)];
        roundLabel.layer.masksToBounds = YES;
        roundLabel.layer.cornerRadius = 2.5;
        roundLabel.backgroundColor = [UIColor lightGrayColor];
        [scrollView addSubview:roundLabel];
        
    }
    [self setupBannerwith:headView];
    
    NSDate *senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"mm"];
    NSDateFormatter  *dateformatter2=[[NSDateFormatter alloc] init];
    [dateformatter2 setDateFormat:@"HH"];
    NSString *locationString = [dateformatter stringFromDate:senddate];
    NSString *locationString2 = [dateformatter2 stringFromDate:senddate];
    
   BOOL isYes = [self isBetweenFromHour:[locationString2 integerValue] FromMinute:[locationString integerValue] toHour: [locationString2 integerValue]+1 toMinute:[locationString integerValue]];
    
    
    
    self.platTVBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (isYes == YES) {
        [self.platTVBtn setTitle:@"在电视机上播放" forState:UIControlStateNormal];
        self.platTVBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:162/255.0 blue:65/255.0 alpha:1];
    }else{
        [self.platTVBtn setTitle:@"预约提醒" forState:UIControlStateNormal];
        self.platTVBtn.backgroundColor = [UIColor colorWithRed:52/255.0 green:147/255.0 blue:223/255.0 alpha:1];
    }
   
    self.platTVBtn.layer.cornerRadius = 5;
    self.platTVBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [headView addSubview:self.platTVBtn];
    
    [self.platTVBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(headView).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        make.height.equalTo(@35);
        make.bottom.equalTo(headView).offset(-10);
    }];
    
    CGFloat height = [headView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect frame = headView.frame;
    frame.size.height = 297;
    
    headView.frame = frame;
//
    self.listTableView.tableHeaderView = headView;
    
    UIView *footView = [[UIView alloc]init];
    footView.backgroundColor = UIColorMake(236, 236, 236);
    [self.view addSubview:footView];
    
    [footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.height.equalTo(@49);
    }];
    
    UIImageView *headerImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Oval"]];
    [footView addSubview:headerImage];
    
    [headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(footView).insets(UIEdgeInsetsMake(9, 15, 9, 0));
        make.width.height.equalTo(@30);
    }];
    
    UIButton *replyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    replyBtn.backgroundColor = [UIColor whiteColor];
    [replyBtn setTitle:@"一秒登录,我来说几句..." forState:UIControlStateNormal];
    [replyBtn setTitleColor:UIColorMake(153, 153, 153) forState:UIControlStateNormal];
    replyBtn.titleLabel.font = UIFontMake(13);
    [self.view addSubview:replyBtn];
    
    [replyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(footView).insets(UIEdgeInsetsMake(9, 0, 9, 15));
        make.left.equalTo(headerImage.mas_right).offset(15);
    }];
    
    



}


- (BOOL)isBetweenFromHour:(NSInteger)fromHour FromMinute:(NSInteger)fromMin toHour:(NSInteger)toHour toMinute:(NSInteger)toMin
{
    NSDate *date8 = [self getCustomDateWithHour:fromHour andMinute:fromMin];
    NSDate *date23 = [self getCustomDateWithHour:toHour andMinute:toMin];
    
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate compare:date8]==NSOrderedDescending && [currentDate compare:date23]==NSOrderedAscending)
    {
        NSLog(@"该时间在 %d:%d-%d:%d 之间！", fromHour, fromMin, toHour, toMin);
        return YES;
    }
    return NO;
}

- (NSDate *)getCustomDateWithHour:(NSInteger)hour andMinute:(NSInteger)minute
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    [resultComps setMinute:minute];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    return [resultCalendar dateFromComponents:resultComps];
}


- (void)setupBannerwith:(UIView *)view
{
    // 初始化
    self.banner = [[ZYBannerView alloc] init];
    self.banner.dataSource = self;
    self.banner.delegate = self;
    self.banner.showFooter = NO;
    self.banner.pageNum = 3;
    [view addSubview:self.banner];
    
    // 设置frame
    self.banner.frame = CGRectMake(0,
                                   kNavigationBarHeight,
                                   kScreenWidth,
                                   kBannerHeight);
    

}

#pragma mark - ZYBannerViewDataSource

// 返回 Banner 需要显示 Item(View) 的个数
- (NSInteger)numberOfItemsInBanner:(ZYBannerView *)banner
{
    return self.dataArray.count;
}

// 返回 Banner 在不同的 index 所要显示的 View (可以是完全自定义的v iew, 且无需设置 frame)
- (UIView *)banner:(ZYBannerView *)banner viewForItemAtIndex:(NSInteger)index
{
    // 取出数据
    NSString *imageName = self.dataArray[index];
    
    // 创建将要显示控件
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage imageNamed:imageName];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    return imageView;

    OShowDetailsView *view = [[OShowDetailsView alloc]init];
    view.coverImage.image = [UIImage imageNamed:imageName];
    view.backgroundView.image = [UIImage imageNamed:imageName];
    return view;
}


-(void)scrollviewWithOffset:(CGFloat)offsetX{
//    NSLog(@"%.f",offsetX);
    [scrollView setContentOffset:CGPointMake(offsetX/3, 0)];
    //    if (offsetX == 0) {
    //        [scrollView setContentOffset:CGPointMake(kScreenWidth/3, 0)];
    //    }else if (offsetX == kScreenWidth/3 *(self.dataArray.count-1)){
    //        [scrollView setContentOffset:CGPointMake(kScreenWidth/3 *(self.dataArray.count-1), 0)];
    //    }
   
    

}
- (void)scrollviewPageWithOffset:(CGFloat)offsetX{
    NSLog(@"----+++++++%.f", offsetX/375);
    if (offsetX/375 > 3) {
        [self.platTVBtn setTitle:@"预约提醒" forState:UIControlStateNormal];
        self.platTVBtn.backgroundColor = [UIColor colorWithRed:52/255.0 green:147/255.0 blue:223/255.0 alpha:1];
    }else if (offsetX/375 < 3){
        [self.platTVBtn setTitle:@"回  放" forState:UIControlStateNormal];
//        self.platTVBtn.backgroundColor = [UIColor colorWithRed:52/255.0 green:147/255.0 blue:223/255.0 alpha:1];
        self.platTVBtn.backgroundColor = [UIColor redColor];
    }else{
        [self.platTVBtn setTitle:@"在电视机上播放" forState:UIControlStateNormal];
        self.platTVBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:162/255.0 blue:65/255.0 alpha:1];
    }
    
}


#pragma mark - ZYBannerViewDelegate

// 在这里实现点击事件的处理
- (void)banner:(ZYBannerView *)banner didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%ld个项目", index);
}





#pragma mark Getter

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"9", @"10", @"6",@"asd", @"ppppp", @"6"];
    }
    return _dataArray;
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
            if (indexPath.row == 2) {
                cell = [[CommentsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid type:@"reply"];
                
            }else{
                cell = [[CommentsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid type:@"123"];
                
            }
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
