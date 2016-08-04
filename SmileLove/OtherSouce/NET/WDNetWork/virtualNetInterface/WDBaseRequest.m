//
//  WDBaseRequest.m
//  WDNetWorking
//
//  Created by 周鹏翔 on 15/12/28.
//  Copyright © 2015年 周鹏翔. All rights reserved.
//

#import "WDBaseRequest.h"
#import "UserinfoSingle.h"

@implementation WDBaseRequest

- (WDRequestMethod)requestMethod {
    
    if (_requestMethod) {
        
        return _requestMethod;
        
    }else{
        
        return WDRequestMethodGet;
    }
    
    
}

/// 请求的CdnURL
- (NSString *)cdnUrl{
    
    return @"";
}

/// 请求的BaseURL
- (NSString *)baseUrl{
    
     //开发库
    return @"http://192.168.1.20:9080/tlsme/";
}

/// 请求的连接超时时间，默认为60秒
- (NSTimeInterval)requestTimeoutInterval{
    
    return 3.0f;
}

/// 请求的SerializerType
- (WDRequestSerializerType)requestSerializerType{
    
    if (_requestSerializerType) {
        
        return _requestSerializerType;
    }else{
        
        return WDRequestSerializerTypeHTTP;
    }
    
}
/// 请求的Server用户名和密码
- (NSArray *)requestAuthorizationHeaderFieldArray{
    
    return nil;
}

/// 在HTTP报头添加的自定义参数
- (NSDictionary *)requestHeaderFieldValueDictionary{
    

    return @{@"WDCLI":@"SSO6325C03A93532E02AE6AF1AF0DC63893"};
//    return nil;
    
}

- (BOOL)useCDN{
    
    return NO;
}

-(void)settingJSONObject:(id)json{
    

    _responseJSONObject=json;
    
}
-(void)settingErrorStr:(NSString*)error{
    
    _ERRORString=error;
}


@end
