//
//  UserBean.m
//  LkdbhelperTest
//
//  Created by ND-QA on 15/5/21.
//  Copyright (c) 2015年 com.nd. All rights reserved.
//

#import "UserBean.h"

@implementation UserBean


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
    return @"userBean";
}
/**
 *  @author wjy, 15-01-26 14:01:22
 *
 *  @brief  设定表的单个主键
 *  @return 返回主键表
 */
+(NSString *)getPrimaryKey
{
    return @"ID";
}
/**
 *  - (void)viewDidLoad {
 [super viewDidLoad];
 UserBean *user=[[UserBean alloc] init];
 
 PXBaseDao  * baseDao=[PXBaseDao daoWithEntityClass:[user class]];
 //
 [baseDao deleteAllTableEntity];
 [baseDao deleteAllEntityInDB:user];
 //    UserBean *user=[[UserBean alloc] init];
 //user.ID=1000;  //特别说明 如果是主键 没给它赋值它就会自动增长
 user.userName=@"xiaoming";
 user.password=@"123456";
 user.age=10;
 
 CarBean *car=[[CarBean alloc]init];
 car.carNum=@"D88888";
 car.address=@"121312";
 car.carWidth=12.5;
 
 user.myCar=car;
 
 //插入数据 如果表不存在 它会自动创建再插入 实体实例化LKDBHelper 若是继承记得引用 否则会没有效果
 [user saveToDB];
 
 //另外一种插入
 user.age=11;
 [baseDao insertEntityToDB:user];
 
 user.userName=@"zhangsan";
 user.age=20;
 [baseDao insertEntityToDB:user];
 
 user.userName=@"lisi";
 user.age=21;
 [baseDao insertEntityToDB:user];
 
 NSMutableArray* searchResultArray=nil;
 
 searchResultArray=  [baseDao searchWithMolde:user Offset:0 count:100];
 
 searchResultArray=[baseDao searchWithMolde:user forAndKey:@"age=21"];
 searchResultArray=[baseDao searchWithMolde:user forAndDic:@{@"age":@21}];
 searchResultArray=[baseDao searchWithMolde:user forInDic:@{@"age":@[@20,@11]}];
 
 user.userName=@"wangwu";
 BOOL issuccess=[baseDao updateToDB:user wherefordic:@{@"age":@21}];
 if (issuccess) {
 
 }
 searchResultArray=  [baseDao searchWithMolde:user Offset:0 count:100];
 [baseDao deleteToDB:user wherefordic:@{@"age":@11}];
 searchResultArray=  [baseDao searchWithMolde:user Offset:0 count:100];
 }

 */
@end
