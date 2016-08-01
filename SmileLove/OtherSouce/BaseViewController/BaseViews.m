//
//  BaseViews.m
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/4/25.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "BaseViews.h"
#import <YYKit/YYKit.h>
#import "WDDefaultView.h"
#import "WDNOClassView.h"

@interface BaseViews(){
    
    WDDefaultView * _headDefaultView;
    WDNOClassView * _entempDefaultView;
}

@end
@implementation BaseViews

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    
    self.exclusiveTouch = YES;
    
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.size.height = kScreenHeight;
    }
    if (self=[super initWithFrame:frame]) {
        
        
    }
    
    
    return self;
}

-(void)showFailueViewDefault:(UIView *)toview{

    if (_headDefaultView==nil) {

        _headDefaultView=[[WDDefaultView alloc]init];
        _headDefaultView.defaultImageView.image=[UIImage imageNamed:@"notnet_icon"];
        _headDefaultView.desLabel.text=@"";
        _headDefaultView.frame=self.frame;
        [self addSubview:_headDefaultView];
        [toview addSubview:self];
        [_headDefaultView defaultButtonClickBlock:^{
            

        }];
    }


}
-(void)removeFailueDefaultView{

    if (_headDefaultView) {

        [_headDefaultView removeFromSuperview];
        _headDefaultView=nil;
    }
}

//-(void)showNoDataView:(UIView *)toview{
//    if (!_entempDefaultView) {
//        _entempDefaultView = [[WDNOClassView alloc]init];
//        _entempDefaultView.desLabel.text=@"暂无数据";
//        _entempDefaultView.defaultImageView.image=[UIImage imageNamed:@"default_failure_icon"];
//
//        _entempDefaultView.frame=self.frame;
//        _entempDefaultView.top=64;
//        [self addSubview:_entempDefaultView];
//        [toview addSubview:self];
//    }
//}
//-(void)removeNoDataView{
//
//    if (_entempDefaultView) {
//
//        [_entempDefaultView removeFromSuperview];
//        _entempDefaultView=nil;
//    }
//}

-(void)showPropertyNoDataView:(UIView *)toview{
    if (!_entempDefaultView) {
        _entempDefaultView = [[WDNOClassView alloc]init];
        _entempDefaultView.desLabel.text=@"";
        _entempDefaultView.defaultImageView.image=[UIImage imageNamed:@"property_no_icon"];
        
        _entempDefaultView.frame=self.frame;
        _entempDefaultView.top=64;
        [self addSubview:_entempDefaultView];
        [toview addSubview:self];
    }
}
-(void)removePropertyNoDataView{
    
    if (_entempDefaultView) {
        
        [_entempDefaultView removeFromSuperview];
        _entempDefaultView=nil;
    }
}

-(void)showNoDataView:(UIView *)toview{
    if (!_entempDefaultView) {
        _entempDefaultView = [[WDNOClassView alloc]init];
        _entempDefaultView.desLabel.text=@"";
        _entempDefaultView.defaultImageView.image=[UIImage imageNamed:@"notfound_icon"];
        
        _entempDefaultView.frame=self.frame;
        _entempDefaultView.top=64;
        [self addSubview:_entempDefaultView];
        [toview addSubview:self];
    }
}
-(void)removeNoDataView{
    
    if (_entempDefaultView) {
        
        [_entempDefaultView removeFromSuperview];
        _entempDefaultView=nil;
    }
}

@end
