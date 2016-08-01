
//
//  PXBaseDao.m
//  PXDBManange
//
//  Created by 周鹏翔 on 15/11/2.
//  Copyright © 2015年 周鹏翔. All rights reserved.
//

#import "PXBaseDao.h"
#import "LKDBHelper.h"

//注意 这里只写了常用的数据操作，增删改查  （具体请看LKDBHelper 感谢LKDBHelper作者）
//支持同步异步这里只写了同步 ，如需异步处理， 在下面加方法即可
@interface PXBaseDao(){
    
//    LKDBHelper* _globalHelper;
}

@end
@implementation PXBaseDao

+ (instancetype)daoWithEntityClass:(Class)aClass
{
    PXBaseDao *dao = [[[self class] alloc] initWithEntityClass:aClass];
    
    return dao;
}

- (instancetype)initWithEntityClass:(Class)aClass
{
    self = [super init];
    if (self)
    {
        //注意！实体类必须重写getUsingLKDBHelper有且只创建一次
       _globalHelper= [aClass getUsingLKDBHelper];

        _entityClass = aClass;
    }
    return self;
}

//插入数据库
-(BOOL)insertEntityToDB:(NSObject *)modle{
    
    if([_globalHelper insertToDB:modle]){
        
        
        return true;
        
    }else{
        
        return false;
        
    }
    

}

-(void)insertAsyncEntityToDB:(NSObject *)molde callback:(void (^)(BOOL ))block{
    

    [_globalHelper insertToDB:molde callback:^(BOOL result) {
        
        NSLog(@"异步插入是否成功：%@",result>0?@"是":@"否");
        
        block(result);
    }];
    
    
}


//条件查询and or like in

//like   [NSString stringWithFormat:@"userName like '%%JY%%'"]
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forlikeKey:(id)key{
    
    return [modle.class searchWithWhere:key orderBy:nil offset:0 count:0];
}

//and     [NSString stringWithFormat:@"age=29 and userName='WUJY'"]
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forAndKey:(id)key{
    
    return [modle.class searchWithWhere:key orderBy:nil offset:0 count:0];
}

//and2
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forAndDic:(id)Dic{
    
    return [_globalHelper search:[modle class] where:Dic orderBy:nil offset:0 count:0];
}

//or [NSString stringWithFormat:@"age=29 or userName='WUJY'"]
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forOrKey:(id)key{
    
    return [modle.class searchWithWhere:key orderBy:nil offset:0 count:0];
}


//in  [NSString stringWithFormat:@"age in (10,29)"]
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forInKey:(id)key{
    
    return [modle.class searchWithWhere:key orderBy:nil offset:0 count:0];
}

// in @{@"age":@[@10,@29]}
-(NSMutableArray *)searchWithMolde:(NSObject *)modle forInDic:(id)Dic{
    
   return [_globalHelper search:[modle class] where: Dic orderBy:nil offset:0 count:0];
}


// 条件跟新 @{@"ID":@10}
-(BOOL)updateToDB:(NSObject *)model wherefordic:(id)dic{
    
    return [_globalHelper updateToDB:model where: dic];
}
//使用sql对进查询操作返回所有数据
-(NSMutableArray *)searchWithSQLforModle:(NSObject *)molde{
    
    
    //同步搜索 执行sql语句 把结果再变成对象
    return [_globalHelper searchWithSQL:@"select * from @t" toClass:[molde class]];
}

//使用对象对进查询操作  offset是跳过多少行 count是查询多少条 返回条件数据
-(NSMutableArray*)searchWithMolde:(NSObject *)modle Offset:(NSInteger)offset count:(NSInteger)coun{
    
    
  return  [modle.class searchWithWhere:nil orderBy:nil offset:offset count:coun];
    
    
}

//查询一列时的操作 count为0时则查所有列
-(NSMutableArray * )searchWithColumn:(NSObject *)modle forkey:(NSString *)key  Offset:(NSInteger)offset count:(NSInteger)count{
    
    
    
    return [modle.class searchColumn:key where:nil orderBy:nil offset:offset count:count] ;
}

//异步查询
-(void)searchAsyncWithMolde:(NSObject *)modle Offset:(NSInteger)offset count:(NSInteger)count callback:(void (^)(NSMutableArray *))block{
    
    
    [_globalHelper search:[modle class] where:nil orderBy:nil offset:0 count:100 callback:^(NSMutableArray *array) {
//        for (id obj in array) {
//            NSLog(@"异步：%@",[obj printAllPropertys]);
//            
//        }
//
        
        block(array);
        
    }];
}

//查询删除
-(BOOL)deleteToDB:(NSObject *)model wherefordic:(id)dic{
    

    BOOL ishas=[_globalHelper isExistsModel:[_globalHelper searchSingle:[model class] where:dic orderBy:nil]];
    if (ishas) {
        
       return  [_globalHelper deleteToDB:model];
    }else{
        
        return false;
    }
    

}


//符合条件的删除多条
-(BOOL)deleteMoreToDB:(NSObject *)model where:(id)dic{
    
    BOOL isDeleteMore=[_globalHelper deleteWithClass:[model class] where:dic];
  
    return isDeleteMore;
}

//删除所有的表
-(void)deleteAllTableEntity{
    
    [_globalHelper dropAllTable];
    
    
}
//根据表名删除表
-(BOOL )deleteAllTable:(NSString *)tablename{

    if ([_globalHelper dropTableWithTableName:tablename]) {
        
        return true;
        
    }else{
        
        return false;
    }

}
 //清理所有数据表
-(void)deleteAllEntityInDB:(NSObject *)aClass{
    
    [LKDBHelper clearTableData:[aClass class]];

}
@end
