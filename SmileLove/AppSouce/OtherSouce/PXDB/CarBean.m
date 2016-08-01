//
//  CarBean.m
//  LkdbhelperTest
//
//  Created by ND-QA on 15/5/21.
//  Copyright (c) 2015年 com.nd. All rights reserved.
//

#import "CarBean.h"

@implementation CarBean


+(void)initialize
{
    //单个要不显示时
    [self removePropertyWithColumnName:@"address"];
    //多列要不显示时
    //[self removePropertyWithColumnNameArray:];
    
    //修改列对应到表时 重命名新列名
    [self setTableColumnName:@"MyCarWidth" bindingPropertyName:@"carWidth"];
}

/**
 *  @author wjy, 15-01-27 18:01:53
 *
 *  @brief  是否将父实体类的属性也映射到sqlite库表
 *  @return BOOL
 */
+(BOOL) isContainParent{
    return YES;
}
/**
 *  @author wjy, 15-01-26 14:01:01
 *
 *  @brief  设定表名
 *  @return 返回表名
 */
+(NSString *)getTableName
{
    return @"carbean";
}
/**
 *  @author wjy, 15-01-26 14:01:22
 *
 *  @brief  设定表的单个主键
 *  @return 返回主键表
 */
+(NSString *)getPrimaryKey
{
    return @"carID";
}

/////复合主键  这个优先级最高
//+(NSArray *)getPrimaryKeyUnionArray
//{
//    return @[@"carID",@"carNum"];
//}

@end
