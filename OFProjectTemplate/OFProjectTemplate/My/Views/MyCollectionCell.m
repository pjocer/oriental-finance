//
//  MyCollectionCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyCollectionCell.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@implementation MyCollectionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews{
    




}


-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = UIFontMake(16);
        _nameLabel.textColor = UIColorMake(51, 51, 51);
        _nameLabel.text = @"客厅的东方有线数字电视";
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = UIFontMake(16);
        _timeLabel.textColor = UIColorMake(51, 51, 51);
        _timeLabel.text = @"客厅的东方有线数字电视";
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_timeLabel];
    }
    return _timeLabel;
}

-(UILabel *)centerLabel{
    if (!_centerLabel) {
        _centerLabel = [[UILabel alloc]init];
        _centerLabel.font = UIFontMake(16);
        _centerLabel.textColor = UIColorMake(51, 51, 51);
        _centerLabel.text = @"客厅的东方有线数字电视";
        _centerLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_centerLabel];
    }
    return _centerLabel;
}

-(UILabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel = [[UILabel alloc]init];
        _stateLabel.font = UIFontMake(16);
        _stateLabel.textColor = UIColorMake(51, 51, 51);
        _stateLabel.text = @"客厅的东方有线数字电视";
        _stateLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_stateLabel];
    }
    return _stateLabel;
}

- (UIImageView *)coverImage{
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
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
