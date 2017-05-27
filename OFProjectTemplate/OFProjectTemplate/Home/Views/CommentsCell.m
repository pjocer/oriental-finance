//
//  CommentsCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "CommentsCell.h"
#import "Masonry.h"

@implementation CommentsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews{
    __weak CommentsCell *weakSelf = self;
    [self.coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(weakSelf.contentView).insets(UIEdgeInsetsMake(5, 20, 5, 12.5));
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImage.mas_top).offset(5);
        make.left.equalTo(self.coverImage.mas_right).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-100);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImage.mas_top).offset(5);
        make.left.equalTo(self.nameLabel.mas_right).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
        make.left.equalTo(self.nameLabel);
        make.right.equalTo(self.timeLabel);
    }];
    
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
        _nameLabel.text = @"lalla ";
        _nameLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"14:25:26";
        _timeLabel.textColor = [UIColor lightGrayColor];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_timeLabel];
    }
    return _timeLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.text = @"kajsdo0aisdhnoasidhaosdihaoisdnaosdhaos后我啊谁都爱上的号盛大山东那收到货奥四大行都爱上奥斯达收到收到奥is回答iOS大火收到阿斯哦";
        _contentLabel.textColor = [UIColor grayColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_contentLabel];
    }
    return _contentLabel;
}

@end
