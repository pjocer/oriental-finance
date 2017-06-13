//
//  HotTableViewCellViewModel.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TableViewCellType) {
    TableViewCellTypeHot,
    TableViewCellTypeLiving,
    TableViewCellTypeUnknow,
} ;

@interface HotTableViewCellViewModel : NSObject <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, assign) BOOL shouldShowAppointBtn;

@property (nonatomic, copy) dispatch_block_t headerClickAction;

- (instancetype)initWithCellType:(TableViewCellType)type;

@end
