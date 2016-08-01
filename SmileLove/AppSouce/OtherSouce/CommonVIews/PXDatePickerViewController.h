//
//  PXDatePickerViewController.h
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/2/25.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PXDatePickerViewDelegate <NSObject>

-(void)DatePickerDidClick:(NSString *)date;
-(void)DatePickerClosed;

@end

@interface PXDatePickerViewController : UIView<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,weak)id<PXDatePickerViewDelegate>delegate;

-(void)choseDate:(NSDate *)nowDate;

//-(void)choseDateDay:(BOOL)isDay;
-(void)choseDateNeedMonth:(BOOL)dmonth AndDay:(BOOL)dday;
@end
