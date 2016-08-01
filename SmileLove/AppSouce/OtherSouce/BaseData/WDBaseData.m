
//
//  WDBaseData.m
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/1/12.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "WDBaseData.h"
#import "NSObject+BaseObject.h"
//#import "LoginVC.h"
#import "MyLoaddingView.h"
#import "UserinfoSingle.h"
@implementation WDBaseData




-(void)NetRequestWithUrl:(NSString *)requestUrl
                Argument:(NSDictionary *)param
           requestMethod:(WDRequestMethod)method
                 success:(void (^)(id  json))success
                 failure:(void (^)(NSString *errStr))failure{

    
    WDBaseRequest * baserequest=[[WDBaseRequest alloc]init];
    
    baserequest.requestUrl=requestUrl;
    baserequest.requestArgument=param;
    baserequest.requestMethod=method;
    
    [MyLoaddingView show];
    
    [[WDHttpRequest creatNetRequest]startWithRequest:baserequest downloadProgress:nil success:^(WDBaseRequest *request) {
        
//        if ([[request.responseJSONObject allKeys]containsObject:@"infocode"]) {
//            
//           
//            
//            
//            if ([[request.responseJSONObject objectForKey:@"infocode"] isEqualToString:@"0000"]) {
//                
//                success([request.responseJSONObject objectForKey:@"datas"]);
//                
//            }else if ([[request.responseJSONObject objectForKey:@"infocode"] isEqualToString:@"0022"]) {
//                
//                    [self addLoginVC];
//            }else{
//                
//                NSString * errorStr=[request.responseJSONObject objectForKey:@"information"];
//                if ([UserinfoSingle sharedUserinfoSingle].usermodel!=nil) {
//                    
//                    [self popUpAlert:errorStr];
//                  
//                }
//                
//                 failure(errorStr);
//                
//            }
//        }else{
//            
//             failure(@"接口无效");
//
//        }
          [MyLoaddingView dismiss];
        
    } failure:^(WDBaseRequest *request) {
        
        failure(request.ERRORString);

        [self popUpAlert:request.ERRORString];
          [MyLoaddingView dismiss];
        
    }];
}
//-(void)addLoginVC{
//    
//    if (_LoginController==nil) {
//        
//        _LoginController =[[LoginVC alloc]init];
//        
//        UIWindow* keyWindow = [UIApplication sharedApplication].keyWindow;
//        
//        [keyWindow addSubview:_LoginController.view];
//    }
//    
//    
//    
//    typeof(self) weakSelf = self;
//    [_LoginController loginSuccedBlock:^{
//        
//        [UIView animateWithDuration:1.0 animations:^{
//            weakSelf.LoginController.view.alpha = 0.0;
//            weakSelf.LoginController.view.transform = CGAffineTransformMakeScale(1.5, 1.5);
//        } completion:^(BOOL finished) {
//            
//            [weakSelf.LoginController.view removeFromSuperview];
//        }];
//        
//        
//        //        [weakSelf.LoginController.view removeFromSuperview];
//    }];
//    
//    
//}

@end
