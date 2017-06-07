//
//  AderView.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/6.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AderView : UIView

@property (nonatomic, strong) NSArray *ads;

@property (nonatomic, copy) dispatch_block_t didSelectedBlock;

@end
