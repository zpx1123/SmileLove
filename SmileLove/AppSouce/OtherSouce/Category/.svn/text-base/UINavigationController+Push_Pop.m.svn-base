//
//  UINavigationController+Push_Pop.m
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/1/12.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "UINavigationController+Push_Pop.h"

@implementation UINavigationController (Push_Pop)
-(void)pushVC:(UIViewController *)viewController animated:(BOOL)animated{
    
    viewController.hidesBottomBarWhenPushed=YES;
    [self pushViewController:viewController animated:animated];
}

-(UIViewController *)popVC:(BOOL)animated{
    
    return [self popViewControllerAnimated:animated];
}


@end
