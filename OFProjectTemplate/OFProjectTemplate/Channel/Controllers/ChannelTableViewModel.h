//
//  LocalChannelTableViewModel.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChannelTableViewCell.h"
#import "ChannelMacros.h"

@interface ChannelTableViewModel : NSObject <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) ChannelType type;
- (void)playAction;
@end
