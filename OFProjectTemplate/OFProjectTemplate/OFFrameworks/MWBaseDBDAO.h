//
//  MWBaseDBDAO.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

#define kDocumentFolder [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define SQLPath [kDocumentFolder stringByAppendingPathComponent:@"db.sqlite"]

#pragma mark - TOTHINK
//每一个数据库的句柄都会在内存中都会被分配一段缓存，用于提高查询效率。
//另一个方面，由于查询缓存，当产生大量句柄或数据量较大时，会出现缓存过大，造成内存浪费。

typedef NS_ENUM(NSInteger, MWDBERROR) {
    MW_DB_OPEN_ERROR,//数据库打开错误
    MW_DB_TABEL_ERROR,//创建表错误
    MW_DB_INSERT_ERROR,//数据库插入错误
    MW_DB_QUERY_ERROR,//数据库查询错误
    MW_DB_UPDATE_ERROR,//数据库更新错误
    MW_DB_DELETE_ERROR,//数据库删除错误
    MW_DB_DATA_EXIST,//数据已存在
    MW_DB_SUCCESS,//数据库操作成功
};

@interface MWBaseDBDAO : NSObject

+ (instancetype)sharedInstance;

//全局数据库
@property (readonly, strong, nonatomic) FMDatabase *baseDB;

- (MWDBERROR)openDB;

- (void)clodeDB;

@end
