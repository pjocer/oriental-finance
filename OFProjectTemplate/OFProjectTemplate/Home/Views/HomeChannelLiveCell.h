//
//  HomeChannelLiveCell.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotTableViewCell.h"

static NSString *HomeChannelLiveCellIdentifier = @"HomeChannelLiveCellIdentifier";

@interface HomeChannelLiveCell : UITableViewCell

@property (nonatomic, copy) void (^block)(TableViewSelectType type, id data);

@end
