//
//  TitleView.h
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/5/4.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleView : UIView
@property(nonatomic,strong)UILabel * titleLable;
@property(nonatomic,strong)UILabel * desLable;

-(void)updateSubViews:(NSString *)title des:(NSString *)des;
@end
