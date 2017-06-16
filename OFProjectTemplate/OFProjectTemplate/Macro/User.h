//
//  User.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/16.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *id_card;
@property (nonatomic, copy) NSString *msg_push;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nick_name;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *sign_url;
@end
