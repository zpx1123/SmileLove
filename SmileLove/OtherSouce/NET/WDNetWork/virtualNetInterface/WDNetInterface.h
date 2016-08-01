//
//  WDNetInterface.h
//  WDNetWorking
//
//  Created by 周鹏翔 on 15/12/28.
//  Copyright © 2015年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDBaseRequest.h"



@protocol WDNetInterface <NSObject>

@required




-(void)startWithRequest:(WDBaseRequest *)request
       downloadProgress:(void (^)(NSProgress * progress))downloadProgress
                success:(void (^)(WDBaseRequest *request))success
                failure:(void (^)(WDBaseRequest *request))failure;



-(void)downloadWithRequestUrl:(NSURL *)url downPathUrl:(NSURL *)pathUrl
                 downloadName:(NSString *)name
             downloadProgress:(void (^)(NSProgress * progress))progress
                      success:(void (^)(NSURL *filePath))success
                      failure:(void (^)(NSError *error))failure;

-(void)uploadVideoWithRequestUrl:(NSString *)url upLoadPath:(NSString *)pathStr
                 uploadName:(NSString *)name
             uploadProgress:(void (^)(NSProgress * progress))progress
                    success:(void (^)(id date))success
                    failure:(void (^)(NSError *error))failure;

-(void)uploadImageWithRequestUrl:(NSString *)url upLoadDate:(NSData *)date
                 uploadName:(NSString *)name
             uploadProgress:(void (^)(NSProgress * progress))progress
                    success:(void (^)(id date))success
                    failure:(void (^)(NSError *error))failure;



-(void)stop;
//-(void)urlRequestCancle;


@end
