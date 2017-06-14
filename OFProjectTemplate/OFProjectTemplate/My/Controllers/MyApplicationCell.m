//
//  MyApplicationCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/13.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyApplicationCell.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@implementation MyApplicationCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _topImage  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 7.5, 80, 80)];
        [self.contentView addSubview:_topImage];
        
        _botlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 92.5, 80, 25)];
        _botlabel.textAlignment = NSTextAlignmentCenter;
        _botlabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_botlabel];
    }
    
    return self;
}

@end
