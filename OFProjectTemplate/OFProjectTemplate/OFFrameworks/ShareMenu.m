//
//  ShareMenu.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/7.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ShareMenu.h"
#import <ReactiveCocoa.h>

@interface ShareMenu () <QMUIMoreOperationDelegate>
@property (nonatomic, copy) MoreOperationItemAction action;
@property (nonatomic, copy) dispatch_block_t canceledAction;
@end

@implementation ShareMenu

- (instancetype)commitItems {
    return self;
}

- (instancetype)subscribe {
    [[self rac_signalForSelector:@selector(moreOperationController:didSelectItemAtTag:) fromProtocol:@protocol(QMUIMoreOperationDelegate)] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(ShareMenu *menu, NSNumber *obj_tag) = x;
        MoreOperationType type = [obj_tag unsignedIntegerValue];
        ShareMenuItemView *itemView = (ShareMenuItemView *)[menu itemAtTag:type];
        if (menu.action) {
            menu.action(itemView);
        }
        [menu hideToBottom];
    }];
    [[self rac_signalForSelector:NSSelectorFromString(@"hideToBottomCancelled:")] subscribeNext:^(RACTuple *x) {
        if (self.canceledAction && [x.first boolValue]) self.canceledAction();
    }];
    return self;
}

+ (instancetype)showDefaultTypesWithStyle:(ShareMenuStyle)style compeletion:(MoreOperationItemAction)compeletion canceled:(dispatch_block_t)canceled{
    
    return [self showWith:MoreOperationTypeShareWechat|MoreOperationTypeShareMoment|MoreOperationTypeShareQzone|MoreOperationTypeShareWeibo|MoreOperationTypeShareMail|MoreOperationTypeBookMark|MoreOperationTypeSafari|MoreOperationTypeReport style:ShareMenuStyleBorderCancel compeletion:compeletion canceled:canceled];
}

+ (instancetype)showWith:(MoreOperationType)type style:(ShareMenuStyle)style compeletion:(MoreOperationItemAction)compeletion canceled:(dispatch_block_t)canceled{
    NSAssert(type, @"MoreOperationType must not be MoreOperationNone");
    ShareMenu *menu = [ShareMenu new];
    [menu subscribe].delegate = menu;
    menu.action = compeletion;
    menu.canceledAction = canceled;
    if (type & MoreOperationTypeShareWechat) {
        [menu addItemWithTitle:@"微信好友" image:UIImageMake(@"wechat") type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTypeShareWechat];
    }
    if (type & MoreOperationTypeShareMoment) {
        [menu addItemWithTitle:@"朋友圈" image:UIImageMake(@"moment") type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTypeShareMoment];
    }
    if (type & MoreOperationTypeShareQzone) {
        [menu addItemWithTitle:@"QQ空间" image:UIImageMake(@"qq_zone") type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTypeShareQzone];
    }
    if (type & MoreOperationTypeShareWeibo) {
        [menu addItemWithTitle:@"新浪微博" image:UIImageMake(@"sina_weibo") type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTypeShareWeibo];
    }
    if (type & MoreOperationTypeShareMail) {
        [menu addItemWithTitle:@"邮件" selectedTitle:nil image:UIImageMake(@"mail") selectedImage:nil type:QMUIMoreOperationItemTypeNormal tag:MoreOperationTypeShareMail];
    }
    if (type & MoreOperationTypeBookMark) {
        [menu addItemWithTitle:@"收藏" selectedTitle:@"取消收藏" image:UIImageMake(@"bookmark") selectedImage:UIImageMake(@"bookmark_selected") type:QMUIMoreOperationItemTypeNormal tag:MoreOperationTypeBookMark];
    }
    if (type & MoreOperationTypeSafari) {
        [menu addItemWithTitle:@"浏览器打开" image:UIImageMake(@"safari") type:QMUIMoreOperationItemTypeNormal tag:MoreOperationTypeSafari];
    }
    if (type & MoreOperationTypeReport) {
        [menu addItemWithTitle:@"举报" image:UIImageMake(@"report") type:QMUIMoreOperationItemTypeNormal tag:MoreOperationTypeReport];
    }
    
    if (style == ShareMenuStyleNormal) {
        menu.contentEdgeMargin = 0;
        menu.contentMaximumWidth = SCREEN_WIDTH;
        menu.contentCornerRadius = 0;
        menu.contentBackgroundColor = UIColorMake(246, 246, 246);
        menu.cancelButtonHeight = 46;
        menu.cancelButtonTitleColor = UIColorMake(34, 34, 34);
        menu.cancelButtonFont = UIFontMake(16);
        menu.cancelButtonSeparatorColor = UIColorClear;
    }
    
    if (style == ShareMenuStyleBorderCancel) {
        menu.cancelButtonMarginTop = [QMUIMoreOperationController appearance].contentEdgeMargin;
    }
    
    [menu showFromBottom];
    return menu;
}
@end
