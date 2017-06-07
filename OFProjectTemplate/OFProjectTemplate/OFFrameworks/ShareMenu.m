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
@property (nonatomic, assign) BOOL autoHidden;
@end

@implementation ShareMenu

- (instancetype)commitItems {
    return self;
}

- (instancetype)subscribe {
    [[self rac_signalForSelector:@selector(moreOperationController:didSelectItemAtTag:) fromProtocol:@protocol(QMUIMoreOperationDelegate)] subscribeNext:^(RACTuple *x) {
        RACTupleUnpack(ShareMenu *menu, NSNumber *obj_tag) = x;
        MoreOperationTag tag = [obj_tag unsignedIntegerValue];
        ShareMenuItemView *itemView = (ShareMenuItemView *)[menu itemAtTag:tag];
        if (menu.action) {
            menu.action(itemView);
        }
        if (menu.autoHidden) {
            [menu hideToBottom];
        }
    }];
    return self;
}

+ (void)showDefaultTagsWithStyle:(ShareMenuStyle)style compeletion:(MoreOperationItemAction)compeletion{
    [self showWith:MoreOperationTagShareWechat|MoreOperationTagShareMoment|MoreOperationTagShareQzone|MoreOperationTagShareWeibo|MoreOperationTagShareMail|MoreOperationTagBookMark|MoreOperationTagSafari|MoreOperationTagReport style:ShareMenuStyleBorderCancel compeletion:compeletion autoHidden:YES];
}

+ (void)showWith:(MoreOperationTag)tags style:(ShareMenuStyle)style compeletion:(MoreOperationItemAction)compeletion autoHidden:(BOOL)hidden{
    ShareMenu *menu = [ShareMenu new];
    [menu subscribe].delegate = menu;
    menu.autoHidden = hidden;
    menu.action = compeletion;
    if (tags & MoreOperationTagShareWechat) {
        [menu addItemWithTitle:@"微信好友" image:UIImageMake(@"wechat") type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTagShareWechat];
    }
    if (tags & MoreOperationTagShareMoment) {
        [menu addItemWithTitle:@"朋友圈" image:UIImageMake(@"moment") type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTagShareMoment];
    }
    if (tags & MoreOperationTagShareQzone) {
        [menu addItemWithTitle:@"QQ空间" image:UIImageMake(@"qq_zone") type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTagShareQzone];
    }
    if (tags & MoreOperationTagShareWeibo) {
        [menu addItemWithTitle:@"新浪微博" image:UIImageMake(@"sina_weibo") type:QMUIMoreOperationItemTypeImportant tag:MoreOperationTagShareWeibo];
    }
    if (tags & MoreOperationTagShareMail) {
        [menu addItemWithTitle:@"邮件" selectedTitle:nil image:UIImageMake(@"mail") selectedImage:nil type:QMUIMoreOperationItemTypeNormal tag:MoreOperationTagShareMail];
    }
    if (tags & MoreOperationTagBookMark) {
        [menu addItemWithTitle:@"收藏" selectedTitle:@"取消收藏" image:UIImageMake(@"bookmark") selectedImage:UIImageMake(@"bookmark_selected") type:QMUIMoreOperationItemTypeNormal tag:MoreOperationTagBookMark];
    }
    if (tags & MoreOperationTagSafari) {
        [menu addItemWithTitle:@"浏览器打开" image:UIImageMake(@"safari") type:QMUIMoreOperationItemTypeNormal tag:MoreOperationTagSafari];
    }
    if (tags & MoreOperationTagReport) {
        [menu addItemWithTitle:@"举报" image:UIImageMake(@"report") type:QMUIMoreOperationItemTypeNormal tag:MoreOperationTagReport];
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
}
@end
