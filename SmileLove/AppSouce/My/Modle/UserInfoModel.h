//
//  UserInfoModel.h
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/4/26.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//
#import "BaseBean.h"
#import <Foundation/Foundation.h>



@interface UserInfoModel : BaseBean
@property(nonatomic,strong)NSString * userid;
@property(nonatomic,assign)NSInteger status;
@property(nonatomic,assign)NSInteger memberid;
@property(nonatomic,assign)NSInteger ranks;
@property(nonatomic,assign)NSInteger points;
@property(nonatomic,assign)NSInteger education;
@property(nonatomic,assign)NSInteger member_grade;
@property(nonatomic,assign)NSInteger level;



@end
