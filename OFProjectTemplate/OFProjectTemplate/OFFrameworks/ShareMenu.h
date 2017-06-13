//
//  ShareMenu.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/7.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShareMenuItemView.h"

typedef NS_ENUM(NSUInteger, ShareMenuStyle) {
    ShareMenuStyleNormal,
    ShareMenuStyleBorder,
    ShareMenuStyleBorderCancel,
};

typedef void(^MoreOperationItemAction)(ShareMenuItemView *item);

@interface ShareMenu : QMUIMoreOperationController

+ (instancetype)showDefaultTypesWithStyle:(ShareMenuStyle)style
                              compeletion:(MoreOperationItemAction)compeletion
                                 canceled:(dispatch_block_t)canceled;

+ (instancetype)showWith:(MoreOperationType)type
                   style:(ShareMenuStyle)style
             compeletion:(MoreOperationItemAction)compeletion
                canceled:(dispatch_block_t)canceled;

@end
