//
//  UserinfoSingle.m
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/4/26.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "UserinfoSingle.h"
#import "PXBaseDao.h"

@implementation UserinfoSingle
singleton_implementation(UserinfoSingle)




-(UserInfoModel *)usermodel{
    
    if (_usermodel==nil) {
        _usermodel=[[UserInfoModel alloc]init];
        
        PXBaseDao  * baseDao=[PXBaseDao daoWithEntityClass:[_usermodel class]];
        
        NSMutableArray * arr1=[baseDao searchWithSQLforModle:_usermodel];
        
        if ([arr1 firstObject]) {
            
            UserInfoModel * model=(UserInfoModel *)[arr1 firstObject];
            
            _usermodel=model;
        }else{
            _usermodel=nil;
            
        }
        
        
    }
    
    return _usermodel;
}
@end
