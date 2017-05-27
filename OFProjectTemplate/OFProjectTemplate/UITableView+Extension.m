//
//  UITableView+Extension.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)
- (void)reloadDataWithAnimation {
    [UIView transitionWithView:self duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionLayoutSubviews |UIViewAnimationOptionBeginFromCurrentState |
     UIViewAnimationOptionAllowUserInteraction
                    animations:^{
                        [self reloadData];
                    } completion:^(BOOL finished) {
                        
                    }];
}
@end
