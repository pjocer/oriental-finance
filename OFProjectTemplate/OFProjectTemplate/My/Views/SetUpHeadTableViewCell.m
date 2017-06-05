//
//  SetUpHeadTableViewCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SetUpHeadTableViewCell.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"

@implementation SetUpHeadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews{
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"头像";
    label.font = UIFontMake(16);
    [self.contentView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).insets(UIEdgeInsetsMake(28.5, 22.5, 0, 0));
    }];
    
    [self.contentView addSubview:self.headImage];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(9.5, 0, 17.5, 42));
        make.height.width.equalTo(@60);
    }];
    
    UIImageView *newxtImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"next"]];
    [self.contentView addSubview:newxtImage];
    [newxtImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-18.5);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@14);
        make.width.equalTo(@14);
    }];
    
    
}

-(UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Ovala"]];
        _headImage.layer.masksToBounds = YES;
        _headImage.layer.cornerRadius = 30;
        
    }
    return _headImage;
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
