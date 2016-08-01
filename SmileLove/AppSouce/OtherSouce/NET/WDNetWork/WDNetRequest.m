//
//  WDNetRequest.m
//  WDNetWorking
//
//  Created by 周鹏翔 on 15/12/28.
//  Copyright © 2015年 周鹏翔. All rights reserved.
//

#import "WDNetRequest.h"
#import "UserinfoSingle.h"
@interface WDNetRequest(){
    
    AFHTTPSessionManager * _manager;
    NSMutableDictionary *_requestsRecord;

}
@property (nonatomic, strong) NSURLSessionDataTask *sessionDataTask;
@end

@implementation WDNetRequest


-(instancetype)init{
    
    if (self=[super init]) {
        
        _manager=[AFHTTPSessionManager manager];
        _manager.operationQueue.maxConcurrentOperationCount=4;
        _downLoadTaskArrs=[NSMutableArray array];
    }
    return self;
    
}

-(void)start{
    
    
}
- (void)stop{
    
//    [_manager.operationQueue cancelAllOperations ];
    [self.sessionDataTask cancel];

    
}

//- (void)setCompletionBlockWithSuccess:(void (^)(WDBaseRequest *request))success
//                              failure:(void (^)(WDBaseRequest *request))failure {
//    self.successCompletionBlock = success;
//    self.failureCompletionBlock = failure;
//}

//- (void)clearCompletionBlock {
//    // nil out to break the retain cycle.
//    self.successCompletionBlock = nil;
//    self.failureCompletionBlock = nil;
//}


-(void)downloadWithRequestUrl:(NSURL *)url downPathUrl:(NSURL *)pathUrl
                 downloadName:(NSString *)name
             downloadProgress:(void (^)(NSProgress * progress))progress
                      success:(void (^)(NSURL *filePath))success
                      failure:(void (^)(NSError *error))failure{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.networkServiceType=NSURLNetworkServiceTypeVideo;
    configuration.timeoutIntervalForResource=-1;
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress *  downloadProgress) {
        
        progress(downloadProgress);
        
        
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        
        
        NSString * fileName=@"";
        
        if ([response.MIMEType hasPrefix:@"video"]) {
            
            NSRange range = [response.MIMEType rangeOfString:@"mp4"];
            if ( range.length>0) {
                
                fileName=[name stringByAppendingString:@".mp4"];
            }else{
                //不是mp4类型 继续判断
            }
            
            
        }else{
            
            fileName=name;
        }
        
        if ([name isEqualToString:@""] ||name==nil) {
            
            return [pathUrl URLByAppendingPathComponent:[response suggestedFilename]];
            
        }else{
            
            return [pathUrl URLByAppendingPathComponent:fileName];
            
        }
        
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
      
        
        [_downLoadTaskArrs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSURLSessionDownloadTask *downloadTask=(NSURLSessionDownloadTask *)obj;
            if (downloadTask.state==NSURLSessionTaskStateCompleted) {
                
                [_downLoadTaskArrs removeObjectAtIndex:idx];
            }
            
        }];
        

        if (error!=nil) {
           
            failure(error);
            
        }else{
            
             success(filePath);
        }

    }];
    
    
    [downloadTask resume];
    
    [_downLoadTaskArrs addObject:downloadTask];
    
}

