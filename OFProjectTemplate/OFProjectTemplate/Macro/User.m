//
//  User.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/16.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "User.h"

@implementation User
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.token = [aDecoder decodeObjectForKey:@"token"];
        self.id_card = [aDecoder decodeObjectForKey:@"id_card"];
        self.msg_push = [aDecoder decodeObjectForKey:@"msg_push"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.nick_name = [aDecoder decodeObjectForKey:@"nick_name"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.sign_url = [aDecoder decodeObjectForKey:@"sign_url"];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.token forKey:@"token"];
    [aCoder encodeObject:self.id_card forKey:@"id_card"];
    [aCoder encodeObject:self.msg_push forKey:@"msg_push"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.nick_name forKey:@"nick_name"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.sign_url forKey:@"sign_url"];
}
@end
