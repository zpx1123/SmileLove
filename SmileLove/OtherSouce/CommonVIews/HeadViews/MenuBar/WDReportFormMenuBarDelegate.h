//
//  WDReportFormMenuBarDelegate.h
//  WuDaoForOrganiza
//
//  Created by hgh on 16/2/24.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WDReportFormMenuBarDelegate <NSObject>

/**
 *  点击当前按钮的下标
 *
 *  @param _index 对应 下标
 */
-(void)clickAtWithIndex:(NSInteger)_index;

/**
 *  点击当前按钮的下标
 *
 *  @param _index 对应 下标
 */
-(void)clickAtWithSting:(NSString*)_str;




@end
