//
//  WDDefaultView.m
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/1/22.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "WDDefaultView.h"
#import <YYKit/YYKit.h>


@interface WDDefaultView(){
    
   
   
    UIButton * _button;
}

@end

@implementation WDDefaultView

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
        
         self.backgroundColor=[UIColor whiteColor];
        [self updateSubViews];
    }
    
    return self;
}

-(void)updateSubViews{
    
    _desLabel=[[UILabel alloc]init];
    _desLabel.size=CGSizeMake(kScreenWidth, 30);
    _desLabel.center=self.center;
    _desLabel.text=@"信号不好？网络没开？请检查下网络";
    _desLabel.textAlignment=NSTextAlignmentCenter;
    _desLabel.font=[UIFont systemFontOfSize:16];
    _desLabel.textColor=[UIColor redColor];
//    _desLabel.textColor=[UIColor redColor];
    [self addSubview:_desLabel];
    
    
    _defaultImageView=[[UIImageView alloc]init];
    _defaultImageView.size=CGSizeMake(188, 208);
    _defaultImageView.centerX=self.centerX;
    _defaultImageView.centerY=self.centerY-80;
    _defaultImageView.contentMode=UIViewContentModeScaleAspectFill;
    _defaultImageView.image=[UIImage imageNamed:@"default_cry_icon"];
    [self addSubview:_defaultImageView];
    
    
//    _button=[[UIButton alloc]init];
//    _button.size=CGSizeMake(100, 40);
//    _button.centerX=self.centerX;
//    _button.centerY=_desLabel.centerY+50;
//    [_button setTitle:@"刷新试试" forState:UIControlStateNormal];
//    _button.backgroundColor=[UIColor redColor];
//    _button.layer.cornerRadius=3;
//    _button.layer.masksToBounds=YES;
//    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//     [_button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:_button];
    
    
}
-(void)defaultButtonClickBlock:(void (^)(void))block{
    
    self._defaultBlock=block;
}
-(void)buttonClick{
    
    if (self._defaultBlock) {
    
        self._defaultBlock();
    }
}
@end
