//
//  OBannerView.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/31.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OBannerView.h"
#import "OFUIkitMacro.h"

@interface OBannerView ()

@end

@implementation OBannerView

- (instancetype)initWithChangeModel:(ChangeMode)model {
    if (self = [super init]) {
        self.changeMode = model;
        [self configuration];
    }
    return self;
}

- (void)configuration {
    self.pagePosition = PositionBottomRight;
    self.imageArray = @[ImageNamed(@"6"),ImageNamed(@"ppppp"),ImageNamed(@"asd")];
    self.placeholderImage = ImageNamed(@"2048");
    self.time = 2;
}

@end
