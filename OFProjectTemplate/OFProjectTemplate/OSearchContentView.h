//
//  OSearchContentView.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OFUIkitMacro.h"
#import <ReactiveCocoa.h>

@interface OSearchContentView : UIView

@property (nonatomic, copy) NSString *selectedText;

@property (nonatomic, strong) NSArray *sources;

@property (nonatomic, strong) NSArray *histories;

@property (nonatomic, strong) RACSignal *clearBtnSignal;

@end
