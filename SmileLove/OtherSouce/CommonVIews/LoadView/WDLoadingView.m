//
//  WDLoadingView.m
//  ChinaDance
//
//  Created by 周鹏翔 on 15/8/20.
//  Copyright (c) 2015年 hgh. All rights reserved.
//

#import "WDLoadingView.h"
#import "UIImageEffects.h"

@implementation WDLoadingView{
    
    CGPoint panelCenter;
    float panelHeight;
}
//singleton_implementation(WDLoadingView)
-(instancetype)initWithView:(BOOL)dismiss showText:(NSString*)_showtext{
    
    if (self = [super init]) {
        
        UIView* screenView = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
        
        
        
        _blurredBackground = YES;
        
        
        _backgroundColor = [UIColor blackColor];
        _blurTintColor = [UIColor colorWithWhite:0.1 alpha:0.4];;
        
        self.frame = screenView.frame;
        
        backgroundImage = [UIImageView new];
        backgroundImage.translatesAutoresizingMaskIntoConstraints = NO;
        
        panel = [UIView new];
        panel.translatesAutoresizingMaskIntoConstraints = NO;
        
        //        UITapGestureRecognizer *backgroungTap = [[UITapGestureRecognizer alloc]
        //                                                 initWithTarget:self
        //                                                 action:@selector(hideAlert)];
        //
        //        backgroungTap.cancelsTouchesInView = YES;
        //
        //        [self addGestureRecognizer:backgroungTap];
        
        [self addSubview:backgroundImage];
        [self addSubview:panel];
        
        
        UIView * BGView=[[UIView alloc]initWithFrame:CGRectMake(20,100, self.frame.size.width-40, 300)];
        BGView.backgroundColor=[UIColor whiteColor];
        BGView.center=self.center;
        [self addSubview:BGView];
        
        
       
        
        
        
      
        
        UILabel* mytext=[[UILabel alloc] init];
        mytext.backgroundColor=[UIColor whiteColor];
        mytext.frame=CGRectMake(self.frame.size.width/2-100,self.frame.size.height/2, 200, 30);
        mytext.tag=999;
        mytext.text=_showtext;
        mytext.textAlignment = NSTextAlignmentCenter;
        mytext.font=[UIFont systemFontOfSize:14.0f];
//        mytext.layer.borderColor=[UIColor whiteColor].CGColor;
//        mytext.layer.borderWidth=0.5f;
        mytext.textColor=[UIColor colorWithRed:225.0/255.0f green:72.0/255.0f blue:118.0/255.0f alpha:1.0];
        [self addSubview:mytext];
        
        
          UIWindow* keyWindow = [UIApplication sharedApplication].keyWindow;
        //        [self showInView:UiWindowView];
        [self showInView:keyWindow isdismiss:dismiss];
        
    }
    
    return self;
}




-(void)showInView:(UIView *)view isdismiss:(BOOL)dismiss{
    
    [view addSubview:self];
    
    panel.backgroundColor = _backgroundColor;
    
    NSDictionary *mainViews = @{@"bg":backgroundImage,@"panel":panel};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[bg]-0-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:mainViews]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bg]-0-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:mainViews]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[panel]-0-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:mainViews]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[panel]-0-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:mainViews]];
    
    if (_blurredBackground) {
        
        UIGraphicsBeginImageContext([view.layer frame].size);
        
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        UIImage *inImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        UIImage *outImage = [UIImageEffects imageByApplyingBlurToImage:inImage withRadius:1.0 tintColor:_blurTintColor saturationDeltaFactor:1.2 maskImage:nil];
        
        UIGraphicsBeginImageContext(outImage.size);
        
        CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0, outImage.size.height);
        CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0, -1.0);
        
        CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, outImage.size.width, outImage.size.height), outImage.CGImage);
        
        CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0, outImage.size.height);
        CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0, -1.0);
        
        CGRect circlePoint = (_claerArea);
        CGContextSetFillColorWithColor( UIGraphicsGetCurrentContext(), [UIColor clearColor].CGColor );
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeClear);
        CGContextFillRect(UIGraphicsGetCurrentContext(), circlePoint);
        
        UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        backgroundImage.image = finalImage;
        
    }
    
    
    
    [self layoutSubviews];
    
    backgroundImage.alpha = 0;
    panelCenter = panel.center;
    panelHeight = panel.frame.size.height / 2;
    
    panel.center = CGPointMake(panelCenter.x, panelCenter.y + panelHeight*2);
    
    [UIView animateWithDuration:0.2 animations:^{
        backgroundImage.alpha = 1;
        panel.center = panelCenter;
        
    }];
    
    if (dismiss) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self removeFromSuperview];
            
        });
    }
    
    
}

- (void) hideAlert
{
    
    //    [UIView animateWithDuration:0.2 animations:^{
    //        backgroundImage.alpha = 0;
    //        panel.frame = CGRectMake(0, panel.frame.origin.y + panel.frame.size.height, panel.frame.size.width, panel.frame.size.height);
    //    } completion:^(BOOL finished) {
    //        [self removeFromSuperview];
    //    }];
    
    [self removeFromSuperview];
    
}
//-(void)show{
//
//    return [[self alloc] initWithView:NO];
//}
//-(void)showTime{
//
//    return [[self alloc] initWithView:YES];
//
//}
-(void)dissmiss{
    
    //    if (![self isVisible]) {
    //        return;
    //    }
    //
    //    [[self sharedWDLoadingView] hideAlert];
    
}
//+ (BOOL)isVisible
//{
//    return ([self sharedWDLoadingView].superview != nil);
//}


-(void) setProgress:(NSString*)_progress
{
    UILabel* txtlb=(UILabel*)[self viewWithTag:999];
    txtlb.text=_progress;
}
@end
