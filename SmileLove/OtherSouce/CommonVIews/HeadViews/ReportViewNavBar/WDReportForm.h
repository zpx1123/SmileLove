//
//  WDReportForm.h
//  WuDaoForOrganiza
//
//  Created by hgh on 16/2/24.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDReportForm : NSObject
{
    
}

@property(nonatomic,strong)NSString*                mid;
@property(nonatomic,strong)NSString*                mIcon;
@property(nonatomic,strong)NSString*                mTitle;

@end


@interface WDReportFormViewData : NSObject
{
    
}

@property(nonatomic,strong)NSMutableArray*          mMenuBarData;
@property(nonatomic,strong)NSMutableArray*          mViewData;
@property(nonatomic,strong)NSMutableArray*          mNavBarData;


@end

