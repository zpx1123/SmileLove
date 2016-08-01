//
//  MyLoaddingView.h
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/6/17.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyLoaddingView : UIView

+(void)show;

+(void)showAt:(UIView*)_v;

+(void)dismiss;

+(void)dismissWithError;

@end
