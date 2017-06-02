//
//  OSearchContentViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OSearchContentViewModel.h"

@implementation OSearchContentViewModel

+ (void)saveSearchHistory:(NSString *)text {
    [SearchDAO saveSearchHistory:text];
}

+ (NSMutableArray *)searhHistory {
    return [SearchDAO searhHistory];
}

+ (MWDBERROR)deleteSearchHistory {
    return [SearchDAO deleteSearchHistory];
}

@end
