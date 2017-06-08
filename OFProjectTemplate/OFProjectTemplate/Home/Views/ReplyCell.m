//
//  ReplyCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/7.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "ReplyCell.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@implementation ReplyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViewsWithStyle:@"replys"];
    }
    return self;
}
- (void)createSubViewsWithStyle:(NSString *)style {
    
    if ([style isEqualToString:@"reply"]) {
        [self.user1Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 10, 5, 10));
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"回复";
        label.font = UIFontMake(11);
        label.textColor = UIColorMake(51, 51, 51);
        [self.contentView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.user1Btn.mas_right);
            make.centerY.equalTo(self.user1Btn);
        }];
        
        [self.user2Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.user1Btn);
        }];
        
        
        
    }else{
        [self.user1Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 5, 5, 10));
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.user1Btn.mas_top).offset(3);
            make.left.equalTo(self.user1Btn.mas_right).offset(5);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
        }];
    }
    
    


    
    
    

    
    
}





- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.text = @"后我啊谁都爱上后我啊谁都爱上后我啊谁都爱上后我啊谁都爱上后我啊谁都爱上";
        _contentLabel.textColor = [UIColor grayColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_contentLabel];
    }
    return _contentLabel;
}

- (UIButton *)user1Btn {
    if (!_user1Btn) {
        _user1Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_user1Btn setTitle:@"确定" forState:UIControlStateNormal];
        _user1Btn.layer.masksToBounds = YES;
        _user1Btn.titleLabel.font = UIFontMake(11);
        [_user1Btn setTitleColor:UIColorMake(74, 144, 226) forState:UIControlStateNormal];
//        [_user1Btn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_user1Btn];
        
    }
    return _user1Btn;
}

- (UIButton *)user2Btn {
    if (!_user2Btn) {
        _user2Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_user2Btn setTitle:@"确定" forState:UIControlStateNormal];
        _user2Btn.layer.masksToBounds = YES;
        _user2Btn.titleLabel.font = UIFontMake(11);
        [_user2Btn setTitleColor:UIColorMake(51, 51, 51) forState:UIControlStateNormal];
        //        [_user1Btn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_user2Btn];
        
    }
    return _user2Btn;
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
