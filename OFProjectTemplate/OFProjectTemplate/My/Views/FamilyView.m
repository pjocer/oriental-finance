//
//  FamilyView.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "FamilyView.h"
#import "OFUIkitMacro.h"
#import "Masonry.h"

@implementation FamilyView

- (instancetype)initWithDatalist:(NSArray *)arr{
    if (self = [super init]) {
        [self addSubviewsWithArr:arr];
    }
    return self;
}

- (void)addSubviewsWithArr:(NSArray *)datalist{
    
    if (datalist.count == 0) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = (SCREEN_WIDTH-75)/6;
        btn.backgroundColor = [UIColor redColor];
        btn.tag = 100;
        [self addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(15);
            make.left.equalTo(self.mas_left).offset(5);
            make.height.equalTo(@((SCREEN_WIDTH-75)/3));
            make.width.equalTo(@((SCREEN_WIDTH-75)/3));
            
        }];
        

        
    }else{
        if (datalist.count == 5) {
            for (NSInteger i = 0; i < datalist.count; i++) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setImage:[UIImage imageNamed:@"aaaaaa"] forState:UIControlStateNormal];
                btn.layer.masksToBounds = YES;
                btn.layer.cornerRadius = (SCREEN_WIDTH-75)/6;
                btn.backgroundColor = [UIColor redColor];
                btn.tag = 100+datalist.count -i;
                [self addSubview:btn];
                
                UILabel *label = [[UILabel alloc]init];
                label.text = [NSString stringWithFormat:@"第%ld人",(long)i];
                label.textColor = UIColorMake(51, 51, 51);
                label.font = UIFontMake(16);
                label.textAlignment = NSTextAlignmentCenter;
                [self addSubview:label];
                
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.mas_top).offset(((SCREEN_WIDTH-75)/3)*(i/3 )+i/3*50 +15);
                    make.left.equalTo(self.mas_left).offset((((SCREEN_WIDTH-75)/3))*(i%3) +(i%3*22.5) +15);
                    make.height.equalTo(@((SCREEN_WIDTH-75)/3));
                    make.width.equalTo(@((SCREEN_WIDTH-75)/3));
                    
                }];
                
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(btn.mas_bottom).offset(12);
                    make.centerX.equalTo(btn);
                    make.width.equalTo(@((SCREEN_WIDTH-75)/3));
                    
                }];
            }

        }else{
            for (NSInteger i = 0; i < datalist.count + 1; i++) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setImage:[UIImage imageNamed:@"aaaaaa"] forState:UIControlStateNormal];
                btn.layer.masksToBounds = YES;
                btn.layer.cornerRadius = (SCREEN_WIDTH-75)/6;
                btn.backgroundColor = [UIColor redColor];
                btn.tag = 100+datalist.count -i;
                [btn addTarget:self action:@selector(addFamilyAction:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:btn];
                
                UILabel *label = [[UILabel alloc]init];
                label.text = [NSString stringWithFormat:@"第%ld人",(long)i];
                label.textColor = UIColorMake(51, 51, 51);
                label.font = UIFontMake(16);
                label.textAlignment = NSTextAlignmentCenter;
                [self addSubview:label];
                
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.mas_top).offset(((SCREEN_WIDTH-75)/3)*(i/3 )+i/3*50 +15);
                    make.left.equalTo(self.mas_left).offset((((SCREEN_WIDTH-75)/3))*(i%3) +(i%3*22.5) +15);
                    make.height.equalTo(@((SCREEN_WIDTH-75)/3));
                    make.width.equalTo(@((SCREEN_WIDTH-75)/3));
                    
                }];
                
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(btn.mas_bottom).offset(12);
                    make.centerX.equalTo(btn);
                    make.width.equalTo(@((SCREEN_WIDTH-75)/3));
                    
                }];
            }

        }
    }
    
}

- (void)addFamilyAction:(UIButton *)btn{
    [self.delegate FamilyViewDelegateWithBtn:btn];
}




@end
