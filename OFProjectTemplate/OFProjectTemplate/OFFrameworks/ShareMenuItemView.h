//
//  ShareMenuItemView.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/7.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>

typedef NS_OPTIONS(NSUInteger, MoreOperationType) {
    MoreOperationTypeShareNone       = 0,
    MoreOperationTypeShareWechat     = 1 << 0,
    MoreOperationTypeShareMoment     = 1 << 1,
    MoreOperationTypeShareQzone      = 1 << 2,
    MoreOperationTypeShareQQ         = 1 << 3,
    MoreOperationTypeShareWeibo      = 1 << 4,
    MoreOperationTypeShareMail       = 1 << 5,
    MoreOperationTypeBookMark        = 1 << 6,
    MoreOperationTypeSafari          = 1 << 7,
    MoreOperationTypeReport          = 1 << 8,
    MoreOperationTypeClipboard       = 1 << 9,
    MoreOperationTypeAll             = (1 << 10)-1,
};

@interface QMUIMoreOperationItemView (Operation)

@property (nonatomic, assign, readonly) MoreOperationType operationtype;

@end

@interface ShareMenuItemView : QMUIMoreOperationItemView

@end
