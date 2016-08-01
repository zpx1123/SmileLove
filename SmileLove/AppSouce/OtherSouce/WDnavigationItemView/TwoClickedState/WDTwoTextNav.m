//
//  WDTwoTextNav.m
//  WuDaoForOrganiza
//
//  Created by hgh on 16/1/13.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "WDTwoTextNav.h"

@interface WDTwoTextNav()
{
    NSString*                   mNormalText;
    NSString*                   mPressText;
    
    UILabel*                    mLable;
}

@end

@implementation WDTwoTextNav
@synthesize mClickedBlock;


-(id) initWithFrame:(CGRect)frame NormalText:(NSString*)_nm PressedText:(NSString*)_p
{
    mNormalText = _nm;
    mPressText = _p;
    self = [super initWithFrame:frame];
    if (self) {
        
        mLable = [[UILabel alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
        mLable.text = _nm;
        mLable.font = [UIFont systemFontOfSize:14];
        mLable.textAlignment = NSTextAlignmentRight;
        mLable.textColor = [UIColor whiteColor];
        [self addSubview:mLable];
        
        UIButton* _bt = [[UIButton alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
        _bt.tag = 300;
        [_bt addTarget:self action:@selector(clicked:)  forControlEvents:UIControlEventTouchUpInside];
        [_bt setHighlighted:YES];
        [self addSubview:_bt];

    }
    return self;

}

-(void)clicked:(UIButton*)_sender
{
    [_sender setSelected:![_sender isSelected]];
    
    if (self.mClickedBlock) {
        self.mClickedBlock(mLable.text);
    }
    
    if ([_sender isSelected]) {
        mLable.text = mPressText;
    }else
        mLable.text = mNormalText;
}

-(void) mofifyCurrentText:(NSString*)_t
{
    mLable.text = _t;
}

-(void) recover
{
    UIButton* _bt = [self viewWithTag:300];
    
    [_bt setSelected:NO];
    
    mLable.text = mNormalText;
    
}

@end
