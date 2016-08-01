//
//  WDLoading.m
//  WuDaoForOrganiza
//
//  Created by hgh on 16/1/21.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "MyLoaddingView.h"
#import <QuartzCore/QuartzCore.h>
#import "WDLoadingView.h"
#import "GlobleConfig.h"
#import "NSObject+BaseObject.h"
#define ACTIVE_LOADING_HIGHT 50.0
#define ACTIVE_LOADING_WIDHT 50.0

#define ROUND_BCK_LENGTH 120

@interface MyLoaddingView()
{
    
}
@property(nonatomic,strong)UIActivityIndicatorView*         mActView;
@end

@implementation MyLoaddingView
@synthesize mActView;

- (id)initWithFrame:(CGRect)frame {
    
    if ((self = [super initWithFrame:frame])) {
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor colorWithRed:.0 green:.0 blue:.0 alpha:.3];
        //self.backgroundColor = [UIColor clearColor];
        //self.alpha = 0;
        //self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        //添加控件
        UIView* _bck = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width-ROUND_BCK_LENGTH)*.5, (frame.size.height-ROUND_BCK_LENGTH)*.5, ROUND_BCK_LENGTH, ROUND_BCK_LENGTH)];
        [self addSubview:_bck];
        _bck.backgroundColor = [UIColor clearColor];
        _bck.layer.masksToBounds = YES;
        _bck.layer.cornerRadius=5;
        
        
        CGRect _buttonframe = CGRectMake((frame.size.width-ACTIVE_LOADING_WIDHT)*0.5,(frame.size.height-ACTIVE_LOADING_HIGHT)*0.5,ACTIVE_LOADING_WIDHT,ACTIVE_LOADING_HIGHT);
        
        //加载动画
        
        //        mActView = [[WDRingIndicator alloc]initWithFrame:_buttonframe];
        //        //        voring.bounds = self.arrowImage.bounds;
        //        //        voring.autoresizingMask = self.arrowImage.autoresizingMask;
        //        [self addSubview:mActView];
        
        
        //        mActView = [[WDLoadingView alloc] initWithFrame:_buttonframe];
        //        mActView.lineWidth = 20;
        //        mActView.lineColor =THEME_COLOR;
        //        //[loading startAnimation];
        //        [self addSubview:mActView];
        
        
        mActView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        mActView.tag=100;
        mActView.frame = _buttonframe;
        [self addSubview:mActView];
        
        mActView.color = [UIColor redColor];
        // [mActView setHidden:YES]
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exitClick:)]];
        self.userInteractionEnabled= YES;
        
    }
    
    return self;
}

-(void)exitClick:(id)_sender
{
    
}

-(void) start
{
    [self.mActView startAnimating];
}

-(void) stop
{
    [self.mActView startAnimating];
}

-(void) remove
{
    if ([self.mActView isAnimating]) {
        [self removeFromSuperview];
    }
}

+ (MyLoaddingView*)sharedView {
    static dispatch_once_t once;
    static MyLoaddingView *sharedView;
    dispatch_once(&once, ^ {
        
        sharedView = [[MyLoaddingView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        //UIView* _v = [[UIApplication sharedApplication].windows lastObject];
        //[[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:sharedView];
        
        
    });
    
    return sharedView;
}

+(void)show
{
    //
    
   
    
    
    [[MyLoaddingView sharedView] remove];
//    [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:[MyLoaddingView sharedView]];
    UIWindow* keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:[MyLoaddingView sharedView]];
    
    //[];
    [[MyLoaddingView sharedView] start];
    
}

+(void)showAt:(UIView*)_v
{
    [[MyLoaddingView sharedView] remove];
    [_v addSubview:[MyLoaddingView sharedView]];
    [_v bringSubviewToFront:[MyLoaddingView sharedView]];
    [[MyLoaddingView sharedView] start];
}

+(void)dismiss
{
    [[MyLoaddingView sharedView] stop];
    [[MyLoaddingView sharedView] removeFromSuperview];
}

+(void)dismissWithError
{
    //
}





@end
