//
//  ViewController.m
//  SmileLove
//
//  Created by 周鹏翔 on 16/7/14.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "ViewController.h"

#import "DiscoverViewController.h"
#import "MessageViewController.h"
#import "MyViewController.h"
#import "HomeViewController.h"
#import "MainViewController.h"
#import "UILabel+FontChange.h"

@interface ViewController ()

@property(nonatomic,strong)UITabBarController * tabBar;


@property(nonatomic,strong)DiscoverViewController * discoverViewController;
@property(nonatomic,strong)MessageViewController * messageViewController;
@property(nonatomic,strong)MyViewController * myViewController;
@property(nonatomic,strong)HomeViewController * homeViewController;
@property(nonatomic,strong)MainViewController * mainViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITabBar appearance].translucent=false;
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"02.jpg"]];
    
    [self addTabBar:self.homeViewController title:@"首页" image:[UIImage imageNamed:@"tabbar_home"] selecedImage:[UIImage imageNamed:@"tabbar_home_sel"] badgeValue:nil];
    
    [self addTabBar:self.discoverViewController title:@"发现" image: [UIImage imageNamed:@"tabbar_discover"] selecedImage:[UIImage imageNamed:@"tabbar_discover_sel"] badgeValue:nil];
    
//    [self addTabBar:self.mainViewController title:@"" image:[UIImage imageNamed:@"tabbar_show"] selecedImage:[UIImage imageNamed:@"tabbar_show"] badgeValue:nil];
    
    [self addTabBar:self.messageViewController title:@"消息" image:[UIImage imageNamed:@"tabbar_message"] selecedImage:[UIImage imageNamed:@"tabbar_message_sel"] badgeValue:nil];
    
    
    [self addTabBar:self.myViewController title:@"我的" image:[UIImage imageNamed:@"tabbar_profile"]
     
     
     
     
     
     
     
     
       selecedImage:[UIImage imageNamed:@"tabbar_profile_sel"] badgeValue:nil];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)addTabBar:(UIViewController *)viewController title:(NSString * )title image:(UIImage *)image selecedImage:(UIImage *)selecedImage badgeValue:(NSString *)value{
    
    
    
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selecedImage = [selecedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    viewController.tabBarItem.title=title;
    viewController.title=title;
    
    viewController.tabBarItem.image=image;
    
    viewController.tabBarItem.selectedImage=selecedImage;
    viewController.tabBarItem.badgeValue=value;
    
//    UIEdgeInsets insets = UIEdgeInsetsMake(10, 0, -10, 0);
//    viewController.tabBarItem.imageInsets=insets;
    
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:viewController];
    [self.tabBar addChildViewController:nav];
    
    [self.view addSubview:self.tabBar.view];
    

  
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"BigYoungMediumGB2.0" size:11.0f],
                                                        NSForegroundColorAttributeName : [UIColor colorWithRed:.5 green:.5 blue:.5 alpha:1]
                                                        } forState:UIControlStateNormal];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"BigYoungMediumGB2.0" size:11.0f],
                                                        NSForegroundColorAttributeName : [UIColor colorWithRed:250.0/255.0 green:60.0/255.0 blue:67.0/255.0  alpha:1]
                                                        } forState:UIControlStateSelected];
    
}


-(UIStatusBarStyle)preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;
}


-(UITabBarController *)tabBar{
    
    if (_tabBar==nil) {
        _tabBar =[[UITabBarController alloc]init];
        
    }
    return _tabBar;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(DiscoverViewController *)discoverViewController{
    if (_discoverViewController==nil) {
        _discoverViewController=[[DiscoverViewController alloc]init];
    }
    return _discoverViewController;
}
-(HomeViewController *)homeViewController{
    if (_homeViewController==nil) {
        _homeViewController=[[HomeViewController alloc]init];
    }
    return _homeViewController;
}

-(MainViewController *)mainViewController{
    if (_mainViewController==nil) {
        _mainViewController=[[MainViewController alloc]init];
    }
    return _mainViewController;
}

-(MyViewController *)myViewController{
    if (_myViewController==nil) {
        _myViewController=[[MyViewController alloc]init];
    }
    return _myViewController;
}

-(MessageViewController *)messageViewController{
    if (_messageViewController==nil) {
        _messageViewController=[[MessageViewController alloc]init];
    }
    return _messageViewController;
}

@end
