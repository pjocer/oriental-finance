//
//  DetailsViewController.h
//  OFClient
//
//  Created by wangdongwen on 2017/5/25.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "OFBaseViewController.h"
#import "OShowDetailsView.h"

@interface DetailsViewController : OFBaseViewController
@property (nonatomic, strong) OShowDetailsView *detailesView;

@property (strong, nonatomic)UITableView *listTableView;


@end
