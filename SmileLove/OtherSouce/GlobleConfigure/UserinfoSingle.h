//
//  UserinfoSingle.h
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/4/26.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "UserInfoModel.h"

@interface UserinfoSingle : NSObject
singleton_interface(UserinfoSingle)

@property(nonatomic,strong)UserInfoModel * usermodel;

@end
