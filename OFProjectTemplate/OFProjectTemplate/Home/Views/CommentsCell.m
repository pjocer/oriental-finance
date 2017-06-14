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
#import "ReplyCell.h"

@interface CommentsCell ()<UITableViewDelegate,UITableViewDataSource>
@end
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
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    UIView *view1 = [[UIView alloc]init];
//    view1.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:view1];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(5);
        make.left.right.equalTo(self.contentLabel);
        make.height.equalTo(@250);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    UITableView *replyTableview = [[UITableView alloc] init];
    replyTableview.delegate = self;
    replyTableview.dataSource = self;
    replyTableview.separatorColor = [UIColor clearColor];
    replyTableview.estimatedRowHeight = 50;
    replyTableview.rowHeight = UITableViewAutomaticDimension;
    [replyTableview setNeedsLayout];
    [replyTableview layoutIfNeeded];
    [view1 addSubview:replyTableview];
    
    [replyTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(view1).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    [replyTableview reloadData];
    
//    
    [view1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"replyCell%ld",indexPath.row];
    ReplyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
        if (!cell) {
            cell = [[ReplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.backgroundColor = UIColorMake(236, 236, 236);
          
        }
    
    return cell;
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
        _nameLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
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
