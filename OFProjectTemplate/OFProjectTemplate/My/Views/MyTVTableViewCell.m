//
//  MyTVTableViewCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyTVTableViewCell.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@implementation MyTVTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews{
    [self.TVimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(14, 30, 13, 0));
        make.width.equalTo(@15);
    }];
    
    [self.linkState mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.top.equalTo(self.contentView).insets(UIEdgeInsetsMake(14, 0, 14, 20));
        make.left.equalTo(self.TVNameLabel.mas_right);
    }];
    
    [self.TVNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.linkState);
        make.left.equalTo(self.TVimage.mas_right).offset(15);
        make.right.equalTo(self.linkState.mas_left);
    }];
    
}



- (UIImageView *)TVimage{
    if (!_TVimage) {
        _TVimage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"My_TV"]];
        _TVimage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_TVimage];
    }
    return _TVimage;
}



-(UILabel *)TVNameLabel{
    if (!_TVNameLabel) {
        _TVNameLabel = [[UILabel alloc]init];
        _TVNameLabel.font = UIFontMake(16);
        _TVNameLabel.textColor = UIColorMake(51, 51, 51);
        _TVNameLabel.text = @"客厅的东方有线数字电视";
        _TVNameLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_TVNameLabel];
    }
    return _TVNameLabel;
}

-(UILabel *)linkState{
    if (!_linkState) {
        _linkState = [[UILabel alloc]init];
        _linkState.font = UIFontMake(13);
        _linkState.textColor = UIColorMake(229, 75, 20);
        _linkState.textAlignment = NSTextAlignmentRight;
        _linkState.text = @"在线";
        [self.contentView addSubview:_linkState];
    }
    return _linkState;
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
