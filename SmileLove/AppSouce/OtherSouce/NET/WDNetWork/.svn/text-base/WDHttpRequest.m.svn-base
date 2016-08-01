//
//  WDHttpRequest.m
//  WDNetWorking
//
//  Created by 周鹏翔 on 15/12/28.
//  Copyright © 2015年 周鹏翔. All rights reserved.
//

#import "WDHttpRequest.h"
#import "WDNetRequest.h"

@interface WDHttpRequest(){
    
    id<WDNetInterface>_wdnet;
}

@end




@implementation WDHttpRequest


+(WDHttpRequest *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(id<WDNetInterface>)getDefault{
    
    if (_wdnet==nil) {
        
        _wdnet=[[WDNetRequest alloc]init];
    }
    
    return _wdnet;
}

//-(id<WDNetInterface>)getDefault:(NSString *)className{
//    
//    if (_wdnet==nil) {
//        Class class = NSClassFromString(className);
////        _wdnet=[[WDNetRequest alloc]init];
//        _wdnet=[(WDNetRequest *)[class alloc]init];
//        
//    }
//    
//    return _wdnet;
//}

+(id<WDNetInterface>)creatNetRequest{
    
//    return [[[self alloc]init]getDefault];
    return  [[[self class]sharedInstance] getDefault];
    

    
}
-(void)dealloc{
    
    NSLog(@"WDHttpRequest is dealloc");
}


-(instancetype)init{
    
    if (self=[super init]) {
        
    }
    return self;
    
}

-(void)creatOtherNetRequest:(id<WDNetInterface>)Request{
    
    _wdnet=Request;
}
@end
