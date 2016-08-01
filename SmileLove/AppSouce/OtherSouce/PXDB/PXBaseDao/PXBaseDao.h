//
//  PXBaseDao.h
//  PXDBManange
//
//  Created by 周鹏翔 on 15/11/2.
//  Copyright © 2015年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKDBHelper.h"

@interface PXBaseDao : NSObject

@property (nonatomic, weak, readonly) Class entityClass;
@property(nonatomic,strong,readonly)LKDBHelper * globalHelper;
+ (instancetype)daoWithEntityClass:(Class)aClass;


-(BOOL)insertEntityToDB:(NSObject *)molde;

-(void)insertAsyncEntityToDB:(NSObject *)molde callback:(void (^)(BOOL))block;

//使用sql对进查询操作返回所有数据
-(NSMutableArray *)searchWithSQLforModle:(NSObject *)molde;


//使用对象对进查询操作  offset是跳过多少行 count是查询多少条 返回条件数据 用于分页展示
-(NSMutableArray*)searchWithMolde:(NSObject *)modle Offset:(NSInteger)offset count:(NSInteger)count;

//异步查询
-(void)searchAsyncWithMolde:(NSObject *)modle Offset:(NSInteger)offset count:(NSInteger)count callback:(void (^)(NSMutableArray *))block;


//查询一列时的操作 count为0时则查所有列 key--"name or id,name"
-(NSMutableArray * )searchWithColumn:(NSObject *)modle forkey:(NSString *)key Offset:(NSInteger)offset count:(NSInteger)count;


//条件查询and or like in

//like   [NSString stringWithFormat:@"userName like '%%JY%%'"]
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forlikeKey:(id)key;

//and     [NSString stringWithFormat:@"age=29 and userName='WUJY'"]
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forAndKey:(id)key;

//and2    @{@"age":@29,@"userName":@"WUJY"}
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forAndDic:(id)Dic;

//or [NSString stringWithFormat:@"age=29 or userName='WUJY'"]
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forOrKey:(id)key;


//in  [NSString stringWithFormat:@"age in (10,29)"]
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forInKey:(id)key;

//in2  @{@"age":@[@10,@29]}
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forInDic:(id)Dic;

//带条件更新 @{@"ID":@10} 或者在数据查询到对于模型 更改属性并且更新
-(BOOL)updateToDB:(NSObject *)model wherefordic:(id)dic;

////更新 访问表名 更新内容跟条件进行更新
//BOOL updateTab=[globalHelper updateToDBWithTableName:@"userBean" set:@"password='aa123456'" where:@"age=10"];

////根据 实类进行更新
//BOOL updateClass=[globalHelper updateToDB:[UserBean class] set:@"password='cnblogs'" where:@"userName='WUJY'"];
//NSLog(@"根据实类进行更新:%@",updateClass>0?@"是":@"否");


//查询删除 符合这个条件@{@"age":@10}
-(BOOL)deleteToDB:(NSObject *)model wherefordic:(id)dic;

//符合条件的删除多条
-(BOOL)deleteMoreToDB:(NSObject *)model where:(id)dic;

//根据表名删除表
-(BOOL)deleteAllTable:(NSString *)tablename;

//删除所有的表
-(void)deleteAllTableEntity;

//清理所有表数据
-(void)deleteAllEntityInDB:(NSObject *)aClass;
@end