-(void)uploadImageWithRequestUrl:(NSString *)url upLoadDate:(NSData *)date
                 uploadName:(NSString *)name
             uploadProgress:(void (^)(NSProgress * progress))progress
                    success:(void (^)(id date))success
                    failure:(void (^)(NSError *error))failure{
    
//    关于参数 @{@"field-type":@"image"}  可改@{@"field-type":@"name"} 接口传进来
        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:@{@"field-type":@"image"} constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {

        NSString *name = @"file";
        NSString *formKey = @"file";
        NSString *type = @"image/jpeg";
        [formData appendPartWithFileData:date name:formKey fileName:name mimeType:type];
        
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    

    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      
                      NSLog(@"uploadProgress is %@",uploadProgress);
                      
                      progress(uploadProgress);
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      dispatch_async(dispatch_get_main_queue(), ^{
                          //Update the progress view
                          //                          [progressView setProgress:uploadProgress.fractionCompleted];
                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                          failure(error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                          success(responseObject);
                      }
                  }];
    
    [uploadTask resume];
    
}


-(void)uploadVideoWithRequestUrl:(NSString *)url upLoadPath:(NSString *)pathStr
               uploadName:(NSString *)name
           uploadProgress:(void (^)(NSProgress * progress))progress
                    success:(void (^)(id date))success
                    failure:(void (^)(NSError *error))failure{
    
    //    关于参数 @{@"field-type":@"image"}  可改@{@"field-type":@"name"} 接口传进来
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:@{@"field-type":@"video"} constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:pathStr] name:name error:nil];
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      
                      progress(uploadProgress);
                      
              
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                          failure(error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                          success(responseObject);
                      }
                  }];
    
    [uploadTask resume];
    
}


-(void)startWithRequest:(WDBaseRequest *)request
       downloadProgress:(void (^)(NSProgress * progress))downloadProgress
                success:(void (^)(WDBaseRequest *request))success
                failure:(void (^)(WDBaseRequest *request))failure{
    
//    self.successCompletionBlock=success;
//    self.failureCompletionBlock=failure;
    
       WDRequestMethod  mothod=[request requestMethod];
   
      NSString *url = [self buildRequestUrl:request];
    
//    _manager.requestSerializer.timeoutInterval=[request requestTimeoutInterval];
    
    // 设置超时时间
    [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    _manager.requestSerializer.timeoutInterval = 5.0f;
    [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    //Allowing Invalid SSL Certificates
//    _manager.securityPolicy.allowInvalidCertificates = YES
    

    
//    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    if (request.requestSerializerType == WDRequestSerializerTypeHTTP) {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    } else if (request.requestSerializerType == WDRequestSerializerTypeJSON) {
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
     id param=[request requestArgument];
    
    
    // if api need server username and password
    NSArray *authorizationHeaderFieldArray = [request requestAuthorizationHeaderFieldArray];
    if (authorizationHeaderFieldArray != nil) {
        [_manager.requestSerializer setAuthorizationHeaderFieldWithUsername:(NSString *)authorizationHeaderFieldArray.firstObject
                                                                   password:(NSString *)authorizationHeaderFieldArray.lastObject];
    }
    
    
    // if api need add custom value to HTTPHeaderField
    NSDictionary *headerFieldValueDictionary = [request requestHeaderFieldValueDictionary];
    if (headerFieldValueDictionary != nil) {
        for (id httpHeaderField in headerFieldValueDictionary.allKeys) {
            id value = headerFieldValueDictionary[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [_manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            } else {
                NSLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    
    if (mothod==WDRequestMethodGet) {
        
       

        
        self.sessionDataTask=[_manager GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
            
            NSLog(@"downloadProgress is %@",downloadProgress);

            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            
//            [self handleRequestResult:request issucess:YES];
            [self handleRequestResult:request result:responseObject];
              success(request);

            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            

            [self handleRequestResult:request result:error];
            failure(request);
            
        }];
        
    }else if (mothod==WDRequestMethodPost){
        
        self.sessionDataTask=[_manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self handleRequestResult:request result:responseObject];
            success(request);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self handleRequestResult:request result:error];
            failure(request);
            
        }];
    }else if (mothod==WDRequestMethodHead){
        
        [_manager HEAD:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task) {

            success(request);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self handleRequestResult:request result:error];
            failure(request);
            
        }];
        
    }else if (mothod==WDRequestMethodPut){
        
        [_manager PUT:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self handleRequestResult:request result:responseObject];
            success(request);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self handleRequestResult:request result:error];
            failure(request);
        }];
    }else if(mothod==WDRequestMethodDelete){
        
        [_manager DELETE:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self handleRequestResult:request result:responseObject];
            success(request);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self handleRequestResult:request result:error];
            failure(request);
        }];
    }else if (mothod==WDRequestMethodPatch){
        
        [_manager PATCH:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self handleRequestResult:request result:responseObject];
            success(request);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self handleRequestResult:request result:error];
            failure(request);
        }];
        
    }
}

