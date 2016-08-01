//
//  WDLoadingView.h
//  ChinaDance
//
//  Created by 周鹏翔 on 15/8/20.
//  Copyright (c) 2015年 hgh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface WDLoadingView : UIView{
    
    UIImageView *backgroundImage;
    UIView *panel;
    
}
//singleton_interface(WDLoadingView)


@property (nonatomic, readwrite) CGRect claerArea;
@property (nonatomic, readwrite) BOOL blurredBackground;
@property (nonatomic, strong) UIColor* backgroundColor;
@property (nonatomic, strong) UIColor* blurTintColor;


+(instancetype)show;
+(instancetype)showTime;
-(instancetype)initWithView:(BOOL)dismiss showText:(NSString*)_showtext;
+(void)dissmiss;
-(void) hideAlert;
-(void)showInView:(UIView *)view isdismiss:(BOOL)dismiss;

-(void) setProgress:(NSString*)_progress;
@end
