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

@interface HotTableViewModel ()
@property (nonatomic, copy) void (^block)(HotTableViewSelectType, id) ;
@end

@implementation HotTableViewModel

- (void)setDidSelectedBlock:(void (^)(HotTableViewSelectType, id))block {
    _block = block;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HotTableViewCellIdentifier forIndexPath:indexPath];
    [cell setDidSelectedBlock:^{
        if (self.block) self.block(HotTableViewSelectTypeHot, nil);
    }];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return HotTableViewCellRowHeight;
}

@end
