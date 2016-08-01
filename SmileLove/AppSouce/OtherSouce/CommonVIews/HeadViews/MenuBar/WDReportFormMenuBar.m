//
//  WDReportFormMenuBar.m
//  WuDaoForOrganiza
//
//  Created by hgh on 16/2/24.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "WDReportFormMenuBar.h"
#import "WDReportFormMenuBarButton.h"
#import "GlobleConfig.h"
#import "WDReportForm.h"

#define Segment_line_to_Border 10.0

@interface WDReportFormMenuBar()
{
    NSMutableArray*                 mMenuButtons;
    NSMutableArray*                 mOtherObjs;
    
    WDReportFormMenuBarButton*      mCurrentSelectedButton;
    
    UIView*                         mSegmentLine;
}

@end

@implementation WDReportFormMenuBar
@synthesize mArray;
@synthesize mDelegate;

-(void)setMArray:(NSMutableArray *)mArray_
{
    if (mArray!=nil) {
        return;
    }
    
    mArray = mArray_;
    
    NSInteger _objcount = [mMenuButtons count];
    for (NSInteger i=0; i<_objcount; i++) {
        UIView* _v = [mMenuButtons objectAtIndex:i];
        [_v removeFromSuperview];
    }
    [mMenuButtons removeAllObjects];
    
    _objcount = [mOtherObjs count];
    for (NSInteger i=0; i<_objcount; i++) {
        UIView* _v = [mOtherObjs objectAtIndex:i];
        [_v removeFromSuperview];
    }
    [mOtherObjs removeAllObjects];
    
    
    __weak typeof(self) _weakself = self;
    //
    NSInteger _count = [mArray_ count];
    float _line_from_top = 10.0;
    float _width = self.frame.size.width/(float)_count;
    for (NSInteger i=0; i<_count; i++) {
        WDReportForm* _fm = [mArray_ objectAtIndex:i];
        //
        CGRect _frame = CGRectMake(0+_width*i, 0, _width, self.frame.size.height);
        WDReportFormMenuBarButton* _bt= [[WDReportFormMenuBarButton alloc] initWithFrame:_frame];
       // _bt.backgroundColor = [UIColor redColor];
        _bt.mLable.textColor = TEXT_COLOR_LIGHT;
        _bt.tag = i;
        _bt.mLable.text = _fm.mTitle;
        [self addSubview:_bt];
        
        _bt.clickedBlock = ^(id _it){
            //
            
            [_weakself menuBarButtonClicked:_it];
        };
        
        [mMenuButtons addObject:_bt];
        
        if (i==0) {
            _bt.mLable.textColor = THEME_COLOR;
            mCurrentSelectedButton = _bt;
        }
        if (i<(_count-1)) {
            
            UIView* _line = [[UIView alloc] initWithFrame:CGRectMake(_width*(i+1)-1, _line_from_top, .5, self.frame.size.height-_line_from_top*2.0)];
            _line.backgroundColor = LINT_COLOR;
            [self addSubview:_line];
            
            [mOtherObjs addObject:_line];
        }
    }
    
    mSegmentLine = [[UIView alloc] initWithFrame:CGRectMake(Segment_line_to_Border, self.frame.size.height-3,_width-Segment_line_to_Border*2, 3)];
    mSegmentLine.backgroundColor = THEME_COLOR;
    [self addSubview:mSegmentLine];
    
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //
        mMenuButtons = [[NSMutableArray alloc] init];
        mOtherObjs = [[NSMutableArray alloc] init];
        
       // self.backgroundColor = [UIColor redColor];
        
    }
    
    return self;
}

-(void) menuBarButtonClicked:(id)_sender
{
    //
    if ([mCurrentSelectedButton isEqual:_sender]) {
        return;
    }
    
    mCurrentSelectedButton.mLable.textColor = TEXT_COLOR_LIGHT;
    
    mCurrentSelectedButton = _sender;
    
    mCurrentSelectedButton.mLable.textColor = THEME_COLOR;
    
    //
    if (self.mDelegate) {
        [self.mDelegate clickAtWithIndex:mCurrentSelectedButton.tag];
        [self.mDelegate clickAtWithSting:mCurrentSelectedButton.mLable.text];
    }

    NSInteger _ccount = [self.mArray count];
    //float _line_from_top = 10.0;
    float _width = self.frame.size.width/(float)_ccount;
    
    mSegmentLine.frame = CGRectMake(Segment_line_to_Border+_width*mCurrentSelectedButton.tag, mSegmentLine.frame.origin.y, mSegmentLine.frame.size.width, mSegmentLine.frame.size.height);

}

/**
 *  跳转到对应的index
 *
 *  @param _index 跳转到对应的index
 */
-(void)jumpAtIndex:(NSInteger)_index
{
    WDReportFormMenuBarButton* _next;
    //
    NSInteger _count = [mMenuButtons count];
    for (NSInteger i=0; i<_count; i++) {
        WDReportFormMenuBarButton* _bt = [mMenuButtons objectAtIndex:i];
        if (_bt.tag==_index) {
            _next = _bt;
            break;
        }
    }
    
    if ([mCurrentSelectedButton isEqual:_next]) {
        return;
    }
    
    mCurrentSelectedButton.mLable.textColor = TEXT_COLOR_LIGHT;
    
    mCurrentSelectedButton = _next;
    
    mCurrentSelectedButton.mLable.textColor = THEME_COLOR;
    
    
    NSInteger _ccount = [self.mArray count];
    //float _line_from_top = 10.0;
    float _width = self.frame.size.width/(float)_ccount;
    
    mSegmentLine.frame = CGRectMake(Segment_line_to_Border+_width*mCurrentSelectedButton.tag, mSegmentLine.frame.origin.y, mSegmentLine.frame.size.width, mSegmentLine.frame.size.height);
    
}

@end
