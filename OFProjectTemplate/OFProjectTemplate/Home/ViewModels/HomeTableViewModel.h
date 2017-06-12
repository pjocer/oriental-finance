//
//  HomeTableViewModel .h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HotTableViewCellViewModel.h"
#import "HomeVerticalTableViewCell.h"

typedef NS_ENUM(NSInteger, HomeControllerType) {
    HomeControllerTypeHot,          //当前热播
    HomeControllerTypeTeleplay,     //电视剧
    HomeControllerTypeTopic,        //专题
    HomeControllerTypeVariety,      //综艺
    HomeControllerTypeTelevision,   //电视台
    HomeControllerTypeAppointment,  //预约
};

@interface HomeTableViewModel : NSObject <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithType:(HomeControllerType)type;

- (void)setDidSelectedBlock:(void(^)(TableViewSelectType type, id data))block;

@end
