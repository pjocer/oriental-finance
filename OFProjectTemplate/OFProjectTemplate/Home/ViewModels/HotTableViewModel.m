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
@property (nonatomic, copy) void (^block)(HotTableViewSelectType, id) ;
@end

@implementation HotTableViewModel

- (void)setDidSelectedBlock:(void (^)(HotTableViewSelectType, id))block {
    _block = block;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_show) {
        HomeChannelLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeChannelLiveCellIdentifier forIndexPath:indexPath];
        
        [cell setDidSelectedBlock:^{
            if (self.block) self.block(HotTableViewSelectTypeLiving, nil);
        }];
        return cell;
    }
    if (indexPath.row == 0) {
        HotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HotTableViewCellIdentifier forIndexPath:indexPath];
        [cell setDidSelectedBlock:^(BOOL isCell) {
            if (isCell) {
                if (self.block) self.block(HotTableViewSelectTypeHot, nil);
            } else {
                if (self.block) self.block(HotTableViewSelectTypeRefresh, nil);
            }
        }];
        return cell;
    } else {
        HomeChannelLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeChannelLiveCellIdentifier forIndexPath:indexPath];
        
        [cell setDidSelectedBlock:^{
            if (self.block) self.block(HotTableViewSelectTypeLiving, nil);
        }];
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_show) {
        return 580;
    }
    if (indexPath.row == 0) {
        return HotTableViewCellRowHeight;
    } else {
        return 580;
    }
}

@end
