//
//  EditContentsViewController.h
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/2/15.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+Push_Pop.h"

@protocol EditContentsViewControllerDelegate <NSObject>

-(void)editComplete:(NSString *)labelTitle type:(NSInteger)type;

@end

@interface EditContentsViewController : UIViewController

@property(nonatomic,strong)NSString *mEditType;
@property(nonatomic,weak)id<EditContentsViewControllerDelegate>delegate;

-(instancetype)initWithText:(NSString *)text;
@end
