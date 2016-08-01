//
//  TitleView.m
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/5/4.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "TitleView.h"
#import <YYKit/YYKit.h>
#import "UILabel+MyExtended.h"
@implementation TitleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame {
    
    self.exclusiveTouch = YES;
    
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.size.height = 40;
    }
    
    if (self=[super initWithFrame:frame]) {
        
//        self.backgroundColor=[UIColor whiteColor];

    }
    
    return self;
}
-(void)updateSubViews:(NSString *)title des:(NSString *)des{
    
    _titleLable=[[UILabel alloc]init];
    _titleLable.text=title;
    _titleLable.font=[UIFont systemFontOfSize:14];
    CGSize size=[_titleLable sizeWithString:title font:[UIFont systemFontOfSize:14] width:kScreenWidth-80];
     _titleLable.size=CGSizeMake(60, size.height);
    _titleLable.left=10;
    _titleLable.top=self.frame.size.height/2-_titleLable.height/2;
    [self addSubview:_titleLable];
    
    
//    
    _desLable=[[UILabel alloc]init];
    _desLable.text=des;
    _desLable.textAlignment = NSTextAlignmentLeft;
    _desLable.lineBreakMode = NSLineBreakByCharWrapping;
    _desLable.numberOfLines = 0;
    _desLable.size=[_desLable sizeWithString:des font:[UIFont systemFontOfSize:13] width:kScreenWidth-_titleLable.width-20-10];
    
    _desLable.left=_titleLable.right+10;
    _desLable.top=_titleLable.top;
    _desLable.font=[UIFont systemFontOfSize:13];
    [self addSubview:_desLable];
    
    
//    self.frame=CGRectMake(0, 0, kScreenWidth, _desLable.height+10);
  
   
  
    
}
-(void)layoutSubviews{
    self.frame=CGRectMake(self.origin.x, self.origin.y, kScreenWidth, _desLable.height+20);
    
}
@end
