//
//  HomeTableViewModel.m
//  OFClient
//
//  Created by 吉冠虎 on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import "HomeTableViewModel.h"
#import <ReactiveCocoa.h>

@interface HomeTableViewModel ()
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation HomeTableViewModel

- (void)fetchDataWithCompeletion:(void (^)(NSArray<HomeModel *> *))completion {
    
}

- (void)clickAction:(void (^)(HomeCellClickActionType))block {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.didSelectedBlock([self.dataSource objectAtIndex:indexPath.row]);
}

@end
