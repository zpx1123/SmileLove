//
//  WDReportFromNavBar.m
//  WuDaoForOrganiza
//
//  Created by hgh on 16/2/24.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "WDReportFromNavBar.h"
#import "WDReportForm.h"

#define space_lableAndArrows 10.0
#define Arrow_widht 14.0
#define Arrow_hight 7.0

@interface WDReportFromNavBar()
{
    UIImageView*                mArrowsView;
    UILabel*                    mLable;
}

@end

@implementation WDReportFromNavBar
@synthesize mData;
@synthesize clickedBlock;

-(void)setMData:(id)mData_
{
    //
    mData = mData_;
    
    WDReportForm* _rf = (WDReportForm*)mData_;
    
    CGSize size = [_rf.mTitle sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:mLable.font,NSFontAttributeName, nil]];
    // 名字的W
    float _max_lable_width = self.frame.size.width - Arrow_widht - space_lableAndArrows;
    
    if (size.width >= _max_lable_width) {
        mLable.frame = CGRectMake(0, 0, _max_lable_width,self.frame.size.height);
        mArrowsView.frame = CGRectMake(_max_lable_width+space_lableAndArrows, mArrowsView.frame.origin.y
                                       , mArrowsView.frame.size.width, mArrowsView.frame.size.height);
    }
    else
    {
        CGFloat nameW = size.width;
        
        mLable.frame = CGRectMake((self.frame.size.width-nameW)*.5, 0, nameW,self.frame.size.height);
        mArrowsView.frame = CGRectMake(self.frame.size.width*.5+nameW*.5+space_lableAndArrows, mArrowsView.frame.origin.y, mArrowsView.frame.size.width, mArrowsView.frame.size.height);
        
    }
    
    //mLable.backgroundColor = [UIColor yellowColor];

    mLable.text = _rf.mTitle;
    NSRange range;
    range=[_rf.mTitle rangeOfString:@"▼"];
    
    
    if (range.location!=NSNotFound) {
        
        NSLog(@"found at location = %lu,length = %lu",(unsigned long)range.location,(unsigned long)range.length);
        // 设置颜色
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_rf.mTitle];
        
       
        
        [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:range];
        
        mLable.attributedText = str;
        
    }
    
}

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //

        mArrowsView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width-Arrow_widht, (frame.size.height-Arrow_hight)*.5, Arrow_widht, Arrow_hight)];
        
        mArrowsView.image = [UIImage imageNamed:@"navigation_btn_down1"];
        //mArrowsView.backgroundColor = [UIColor yellowColor];
        [self addSubview:mArrowsView];
        
        float _lable_width = frame.size.width -space_lableAndArrows - Arrow_widht;
        
        mLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _lable_width, frame.size.height)];
        mLable.center = CGPointMake(self.bounds.size.width/2, 22);
        mLable.textColor = [UIColor whiteColor];
        //mLable.backgroundColor = [UIColor greenColor];
        // 设置Label的字体 HelveticaNeue  Courier
        mLable.font = [UIFont systemFontOfSize:18];;
        // 根据字体得到NSString的尺寸
        
        mLable.textColor = [UIColor blackColor];
        mLable.font = [UIFont systemFontOfSize:18];
        mLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:mLable];
        
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureClick:)]];

        
    }
    return self;
}

-(void) gestureClick:(id)_sender
{
    if (self.clickedBlock) {
        self.clickedBlock(mData);
    }
    
}

@end
