//
//  WDNOClassView.m
//  WuDaoForOrganiza
//
//  Created by Chinadance on 16/1/25.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "WDNOClassView.h"
#import <YYKit/YYKit.h>

@interface WDNOClassView()
{
    
    UIImageView * _defaultImageView;
//    UILabel * _desLabel;
}
@end

@implementation WDNOClassView


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
- (void)updateSubViews
{
    _desLabel=[[UILabel alloc]init];
    _desLabel.size=CGSizeMake(130, 80);
    _desLabel.center=self.center;
    _desLabel.numberOfLines = 2;
    _desLabel.text=@"今天没有课程安排喔 赶快去排班吧!";
    _desLabel.textAlignment=NSTextAlignmentCenter;
    //_desLabel.font=[UIFont systemFontOfSize:16];
    _desLabel.font = [UIFont fontWithName:@"Helvetica" size:14.f];
    _desLabel.textColor=[UIColor colorWithHexString:@"909090"];
    _desLabel.alpha = 0.8;
    //    _desLabel.textColor=[UIColor redColor];
    [self addSubview:_desLabel];
    
    
    _defaultImageView=[[UIImageView alloc]init];
    _defaultImageView.size=CGSizeMake(188, 208);
    _defaultImageView.centerX=self.centerX;
    _defaultImageView.centerY=self.centerY-120;
    _defaultImageView.contentMode=UIViewContentModeScaleAspectFill;
    _defaultImageView.image=[UIImage imageNamed:@"noClass2"];
    [self addSubview:_defaultImageView];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
