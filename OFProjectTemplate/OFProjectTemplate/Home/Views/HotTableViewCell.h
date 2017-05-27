//
//  HotTableViewCell.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *HotTableViewCellIdentifier = @"HotTableViewCellIdentifier";

@interface HotTableViewCell : UITableViewCell

- (void)setDidSelectedBlock:(void(^)())block;

@end
