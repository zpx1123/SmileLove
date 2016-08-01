//
//  CarBean.h
//  LkdbhelperTest
//
//  Created by ND-QA on 15/5/21.
//  Copyright (c) 2015年 com.nd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseBean.h"

@interface CarBean : BaseBean

@property(assign,nonatomic)int carID;
@property(strong,nonatomic)NSString *carNum;
@property(strong,nonatomic)NSString *address;
@property(assign,nonatomic)float carWidth;
@end