//- (void)handleRequestResult:(WDBaseRequest *)result issucess:(BOOL)sucess {
//
//    if (result) {
////        BOOL succeed = [self checkResult:result];
//        if (sucess) {
//            
//            if (self.successCompletionBlock) {
//                self.successCompletionBlock(result);
//            }
//
//        } else {
//           
//            if (self.failureCompletionBlock) {
//                self.failureCompletionBlock(result);
//            }
//
//        }
//    }
//      [self clearCompletionBlock];
//}

//-(void)clearCompletionBlock{
//    
//    self.successCompletionBlock=nil;
//    self.failureCompletionBlock=nil;
//}


- (void)handleRequestResult:(WDBaseRequest *)request result:(id)result {
    
    if ([self checkResult:result]) {
        
//        NSHTTPURLResponse * resp=(NSHTTPURLResponse *)task.response;
//        NSInteger code= resp.statusCode;
//        NSLog(@"responseObject");

        [request settingJSONObject:result];
        
    }else{
        
        NSError * error=(NSError *)result;
        NSString * errStr=[error.userInfo objectForKey:@"NSLocalizedDescription"];
        NSString * errURLKey=[error.userInfo objectForKey:@"NSErrorFailingURLKey"];
        NSLog(@"%@",errStr);
        NSLog(@"%@",errURLKey);
        [request settingErrorStr:errStr];

    }
    
    self.sessionDataTask=nil;
}

- (BOOL)checkResult:(id )request {

    if ([request isKindOfClass:[NSError class]]) {
        
        return NO;
        
    }else{
        
//       return [self checkJson:request withValidator:nil];
        return YES;
        
    }
}


- (BOOL)checkJson:(id)json withValidator:(id)validatorJson {
    if ([json isKindOfClass:[NSDictionary class]] &&
        [validatorJson isKindOfClass:[NSDictionary class]]) {
        NSDictionary * dict = json;
        NSDictionary * validator = validatorJson;
        BOOL result = YES;
        NSEnumerator * enumerator = [validator keyEnumerator];
        NSString * key;
        while ((key = [enumerator nextObject]) != nil) {
            id value = dict[key];
            id format = validator[key];
            if ([value isKindOfClass:[NSDictionary class]]
                || [value isKindOfClass:[NSArray class]]) {
                return [self checkJson:value withValidator:format];
            } else {
                if ([value isKindOfClass:format] == NO &&
                    [value isKindOfClass:[NSNull class]] == NO) {
                    result = NO;
                    break;
                }
            }
        }
        return result;
    } else if ([json isKindOfClass:[NSArray class]] &&
               [validatorJson isKindOfClass:[NSArray class]]) {
        NSArray * validatorArray = (NSArray *)validatorJson;
        if (validatorArray.count > 0) {
            NSArray * array = json;
            NSDictionary * validator = validatorJson[0];
            for (id item in array) {
                BOOL result = [self checkJson:item withValidator:validator];
                if (!result) {
                    return NO;
                }
            }
        }
        return YES;
    } else if ([json isKindOfClass:validatorJson]) {
        return YES;
    } else {
        return NO;
    }
}

//- (NSString *)requestHashKey:(AFHTTPSessionManager *)operation {
//    NSString *key = [NSString stringWithFormat:@"%lu", (unsigned long)[operation hash]];
//    return key;
//}

- (NSString *)buildRequestUrl:(WDBaseRequest *)request {
    NSString *detailUrl = request.requestUrl;
    if ([detailUrl hasPrefix:@"http"]) {
        return detailUrl;
    }

    NSString *baseUrl;
    if ([request useCDN]) {
        if ([request cdnUrl].length > 0) {
            
            baseUrl = [request cdnUrl];
        }
    } else {
        if ([request baseUrl].length > 0) {
            
            baseUrl = [request baseUrl];
        }
    }
    return [NSString stringWithFormat:@"%@%@", baseUrl, detailUrl];
    
//    return nil;
}

-(void)dealloc{
    
    NSLog(@"WDNetRequest is dealloc");
}
@end
