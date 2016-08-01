//
//  AppDelegate.m
//  TLServicePlatform
//
//  Created by 周鹏翔 on 16/7/4.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UINavigationBar+Awesome.h"
#import "MyLayout.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [MyDimeScale setUITemplateSize:CGSizeMake(375, 667)];
    [self setNavBackgroundColor];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ViewController * MainViewController=[[ViewController alloc]init];
//    UINavigationController * rootNav=[[UINavigationController alloc]initWithRootViewController:MainViewController];
    
    self.window.rootViewController=MainViewController;
    
    
    return YES;
}
//设置系统相关
-(void)setNavBackgroundColor{
    
    
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [UINavigationBar appearance].backIndicatorImage = [UIImage new];
    [[UINavigationBar appearance] lt_setBackgroundColor:[UIColor clearColor]];
    UIColor * color = [UIColor colorWithRed:250.0/255.0 green:60.0/255.0 blue:67.0/255.0 alpha:1];
    [[UINavigationBar appearance] lt_setBackgroundColor:[color colorWithAlphaComponent:0.5]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"BigYoungMediumGB2.0" size:18.0f], NSFontAttributeName, nil]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
   
    
    
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
