//
//  SearchDAO.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "SearchDAO.h"
#import "OFUIkitMacro.h"

#define TB_SEARCH @"tb_search_1_0"

@implementation SearchDAO

+ (MWDBERROR)saveSearchHistory:(NSString *)searchStr {
    FMDatabase *mydb = [FMDatabase databaseWithPath:SQLPath];
    if (![mydb open]) {
        return MW_DB_OPEN_ERROR;
    }
    //设置缓冲
    [mydb setShouldCacheStatements:YES];
    
    if (![mydb tableExists:TB_SEARCH])
    {
        if (![mydb executeUpdate:@"CREATE TABLE tb_search_1_0 (searchStr VARCHAR NOT NULL UNIQUE)"]) {
            [mydb close];
            return MW_DB_TABEL_ERROR;
        }
    }
    
    if (![mydb executeUpdate:@"INSERT OR IGNORE INTO tb_search_1_0 (searchStr) values (?)",searchStr]) {
        [mydb close];
        return MW_DB_INSERT_ERROR;
    }
    
    [mydb close];
    return MW_DB_SUCCESS;
}

+ (NSMutableArray *)searhHistory {
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
    
    FMDatabase *mydb = [FMDatabase databaseWithPath:SQLPath];
    if (![mydb open]) {
        return arr;
    }
    
    //设置缓冲
    [mydb setShouldCacheStatements:YES];
    
    if (![mydb tableExists:TB_SEARCH]) {
        [mydb close];
        return arr;
    }
    
    FMResultSet *dataRs = [mydb executeQuery:@"SELECT * FROM tb_search_1_0 ORDER BY rowid DESC"];
    
    while ([dataRs next]) {
        NSString *str = [dataRs stringForColumn:@"searchStr"];
        if (STRINGHASVALUE(str)) {
            [arr addObject:str];
        }
    }
    
    [dataRs close];
    [mydb close];
    
    return arr;
}

+ (MWDBERROR)deleteSearchHistory {
    FMDatabase *mydb = [FMDatabase databaseWithPath:SQLPath];
    if (![mydb open]) return MW_DB_OPEN_ERROR;
    
    [mydb setShouldCacheStatements:YES];
    
    if (![mydb tableExists:TB_SEARCH]) {
        [mydb close];
        return MW_DB_TABEL_ERROR;
    }
    
    if (![mydb executeUpdate:@"delete from tb_search_1_0"]) {
        [mydb close];
        return MW_DB_DELETE_ERROR;
    }
    
    [mydb close];
    return MW_DB_SUCCESS;
}

@end
