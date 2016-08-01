//
//  WDBaseData.h
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/1/12.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDBaseRequest.h"
#import "WDHttpRequest.h"
#import <YYKit/NSObject+YYModel.h>
//#import "LoginVC.h"
@interface WDBaseData : NSObject

//@property(nonatomic,strong)LoginVC * LoginController;
-(void)NetRequestWithUrl:(NSString *)requestUrl
                Argument:(NSDictionary *)param
                requestMethod:(WDRequestMethod)method
                success:(void (^)(id  json))success
                failure:(void (^)(NSString *errStr))failure;

@end
