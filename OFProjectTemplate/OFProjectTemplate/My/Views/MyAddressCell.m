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
    [self.contentView addSubview:self.detailedAddress];
    [self.contentView addSubview:self.defaultImage];
    [self.contentView addSubview:self.editBtn];
    [self.contentView addSubview:self.deleteBtn];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"默认地址";
    label.font = UIFontMake(14);
    [self.contentView addSubview:label];
    


    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 15, 0, 0));
        make.height.equalTo(@22.5);
        make.right.equalTo(self.phoneLabel.mas_left);
    }];
    
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 15, 0, 15));
        make.height.equalTo(@22.5);
    }];
    
    [self.defaultImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailedAddress.mas_bottom).offset(12);
        make.left.equalTo(self.detailedAddress);
        make.height.width.equalTo(@20);
    }];
    
    

    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.defaultImage.mas_right).offset(10);
        make.top.equalTo(self.defaultImage);
        
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
        [_defaultImage setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        
    }else{
        [self.provincesAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_left);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
            make.right.equalTo(self.contentView.mas_right).offset(-15);
        }];
        [_defaultImage setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    
    
    [self.detailedAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.provincesAddress.mas_bottom).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.phoneLabel);
        make.top.equalTo(self.defaultImage);
        make.size.equalTo(self.defaultImage);
    }];
    
    [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.defaultImage);
        make.size.equalTo(self.defaultImage);
        make.right.equalTo(self.deleteBtn.mas_left).offset(-15);
    }];
    
}

- (void)clickAction:(UIButton *)btn{
    [self.delegate MyAddressWithBtn:btn];
}

- (UIButton *)defaultImage{
    if (!_defaultImage) {
        _defaultImage = [UIButton buttonWithType:UIButtonTypeCustom];
        _defaultImage.tag = 101;
        _defaultImage.backgroundColor = UIColorMake(204, 204, 204);
        _defaultImage.layer.masksToBounds = YES;
        _defaultImage.layer.cornerRadius = 10;
        [_defaultImage addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _defaultImage;
}
- (UIButton *)editBtn{
    if (!_editBtn) {
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        _editBtn.tag = 102;
        [_editBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editBtn;
}


- (UIButton *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        _deleteBtn.tag = 103;
        [_deleteBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteBtn;
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
