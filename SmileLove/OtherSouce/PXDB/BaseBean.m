//
//  BaseBean.m
//  LkdbhelperTest
//
//  Copyright (c) 2015年 com.nd. All rights reserved.
//

#import "BaseBean.h"
#import "NSObject+PrintSQL.h"

@implementation BaseBean


+(LKDBHelper *)getUsingLKDBHelper
{
    static LKDBHelper* db;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *sqlitePath = [BaseBean downloadPath];
        NSString* dbpath = [sqlitePath stringByAppendingPathComponent:[NSString stringWithFormat:@"zpx.db"]];
        db = [[LKDBHelper alloc]initWithDBPath:dbpath];
    });
    return db;
}

/**
 *
 *  @brief  路径
 *  @return <#return value description#>
 */
+ (NSString *)downloadPath{
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *downloadPath = [documentPath stringByAppendingPathComponent:@"zpx"];
        NSLog(@"%@",downloadPath);
        return downloadPath;
}


@end
