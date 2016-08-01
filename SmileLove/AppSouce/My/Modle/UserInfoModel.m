//
//  UserInfoModel.m
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/4/26.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"userid"         : @"userid",
             @"status"       : @"status",
             @"memberid"  : @"memberid",
             @"ranks"          : @"ranks",
             @"points"         : @"points",
             @"education"  : @"education",
             @"member_grade"            : @"member_grade",
             @"cellphone"  : @"cellphone",
             
             @"level"           : @"level"};
}


+(void)initialize
{
    [self removePropertyWithColumnName:@"error"];
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
    return NSStringFromClass([self class]);
}
/**
 *  @author wjy, 15-01-26 14:01:22
 *
 *  @brief  设定表的单个主键
 *  @return 返回主键表
 */
+(NSString *)getPrimaryKey
{
    return @"userid";
}


@end
