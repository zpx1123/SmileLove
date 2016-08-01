//
//  BaseViews.h
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/4/25.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViews : UIView

-(void)showFailueViewDefault:(UIView *)toview;
-(void)removeFailueDefaultView;

-(void)showNoDataView:(UIView *)toview;
-(void)removeNoDataView;

-(void)showPropertyNoDataView:(UIView *)toview;
-(void)removePropertyNoDataView;

@end
