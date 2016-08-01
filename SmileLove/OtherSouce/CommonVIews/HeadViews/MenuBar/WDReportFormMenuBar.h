//
//  WDReportFormMenuBar.h
//  WuDaoForOrganiza
//
//  Created by hgh on 16/2/24.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDReportFormMenuBarDelegate.h"

@interface WDReportFormMenuBar : UIView
{
    
}

@property(nonatomic,assign)id<WDReportFormMenuBarDelegate> mDelegate;

@property(nonatomic,strong)NSMutableArray*                  mArray;

/**
 *  跳转到对应的index
 *
 *  @param _index 跳转到对应的index
 */
-(void)jumpAtIndex:(NSInteger)_index;


@end
