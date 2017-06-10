//
//  FamilyView.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/8.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FamilyViewDelegate <NSObject>

-(void)FamilyViewDelegateWithBtn:(UIButton *)btn;

@end

@interface FamilyView : UIView

@property (nonatomic, weak) id <FamilyViewDelegate>delegate;

- (instancetype)initWithDatalist:(NSArray *)arr;



@end
