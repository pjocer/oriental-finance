//
//  OSearchContentViewModel.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchDAO.h"

@interface OSearchContentViewModel : NSObject

- (void)saveSearchHistory:(NSString *)text;

- (NSMutableArray *)searhHistory;

- (MWDBERROR)deleteSearchHistory;

- (void)fetchHotSearchWithCompeletion:(dispatch_block_t)compeletion;

@end
