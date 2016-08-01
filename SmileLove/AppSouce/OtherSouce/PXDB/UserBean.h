//
//  UserBean.h
//  LkdbhelperTest
//
//  Created by ND-QA on 15/5/21.
//  Copyright (c) 2015年 com.nd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseBean.h"
#import "CarBean.h"

@interface UserBean : BaseBean

@property(assign,nonatomic)int ID;
@property(strong,nonatomic)NSString *userName;
@property(strong,nonatomic)NSString *password;
@property(assign,nonatomic)int age;

@property(strong,nonatomic)CarBean *myCar;
@end
