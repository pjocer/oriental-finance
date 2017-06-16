//
//  OrderTableViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/16.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OrderTableViewModel.h"
#import "OrderListCell.h"

@interface OrderTableViewModel ()
@property (nonatomic, assign) OrderListType type;
@end

@implementation OrderTableViewModel

- (instancetype)initWithType:(OrderListType)type tableView:(UITableView *)tableView {
    if (self = [super init]) {
        [[self bind:tableView] subscribe].type = type;
    }
    return self;
}

- (instancetype)bind:(UITableView *)tableView {
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[OrderListCell class] forCellReuseIdentifier:OrderListCellIdentifier];
    return self;
}

- (instancetype)subscribe {
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderListCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderListCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

@end
