//
//  HomeChannelLiveCell.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *HomeChannelLiveCellIdentifier = @"HomeChannelLiveCellIdentifier";

@interface HomeChannelLiveCell : UITableViewCell

- (void)setDidSelectedBlock:(dispatch_block_t)block;

@end
