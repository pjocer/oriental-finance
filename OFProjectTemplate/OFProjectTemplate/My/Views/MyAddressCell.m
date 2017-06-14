//
//  MyAddressCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MyAddressCell.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"


@implementation MyAddressCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSString *)type{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViewsWithDefault:type];
    }
    return self;
}
- (void)createSubViewsWithDefault:(NSString *) type{
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.phoneLabel];
    [self.contentView addSubview:self.defaultAddress];
    [self.contentView addSubview:self.provincesAddress];


    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 15, 0, 0));
        make.height.equalTo(@22.5);
        make.right.equalTo(self.phoneLabel.mas_left);
    }];
    
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 15, 0, 15));
        make.height.equalTo(@22.5);
    }];
    
    
    
    if ([type isEqualToString:@"default"]) {
        [self.defaultAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
            make.width.equalTo(@70);
        }];
        [self.provincesAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.defaultAddress.mas_right);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
            make.right.equalTo(self.contentView.mas_right).offset(-15);
        }];
    }else{
        [self.provincesAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_left);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
            make.right.equalTo(self.contentView.mas_right).offset(-15);
        }];
    }
    
    
    [self.contentView addSubview:self.detailedAddress];
    [self.detailedAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.provincesAddress.mas_bottom);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
}




- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"小叮当";
        _nameLabel.font = UIFontMake(16);
    }
    return _nameLabel;
}

- (UILabel *)defaultAddress{
    if (!_defaultAddress) {
        _defaultAddress = [[UILabel alloc]init];
        _defaultAddress.text = @"[默认地址]";
        _defaultAddress.font = UIFontMake(14);
        _defaultAddress.textColor = UIColorMake(229, 75, 20);
    }
    return _defaultAddress;
}

- (UILabel *)provincesAddress{
    if (!_provincesAddress) {
        _provincesAddress = [[UILabel alloc]init];
        _provincesAddress.text = @"啊山东我啊婚纱都爱上到底好事达山东阿斯顿";
        _provincesAddress.font = UIFontMake(14);
    }
    return _provincesAddress;
}
- (UILabel *)detailedAddress{
    if (!_detailedAddress) {
        _detailedAddress = [[UILabel alloc]init];
        _detailedAddress.text = @"埃里克森的厚爱老师肯定不好受大傻逼了大火收到你";
        _detailedAddress.font = UIFontMake(14);
    }
    return _detailedAddress;
}

- (UILabel *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.text = @"17603607917";
        _phoneLabel.font = UIFontMake(16);
        _phoneLabel.textColor = UIColorMake(153, 153, 153);
    }
    return _phoneLabel;
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
