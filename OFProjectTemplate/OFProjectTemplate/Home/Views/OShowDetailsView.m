//
//  OShowDetailsView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/5/26.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OShowDetailsView.h"
#import <Masonry.h>

@implementation OShowDetailsView 

- (instancetype)init {
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}



- (void)addSubviews {
    self.backgroundView.image = [UIImage imageNamed:@"hhhh"];
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.width*0.58));
    }];
    
    UIVisualEffectView *effectView =[[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.58);
    [self.backgroundView addSubview:effectView];
    
    
    self.coverImage.image = [UIImage imageNamed:@"hhhh"];
    [self.coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.backgroundView).insets(UIEdgeInsetsMake(15, 20, 30, 0));
        make.width.equalTo(@(([UIScreen mainScreen].bounds.size.width*0.58 - 45)*3/4));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImage.mas_top).offset(10);
        make.left.equalTo(self.coverImage.mas_right).offset(10);
        make.right.equalTo(self.backgroundView.mas_right).offset(-10);
    }];
    
    [self.directorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(15);
        make.left.right.equalTo(self.nameLabel);
    }];
    
    [self.actorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.directorLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.nameLabel);
    }];
    
    [self.yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.actorLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.nameLabel);
    }];
    
    [self.playcount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yearLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.nameLabel);
    }];
    
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.playcount.mas_bottom).offset(10);
        make.left.right.equalTo(self.nameLabel);
    }];
    
    [self.platTVBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backgroundView.mas_bottom).offset(10);
        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        make.height.equalTo(@35);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
    
    

}



- (UIImageView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc]init];
        _backgroundView.backgroundColor = [UIColor redColor];
        [self addSubview:_backgroundView];
    }
    return _backgroundView;
}

- (UIImageView *)coverImage {
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc]init];
        [self.backgroundView addSubview:_coverImage];
    }
    return _coverImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"欢乐颂第二季";
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.backgroundView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UILabel *)directorLabel {
    if (!_directorLabel) {
        _directorLabel = [[UILabel alloc] init];
        _directorLabel.text = @"导演    王吉吉";
        _directorLabel.font = [UIFont systemFontOfSize:14];
        [self.backgroundView addSubview:_directorLabel];
    }
    return _directorLabel;
}

- (UILabel *)actorLabel {
    if (!_actorLabel) {
        _actorLabel = [[UILabel alloc] init];
        _actorLabel.text = @"演员    刘涛  王子文  杨紫  杨硕  阿萨德教   刘德华";
        _actorLabel.font = [UIFont systemFontOfSize:14];
        [self.backgroundView addSubview:_actorLabel];
    }
    return _actorLabel;
}

- (UILabel *)yearLabel {
    if (!_yearLabel) {
        _yearLabel = [[UILabel alloc] init];
        _yearLabel.text = @"年代    2016";
        _yearLabel.font = [UIFont systemFontOfSize:14];
        [self.backgroundView addSubview:_yearLabel];
    }
    return _yearLabel;
}

- (UILabel *)playcount {
    if (!_playcount) {
        _playcount = [[UILabel alloc] init];
        _playcount.text = @"播放    2016";
        _playcount.font = [UIFont systemFontOfSize:14];
        [self.backgroundView addSubview:_playcount];
    }
    return _playcount;
}

- (UILabel *)scoreLabel {
    if (!_scoreLabel) {
        _scoreLabel = [[UILabel alloc] init];
        _scoreLabel.text = @"评分    83.6分";
        _scoreLabel.font = [UIFont systemFontOfSize:14];
        [self.backgroundView addSubview:_scoreLabel];
    }
    return _scoreLabel;
}

- (UIButton *)platTVBtn {
    if (!_platTVBtn) {
        _platTVBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_platTVBtn setTitle:@"在电视机上播放" forState:UIControlStateNormal];
        _platTVBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:162/255.0 blue:65/255.0 alpha:1];
        _platTVBtn.layer.cornerRadius = 5;
        _platTVBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_platTVBtn];
    }
    return _platTVBtn;
}

- (UILabel *)introductionLabel {
    if (!_introductionLabel) {
        _introductionLabel = [[UILabel alloc] init];
        _introductionLabel.text = @"《欢乐颂2》延续第一季剧情，继续讲述居住在欢乐颂小区22楼五个性格各异而又相亲相爱的女孩身上所发生的一连串有关友情、爱情、亲情、职场和理想的故事 。 新年已至，欢乐颂22楼每个人的新问题也接踵而来：安迪（刘涛饰）因包奕凡（杨烁饰）迎来情感的新可能，却也面临来自身世及包家内部带来的新困扰；樊胜美（蒋欣饰）尝试起步新生活，却仍难脱离家庭泥淖，对王柏川（张陆饰）处处依赖事事紧逼；曲筱绡（王子文饰）与赵医生（王凯饰）差距仍存，分和不断，曲家看似稳定的家庭关系实则危机四伏；邱莹莹（杨紫饰）对应勤（吴昊宸饰）一片痴情，情感经历却令应勤无法接受；关雎尔（乔欣饰）邂逅摇滚青年谢童（邓伦饰）坠入爱河，却遭到父母的激烈反对。 五个女生在磕碰中互相关怀前行，最终，安迪与包奕凡走到一起，共同面对和化解安迪身世及包家难题；樊胜美逐渐正视自我，家庭问题得以解决并决定与王柏川共担风雨；曲筱绡与赵医生学会和谐相处，并成功挽救濒临瓦解的家庭关系；邱莹莹用真情打动应勤，两人携手走进婚姻殿堂；关雎尔下定决心坚持自我，勇敢追求所爱。五个女生携手面对生活磨砺，进一步成长。";
        _introductionLabel.numberOfLines = 0;
        _introductionLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_introductionLabel];
    }
    return _introductionLabel;
}




@end
