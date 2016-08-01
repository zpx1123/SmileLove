//
//  WDBaseRequest.h
//  WDNetWorking
//
//  Created by 周鹏翔 on 15/12/28.
//  Copyright © 2015年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSInteger , WDRequestMethod) {
    WDRequestMethodGet = 0,
    WDRequestMethodPost,
    WDRequestMethodHead,
    WDRequestMethodPut,
    WDRequestMethodDelete,
    WDRequestMethodPatch
};

typedef NS_ENUM(NSInteger , WDRequestSerializerType) {
    WDRequestSerializerTypeHTTP = 0,
    WDRequestSerializerTypeJSON,
};
@interface WDBaseRequest : NSObject

/// Tag
@property (nonatomic) NSInteger tag;

/// User info
@property (nonatomic, strong) NSDictionary *userInfo;


@property (nonatomic, strong, readonly) NSString *ERRORString;

@property (nonatomic, strong, readonly) id responseJSONObject;

/// 请求的URL
@property(nonatomic,strong)NSString * requestUrl;
/// 请求的方式
@property(nonatomic,assign)WDRequestMethod  requestMethod ;
/// 请求的参数
@property(nonatomic,strong) id   requestArgument;

/// 请求的SerializerType
@property(nonatomic,assign)WDRequestSerializerType  requestSerializerType ;


/// 请求的CdnURL
- (NSString *)cdnUrl;

/// 请求的BaseURL
- (NSString *)baseUrl;

/// 请求的连接超时时间，默认为60秒
- (NSTimeInterval)requestTimeoutInterval;

/// 用于在cache结果，计算cache文件名时，忽略掉一些指定的参数
//- (id)cacheFileNameFilterForRequestArgument:(id)argument;

/// Http请求的方法
- (WDRequestMethod)requestMethod;

/// 请求的SerializerType
- (WDRequestSerializerType)requestSerializerType;

/// 请求的Server用户名和密码
- (NSArray *)requestAuthorizationHeaderFieldArray;

/// 在HTTP报头添加的自定义参数
- (NSDictionary *)requestHeaderFieldValueDictionary;

/// 是否使用CDN的host地址
- (BOOL)useCDN;

/// 当POST的内容带有文件等富文本时使用
//- (AFConstructingBlock)constructingBodyBlock;

/// 当需要断点续传时，指定续传的地址
//- (NSString *)resumableDownloadPath;

/// 当需要断点续传时，获得下载进度的回调
//- (AFDownloadProgressBlock)resumableDownloadProgressBlock;


#pragma mark - do it user it

-(void)settingJSONObject:(id)json;

-(void)settingErrorStr:(NSString*)error;
@end
