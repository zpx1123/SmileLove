//
//  UIViewController+Present_Dissmiss.m
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/1/12.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "UIViewController+Present_Dissmiss.h"

@implementation UIViewController (Present_Dissmiss)
-(void)presentVC:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    
    [self presentViewController:viewControllerToPresent animated:flag completion:completion];
}
-(void)dismissVC:(BOOL)flag completion:(void (^)(void))completion{
    
    [self dismissViewControllerAnimated:flag completion:completion];
}
@end
