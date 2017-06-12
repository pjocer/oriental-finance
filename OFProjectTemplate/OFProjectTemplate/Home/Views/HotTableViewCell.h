//
//  HotTableViewCell.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TableViewSelectType) {
    TableViewSelectTypeHot,
    TableViewSelectTypeLiving,
    TableViewSelectTypeLivingHeader,
    TableViewSelectTypeRefresh,
    TableViewSelectTypeUnknow,
};

static NSString *HotTableViewCellIdentifier = @"HotTableViewCellIdentifier";

@interface HotTableViewCell : UITableViewCell

@property (nonatomic, copy) void (^block)(TableViewSelectType type, id data);

@end
