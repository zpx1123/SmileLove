//
//  WDReportFromNavBar.h
//  WuDaoForOrganiza
//
//  Created by hgh on 16/2/24.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDReportFromNavBar : UIView
{
    
}

@property(nonatomic,strong)id           mData;

@property(nonatomic,copy)void(^clickedBlock)(id);

@end
