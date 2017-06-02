//
//  OSearchContentViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OSearchContentViewModel.h"

@implementation OSearchContentViewModel

- (void)saveSearchHistory:(NSString *)text {
    NSArray *searchHis = [self searhHistory];
    if (searchHis.count>10) { // 历史记录默认只存10个
        [SearchDAO deleteSearchHistory:[searchHis lastObject]];
    }
    [SearchDAO saveSearchHistory:text];
}

- (NSMutableArray *)searhHistory {
    return [SearchDAO searhHistory];
}

- (MWDBERROR)deleteSearchHistory {
    return [SearchDAO deleteAllSearchHistory];
}

- (void)fetchHotSearchWithCompeletion:(dispatch_block_t)compeletion {
    if (compeletion) compeletion();
}

@end
