//
//  IntroductionCell.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/1.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "IntroductionCell.h"
#import "Masonry.h"

@implementation IntroductionCell{
    UIButton *dropDownBtn;
    UILabel *label;
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
- (void)createSubViews {
    label = [[UILabel alloc] init];
    label.text = @"简介";
    label.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left).offset(20);
    }];
    
    [self.introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(10);
        make.left.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 20, 55, 20));
        
    }];
    
    dropDownBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [dropDownBtn setTitle:@"∨" forState:UIControlStateNormal];
    [dropDownBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    dropDownBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    dropDownBtn.selected = NO;
    [dropDownBtn addTarget:self action:@selector(dropDownAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:dropDownBtn];
    
    [dropDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.introductionLabel.mas_bottom);
        make.left.right.equalTo(self.introductionLabel);
        make.height.equalTo(@30);
        
    }];
    
    
    
    CGFloat labelHeight = [self.introductionLabel sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width-40, MAXFLOAT)].height;
    NSNumber *count = @((labelHeight) / self.introductionLabel.font.lineHeight);
    if ([count integerValue] > 3 ) {
        self.introductionLabel.numberOfLines = 3;
    }
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"评论";
    label2.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:label2];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(dropDownBtn.mas_bottom);
        make.left.equalTo(label);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    
    
}
- (void)dropDownAction:(UIButton *)btn {
    if (btn.selected == NO) {
        self.introductionLabel.numberOfLines = 0;
        [dropDownBtn setTitle:@"∧" forState:UIControlStateNormal];
        btn.selected = YES;
    }else{
        self.introductionLabel.numberOfLines = 3;
        [dropDownBtn setTitle:@"∨" forState:UIControlStateNormal];
        btn.selected = NO;
    }
    [self.introductionLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(10);
        make.left.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 20, 55, 20));
        
    }];
    //    [self.contentView setNeedsLayout];
    //    [self.contentView setNeedsUpdateConstraints];
    //    [self.contentView layoutIfNeeded];
    [self.delegate IntroductionCellDelegate:btn];
    
}

- (UILabel *)introductionLabel {
    if (!_introductionLabel) {
        _introductionLabel = [[UILabel alloc] init];
        _introductionLabel.text = @"爱上都爱;大买咯三德科技爱马仕大排档;啦没收到收到叫什么等级评定猫爬架安排圣诞节马上地破解啊安排搜大家按平时大家平时都将阿萨德阿萨德跑搜到骄傲拍摄大片时代就安排都是;哦啊接收到爱普生大家按平时大家按平时大家安排多久啊谁都怕圣诞节阿婆说大家安排上的啊";
        _introductionLabel.numberOfLines = 0;
        _introductionLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_introductionLabel];
    }
    return _introductionLabel;
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
