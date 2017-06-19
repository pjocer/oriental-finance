//
//  HomeTabContainerViewModel.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYTabButtonPagerController.h"

@interface HomeTabContainerViewModel : NSObject <TYPagerControllerDataSource>

- (void)fetchCatelog:(void(^)(id data))compeletion;

@end
