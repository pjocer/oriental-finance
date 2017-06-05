//
//  SetUpTableViewCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SetUpTableViewCell.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@implementation SetUpTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews{
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(22.5);
    }];
    
    [self.contentView addSubview:self.textsLabel];
    [self.textsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-40.5);
    }];
    
    UIImageView *newxtImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"next"]];
    [self.contentView addSubview:newxtImage];
    [newxtImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-18.5);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@14);
        make.width.equalTo(@12);
    }];
    
    
    
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = UIFontMake(16);
    }
    return _titleLabel;
}

-(UILabel *)textsLabel{
    if (!_textsLabel) {
        _textsLabel = [[UILabel alloc]init];
        _textsLabel.font = UIFontMake(14);
        _textsLabel.textColor = UIColorMake(153, 153, 153);
    }
    return _textsLabel;
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
