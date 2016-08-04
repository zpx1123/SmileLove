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
    
    //替换掉leftBarButtonItem
    if (viewController.navigationItem.leftBarButtonItem == nil && [self.viewControllers count] > 1) {
        
        viewController.navigationItem.leftBarButtonItem =[self customLeftBackButton];
    }
}
//#pragma mark - 重载父类进行改写
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    
//    //先进入子Controller
//    [super pushViewController:viewController animated:animated];
//    
//    //替换掉leftBarButtonItem
//    if (viewController.navigationItem.leftBarButtonItem == nil && [self.viewControllers count] > 1) {
//        
//        viewController.navigationItem.leftBarButtonItem =[self customLeftBackButton];
//    }
//}

- (UIBarButtonItem *)customLeftBackButton {
    
    UIImage *image       = [UIImage imageNamed:@"NodeModelViewControllerBack_black"];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    [backButton setBackgroundImage:image forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}
- (void)popSelf {
    
    [self popViewControllerAnimated:YES];
}
-(UIViewController *)popVC:(BOOL)animated{
    
    return [self popViewControllerAnimated:animated];
}


@end
