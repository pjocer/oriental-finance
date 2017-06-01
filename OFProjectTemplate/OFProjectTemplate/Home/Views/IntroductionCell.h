//
//  IntroductionCell.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/1.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol IntroductionCellDelegate <NSObject>

-(void)IntroductionCellDelegate:(UIButton *)btn;

@end
@interface IntroductionCell : UITableViewCell

@property (nonatomic, weak) id <IntroductionCellDelegate>delegate;

@property (nonatomic, strong)UILabel *introductionLabel;


@end
