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

typedef NS_OPTIONS(NSUInteger, MoreOperationTag) {
    MoreOperationTagShareWechat     = 1 << 0,
    MoreOperationTagShareMoment     = 1 << 1,
    MoreOperationTagShareQzone      = 1 << 2,
    MoreOperationTagShareWeibo      = 1 << 3,
    MoreOperationTagShareMail       = 1 << 4,
    MoreOperationTagBookMark        = 1 << 5,
    MoreOperationTagSafari          = 1 << 6,
    MoreOperationTagReport          = 1 << 7,
};

typedef void(^MoreOperationItemAction)(ShareMenuItemView *item);

@interface ShareMenu : QMUIMoreOperationController

+ (void)showDefaultTagsWithStyle:(ShareMenuStyle)style
                     compeletion:(MoreOperationItemAction)compeletion;

+ (void)showWith:(MoreOperationTag)tags
           style:(ShareMenuStyle)style
     compeletion:(MoreOperationItemAction)compeletion
      autoHidden:(BOOL)hidden;

@end
