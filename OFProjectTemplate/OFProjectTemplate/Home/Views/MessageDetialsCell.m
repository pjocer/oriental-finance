
//
//  MessageDetialsCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MessageDetialsCell.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"

@implementation MessageDetialsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews{
    [self.contentView addSubview:self.timelabel];
    self.contentView.backgroundColor = UIColorMake(236, 236, 236);

    
    [self.timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(17);
        make.centerX.equalTo(self.contentView);
        make.height.equalTo(@20);
    }];
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 2;
    [self.contentView addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 17.5, 0, 17.5));
        make.top.equalTo(self.timelabel.mas_bottom).offset(17.5);
    }];
    
    [backView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(backView).insets(UIEdgeInsetsMake(15, 15, 0, 15));
    }];
    
    [backView addSubview:self.centerLabel];
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(backView).insets(UIEdgeInsetsMake(0, 15, 16, 15));
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
    }];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
    }];
    
    
    
}
- (UILabel *)timelabel{
    if (!_timelabel) {
        _timelabel = [[UILabel alloc]init];
        _timelabel.text = @"2017-02-03 12:52";
        _timelabel.textAlignment = NSTextAlignmentCenter;
        _timelabel.layer.masksToBounds = YES;
        _timelabel.layer.cornerRadius = 2;
        _timelabel.font = UIFontMake(11);
        _timelabel.backgroundColor = UIColorMake(153, 153, 153);
        _timelabel.textColor = UIColorMake(255, 255, 255);
    }
    return _timelabel;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"储蓄卡";
        _timelabel.numberOfLines = 0;
        _titleLabel.font = UIFontMake(14);
        _titleLabel.textColor = UIColorMake(51, 51, 51);
    }
    return _titleLabel;
}

- (UILabel *)centerLabel{
    if (!_centerLabel) {
        _centerLabel = [[UILabel alloc]init];
        _centerLabel.text = @"东方遥控宝可以方便的遥控身边的家用电器。        我们还为您提供全面的电视节目相关服务，方便您更快找到喜欢的电视节目，并可以直接将电视切换到相应频道，更可以在手机上直接观看节目。使用东方遥控宝，看电视可以更美好。";
        _centerLabel.numberOfLines = 0;
        _centerLabel.font = UIFontMake(11);
        _centerLabel.textColor = UIColorMake(102, 102, 102);
    }
    return _centerLabel;
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
