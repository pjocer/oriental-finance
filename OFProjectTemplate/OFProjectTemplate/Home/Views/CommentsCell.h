//
//  CommentsCell.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsCell : UITableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSString *)type;

@property (nonatomic, strong) UIImageView *coverImage;

@property (nonatomic, strong)UILabel *nameLabel;

@property (nonatomic, strong)UILabel *timeLabel;

@property (nonatomic, strong)UILabel *contentLabel;

@property (nonatomic, strong)UILabel *replynameLabel;

@property (nonatomic, strong)UIButton *replyBtn;

@end
