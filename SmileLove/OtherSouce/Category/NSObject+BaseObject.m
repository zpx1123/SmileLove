//
//  NSObject+BaseObject.m
//  AAAAAAS
//
//  Created by 宋晨 on 15/10/14.
//  Copyright © 2015年 宋晨. All rights reserved.
//
#import "VLCStatusLabel.h"
#import "NSObject+BaseObject.h"

@implementation NSObject (BaseObject)
-(void)popUpAlert:(NSString *)alert{
    
    UIWindow* keyWindow = [UIApplication sharedApplication].keyWindow;
    VLCStatusLabel * lable=[[VLCStatusLabel alloc]init];
    [lable showStatusMessage:alert];
    lable.center=keyWindow.center;
    [keyWindow addSubview:lable];
}
//-(void)MixDataToViewModel:(id)data{
//    
//    
//    
//    
//    NSMutableArray * arr=(NSMutableArray *)data;
//    
//    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        
//        SafeModel * modle=(SafeModel *)obj;
//        modle.head_path=[NSString stringWithFormat:@"%@%@",ImageUrlHeadPath",modle.head_path];
//    }];
//    
//    
//    self.dataSouceArrs=data;
//}
@end
