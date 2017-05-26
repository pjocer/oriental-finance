//
//  HomeTableViewModel.h
//  OFClient
//
//  Created by 吉冠虎 on 2017/5/24.
//  Copyright © 2017年 com.oriental-finance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HomeModel.h"

typedef enum : NSUInteger {
    HomeCellClickActionTypeTitle,
    HomeCellClickActionTypeImage,
    HomeCellClickActionTypeOthers,
} HomeCellClickActionType;

@interface HomeTableViewModel : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, copy) void(^didSelectedBlock)(HomeModel *model);

- (void)fetchDataWithCompeletion:(void(^)(NSArray <HomeModel *>*source))completion;

- (void)clickAction:(void(^)(HomeCellClickActionType type))block;

@end
