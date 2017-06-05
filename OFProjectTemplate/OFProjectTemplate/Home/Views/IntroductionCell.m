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

    [self.delegate IntroductionCellDelegate:btn];
    
}

- (UILabel *)introductionLabel {
    if (!_introductionLabel) {
        _introductionLabel = [[UILabel alloc] init];
        _introductionLabel.text = @"《欢乐颂2》延续第一季剧情，继续讲述居住在欢乐颂小区22楼五个性格各异而又相亲相爱的女孩身上所发生的一连串有关友情、爱情、亲情、职场和理想的故事 。 新年已至，欢乐颂22楼每个人的新问题也接踵而来：安迪（刘涛饰）因包奕凡（杨烁饰）迎来情感的新可能，却也面临来自身世及包家内部带来的新困扰；樊胜美（蒋欣饰）尝试起步新生活，却仍难脱离家庭泥淖，对王柏川（张陆饰）处处依赖事事紧逼；曲筱绡（王子文饰）与赵医生（王凯饰）差距仍存，分和不断，曲家看似稳定的家庭关系实则危机四伏；邱莹莹（杨紫饰）对应勤（吴昊宸饰）一片痴情，情感经历却令应勤无法接受；关雎尔（乔欣饰）邂逅摇滚青年谢童（邓伦饰）坠入爱河，却遭到父母的激烈反对。 五个女生在磕碰中互相关怀前行，最终，安迪与包奕凡走到一起，共同面对和化解安迪身世及包家难题；樊胜美逐渐正视自我，家庭问题得以解决并决定与王柏川共担风雨；曲筱绡与赵医生学会和谐相处，并成功挽救濒临瓦解的家庭关系；邱莹莹用真情打动应勤，两人携手走进婚姻殿堂；关雎尔下定决心坚持自我，勇敢追求所爱。五个女生携手面对生活磨砺，进一步成长。";
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
