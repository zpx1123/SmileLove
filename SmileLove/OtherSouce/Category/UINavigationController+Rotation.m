//
//  UINavigationController+Rotation_IOS6.m
//  dddddddd
//
//  Created by 周鹏翔 on 15/8/7.
//  Copyright (c) 2015年 周鹏翔. All rights reserved.
//

#import "UINavigationController+Rotation.h"

@implementation UINavigationController (Rotation)
-(BOOL)shouldAutorotate {
    
    return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations {
   
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {

    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}


@end
