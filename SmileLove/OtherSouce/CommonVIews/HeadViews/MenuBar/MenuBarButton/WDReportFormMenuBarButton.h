//
//  WDReportFormMenuBarButton.h
//  WuDaoForOrganiza
//
//  Created by hgh on 16/2/24.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDReportFormMenuBarButton : UIView
{
    
}

@property(nonatomic,strong)UILabel*                 mLable;
@property(nonatomic,copy)void(^clickedBlock)(id);

@end
