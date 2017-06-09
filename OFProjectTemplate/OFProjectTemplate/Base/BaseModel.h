//
//  BaseModel.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/9.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@interface BaseModel : NSObject
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) id result;
@end
