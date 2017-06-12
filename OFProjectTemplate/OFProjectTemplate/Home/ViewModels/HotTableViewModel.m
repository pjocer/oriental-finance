//
//  HotTableViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "HotTableViewModel.h"
#import "HotTableViewCell.h"
#import "OFHomeMacro.h"
#import "OFUIkitMacro.h"
#import "HomeChannelLiveCell.h"

@interface HotTableViewModel ()
@property (nonatomic, copy) void (^block)(TableViewSelectType, id) ;
@property (nonatomic, assign) HomeControllerType type;
@end

@implementation HotTableViewModel

- (instancetype)initWithType:(HomeControllerType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)setDidSelectedBlock:(void (^)(TableViewSelectType, id))block {
    _block = block;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.type) {
        case HomeControllerTypeHot:
        {
            if (indexPath.row == 0) {
                HotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HotTableViewCellIdentifier forIndexPath:indexPath];
                [cell setBlock:self.block];
                return cell;
            } else {
                HomeChannelLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeChannelLiveCellIdentifier forIndexPath:indexPath];
                cell.block = self.block;
                return cell;
            }
        }
            break;
        case HomeControllerTypeTeleplay:
        case HomeControllerTypeTopic:
        case HomeControllerTypeVariety:
        case HomeControllerTypeTelevision:
        {
            HomeChannelLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeChannelLiveCellIdentifier forIndexPath:indexPath];
            cell.block = self.block;
            return cell;
        }
        case HomeControllerTypeAppointment:
        {
            HotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HotTableViewCellIdentifier forIndexPath:indexPath];
            [cell setBlock:self.block];
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type == HomeControllerTypeHot) {
        if (indexPath.row == 0) {
            return HotTableViewCellRowHeight;
        } else {
            return 580;
        }
    } else if (self.type == HomeControllerTypeAppointment) {
        return HotTableViewCellRowHeight;
    } else {
        return 580;
    }
}

@end
