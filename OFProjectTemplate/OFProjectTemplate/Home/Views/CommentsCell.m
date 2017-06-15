//
//  CommentsCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "CommentsCell.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"

@implementation CommentsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSString *)type{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViewsWithtype:type];
    }
    return self;
}
- (void)createSubViewsWithtype:(NSString *)type{
    __weak CommentsCell *weakSelf = self;
    
    
    [self.coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf.contentView).insets(UIEdgeInsetsMake(5, 20, 5, 12.5));
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    if (![type isEqualToString:@"reply"]) {
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImage.mas_top).offset(-5);
            make.left.equalTo(self.coverImage.mas_right).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-100);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom).offset(3);
            make.left.equalTo(self.coverImage.mas_right).offset(10);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_bottom).offset(3);
            make.left.equalTo(self.nameLabel);
            make.right.equalTo(self.contentView.mas_right).offset(-24);
//            make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);
        }];
    }else{
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImage.mas_top).offset(-5);
            make.left.equalTo(self.coverImage.mas_right).offset(10);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = @"回复";
        label.textColor = UIColorMake(74, 144, 266);
        label.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).offset(2);
            make.top.equalTo(self.coverImage.mas_top).offset(-5);
            
        }];
        [self.replynameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.coverImage.mas_top).offset(-5);
            make.left.equalTo(label.mas_right).offset(2);
//            make.right.equalTo(self.contentView.mas_right).offset(-100);
        }];

        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom).offset(3);
            make.left.equalTo(self.coverImage.mas_right).offset(10);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_bottom).offset(3);
            make.left.equalTo(self.nameLabel);
            make.right.equalTo(self.contentView.mas_right).offset(-24);
//            make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);
        }];
    }
    
    
    [self.contentView addSubview:self.replyBtn];
    
    [self.replyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(3);
        make.right.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 10, 24));
    }];

    
    
    
}


- (UIButton *)replyBtn {
    if (!_replyBtn) {
        _replyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_replyBtn setTitle:@"回复" forState:UIControlStateNormal];
        _replyBtn.layer.masksToBounds = YES;
        _replyBtn.titleLabel.font = UIFontMake(11);
        _replyBtn.backgroundColor = UIColorMake(74, 144, 226);
        _replyBtn.layer.cornerRadius = 2;
//        [_replyBtn addTarget:self action:@selector(clientAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _replyBtn;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UIImageView *)coverImage {
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc]init];
        _coverImage.layer.masksToBounds = YES;
        _coverImage.layer.cornerRadius = 15;
        [self.contentView addSubview:_coverImage];
    }
    return _coverImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"lalla";
        _nameLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)replynameLabel {
    if (!_replynameLabel) {
        _replynameLabel = [[UILabel alloc] init];
        _replynameLabel.text = @"cc";
        _replynameLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_replynameLabel];
    }
    return _replynameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"14:25:26";
        _timeLabel.textColor = UIColorMake(153, 153, 153);
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeLabel];
    }
    return _timeLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.text = @"东方云互动电视事业部";
        _contentLabel.textColor = [UIColor grayColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_contentLabel];
    }
    return _contentLabel;
}

@end
