//
//  PublicView.h
//  TLServicePlatform
//
//  Created by 周鹏翔 on 16/7/5.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicView : UIView
@property(nonatomic,strong)NSMutableDictionary * dataSouceDic;

-(void)bindDataSouceForViews:(NSMutableDictionary *)dataSouce;
@end
