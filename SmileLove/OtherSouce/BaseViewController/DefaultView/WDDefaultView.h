//
//  WDDefaultView.h
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/1/22.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DefaultButton_Block_Void)(void);



@interface WDDefaultView : UIView

@property(nonatomic,copy)DefaultButton_Block_Void   _defaultBlock;

-(void)defaultButtonClickBlock:(void (^)(void))block;

@property(nonatomic,strong)UIImageView * defaultImageView;
@property(nonatomic,strong) UILabel * desLabel;

@end
