//
//  OrderListCell.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/16.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserCenterMacros.h"

static NSString *OrderListCellIdentifier = @"OrderListCellIdentifier";

@interface OrderListCell : UITableViewCell

@property (nonatomic, assign) OrderListType type;

@end
