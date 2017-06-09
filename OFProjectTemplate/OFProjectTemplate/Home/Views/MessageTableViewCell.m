//
//  MessageTableViewCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@implementation MessageTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews{
    
    [self.coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(9.5, 12.5, 17.5, 0));
        make.width.equalTo(@48);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImage.mas_top);
        make.left.equalTo(self.coverImage.mas_right).offset(15);
    }];
    
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
        make.right.equalTo(self.timeLabel.mas_right);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
    
    
    
    
}


-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = UIFontMake(14);
        _nameLabel.textColor = UIColorMake(51, 51, 51);
        _nameLabel.text = @"爸爸去哪了大电影";
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = UIFontMake(13);
        _timeLabel.textColor = UIColorMake(153, 153, 153);
        _timeLabel.text = @"2017.06.08";
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeLabel];
    }
    return _timeLabel;
}

-(UILabel *)centerLabel{
    if (!_centerLabel) {
        _centerLabel = [[UILabel alloc]init];
        _centerLabel.font = UIFontMake(13);
        _centerLabel.textColor = UIColorMake(102, 102, 102);
        _centerLabel.text = @"客厅的东方有线数字电视";
        _centerLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_centerLabel];
    }
    return _centerLabel;
}


- (UIImageView *)coverImage{
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"8"]];
        _coverImage.layer.masksToBounds = YES;
        _coverImage.layer.cornerRadius = 24;
        [self.contentView addSubview:_coverImage];
    }
    return _coverImage;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
