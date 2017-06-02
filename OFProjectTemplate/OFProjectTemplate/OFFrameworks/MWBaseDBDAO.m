//
//  MWBaseDBDAO.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MWBaseDBDAO.h"

@implementation MWBaseDBDAO

@synthesize baseDB = _baseDB;

+ (instancetype)sharedInstance {
    static MWBaseDBDAO *dbDao = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbDao = [MWBaseDBDAO new];
    });
    return dbDao;
}

- (FMDatabase *)baseDB {
    if (_baseDB != nil) {
        return _baseDB;
    }
    
    _baseDB = [[FMDatabase alloc]initWithPath:SQLPath];
    
    return _baseDB;
}

- (MWDBERROR)openDB {
    if (![self.baseDB open]) {
        return MW_DB_OPEN_ERROR;
    }
    [_baseDB setShouldCacheStatements:YES];
    
    return MW_DB_SUCCESS;
}

- (void)clodeDB {
    if (_baseDB) {
        [_baseDB close];
    }
}

@end
