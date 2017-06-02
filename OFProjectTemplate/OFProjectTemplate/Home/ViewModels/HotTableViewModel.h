//
//  HotTableViewModel.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, HotTableViewSelectType) {
    HotTableViewSelectTypeHot,
    HotTableViewSelectTypeUnknow,
};

@interface HotTableViewModel : NSObject <UITableViewDelegate, UITableViewDataSource>

- (void)setDidSelectedBlock:(void(^)(HotTableViewSelectType type, id data))block;

@end
