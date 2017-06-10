//
//  ConnectionEquipmentView.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/9.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ConnectionEquipmentVDelegate <NSObject>

-(void)ConnectionEquipmentVDelegate;

@end


@interface ConnectionEquipmentView : UIView

@property (nonatomic, weak) id <ConnectionEquipmentVDelegate>delegate;

@end
