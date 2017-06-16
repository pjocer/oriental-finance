//
//  OrderTableViewModel.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/16.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserCenterMacros.h"
#import <UIKit/UIKit.h>

@interface OrderTableViewModel : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataSource;

- (instancetype)initWithType:(OrderListType)type tableView:(UITableView *)tableView;

@end
