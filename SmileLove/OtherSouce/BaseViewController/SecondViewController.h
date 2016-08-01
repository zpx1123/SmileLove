//
//  SecondViewController.h
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/2/18.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^backSucess_Block)(id date);


@interface SecondViewController : UIViewController


-(instancetype)initWithDateSouce:(NSMutableArray *)date;

@property(nonatomic,strong)backSucess_Block sucessBlock;

-(void)backBlock:(void (^)(id  date))block;

@end
