//
//  MyBankCardCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyBankCardCell.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"


@implementation MyBankCardCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews{
    self.contentView.backgroundColor = UIColorMake(236, 236, 236);

    [self.contentView addSubview:self.backgroundview];
    [self.backgroundview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 12.5, 5, 12.5));
    }];
    
    
    [self.contentView addSubview:self.logoview];
    [self.logoview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.backgroundview).insets(UIEdgeInsetsMake(15, 15, 15, 15));
        make.width.height.equalTo(@30);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.backgroundview).insets(UIEdgeInsetsMake(11, 63, 0, 24));
    }];
    
    [self.contentView addSubview:self.typeLabel];
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.backgroundview).insets(UIEdgeInsetsMake(11, 63, 0, 24));
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
    }];
    
    [self.contentView addSubview:self.numLabel];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.backgroundview).insets(UIEdgeInsetsMake(11, 63, 12.5, 24));
    }];
    
    
    
}
- (UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc]init];
        _numLabel.text = @"**** **** **** 4798";
        _numLabel.font = UIFontMake(16);
        _numLabel.textColor = UIColorMake(255, 255, 255);
        _numLabel.textAlignment = NSTextAlignmentRight;
    }
    return _numLabel;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"中国工商银行";
        _titleLabel.font = UIFontMake(16);
        _titleLabel.textColor = UIColorMake(255, 255, 255);
    }
    return _titleLabel;
}

- (UILabel *)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc]init];
        _typeLabel.text = @"储蓄卡";
        _typeLabel.font = UIFontMake(11);
        _typeLabel.textColor = UIColorMake(255, 255, 255);
    }
    return _typeLabel;
}

- (UIImageView *)logoview{
    if (!_logoview) {
        _logoview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"channel_TV"]];
        _logoview.layer.masksToBounds = YES;
        _logoview.layer.cornerRadius = 15;
        
    }
    return _logoview;
}

- (UIView *)backgroundview{
    if (!_backgroundview) {
        _backgroundview = [[UIView alloc]init];
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)UIColorMake(203, 153,50).CGColor, (__bridge id)UIColorMake(125, 77,4).CGColor];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
        gradientLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH-25, 80);
        _backgroundview.layer.masksToBounds = YES;
        _backgroundview.layer.cornerRadius = 5;
        [_backgroundview.layer addSublayer:gradientLayer];
    }
    return _backgroundview;
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
