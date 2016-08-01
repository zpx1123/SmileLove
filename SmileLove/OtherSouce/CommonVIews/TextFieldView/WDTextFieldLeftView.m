//
//  WDTextFieldLeftView.m
//  WuDaoForOrganiza
//
//  Created by Chinadance on 16/1/12.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "WDTextFieldLeftView.h"

@implementation WDTextFieldLeftView

-(instancetype)initViewWithImage:(NSString *)imageName withTitle:(NSString *)title{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 90, 60);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
        imageView.image = [UIImage imageNamed:imageName];
        [self addSubview:imageView];
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(50, 20, 40, 20)];
        lable.text = title;
        lable.font = [UIFont systemFontOfSize:15];
        [self addSubview:lable];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
