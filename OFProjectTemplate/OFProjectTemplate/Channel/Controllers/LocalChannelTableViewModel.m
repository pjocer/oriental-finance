//
//  LocalChannelTableViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "LocalChannelTableViewModel.h"

@interface LocalChannelTableViewModel ()

@end

@implementation LocalChannelTableViewModel

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LocalChannelCell *cell = [tableView dequeueReusableCellWithIdentifier:LocalChannelCellIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
