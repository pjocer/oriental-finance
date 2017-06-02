//
//  SearchDAO.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/2.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "MWBaseDBDAO.h"

@interface SearchDAO : MWBaseDBDAO
/**
 *  保存搜索历史
 *
 *  @param searchStr 搜索关键字
 *
 *  @return 是否成功
 */
+ (MWDBERROR)saveSearchHistory:(NSString *)searchStr;

/**
 *  获取搜索历史
 *
 *  @return 数组-搜索字符串对象
 */
+ (NSMutableArray *)searhHistory;

/**
 *  删除搜索历史
 *
 *  @return 数据库操作状态
 */
+ (MWDBERROR)deleteSearchHistory;
@end
