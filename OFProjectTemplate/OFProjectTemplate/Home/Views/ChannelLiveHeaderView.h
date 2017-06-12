//
//  ChannelLiveHeaderView.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *ChannelLiveHeaderViewIdentifier = @"ChannelLiveHeaderViewIdentifier";

@interface ChannelLiveHeaderView : UICollectionReusableView
@property (nonatomic, copy) dispatch_block_t clickAction;
@end
