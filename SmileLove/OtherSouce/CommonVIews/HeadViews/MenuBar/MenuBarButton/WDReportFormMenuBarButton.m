//
//  WDReportFormMenuBarButton.m
//  WuDaoForOrganiza
//
//  Created by hgh on 16/2/24.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "WDReportFormMenuBarButton.h"


@interface WDReportFormMenuBarButton()
{
    
}

@end

@implementation WDReportFormMenuBarButton
@synthesize mLable;

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        
        self.mLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.mLable.textAlignment = NSTextAlignmentCenter;
        self.mLable.font = [UIFont systemFontOfSize:14];
        //self.mLable.textColor = ;
        [self addSubview:self.mLable];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureClick:)]];
        
    }
    return self;
}

-(void)gestureClick:(id)_sender
{
    if (self.clickedBlock) {
        self.clickedBlock(self);
    }
}

@end
