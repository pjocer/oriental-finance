//
//  CommentsCell.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsCell : UITableViewCell

@property (nonatomic, strong) UIImageView *coverImage;

@property (nonatomic, strong)UILabel *nameLabel;

@property (nonatomic, strong)UILabel *timeLabel;

@property (nonatomic, strong)UILabel *contentLabel;

@end
