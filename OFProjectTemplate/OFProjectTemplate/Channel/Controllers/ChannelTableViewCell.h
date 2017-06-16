//
//  LocalChannelCell.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *ChannelTableViewCellIdentifier = @"ChannelTableViewCellIdentifier";

@interface ChannelTableViewCell : UITableViewCell

@property (nonatomic, copy) dispatch_block_t playAction;

@end
