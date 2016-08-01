//
//  TransformFadeViewController.m
//  Animations
//
//  Created by YouXianMing on 15/11/17.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "TransformFadeViewController.h"
#import "TranformFadeView.h"
#import "GCD.h"
#import "UIView+AnimationsListViewController.h"
#import "UIView+SetRect.h"
#import "UIView+GlowView.h"
#import "UITableView+CellClass.h"
#import "ListItemCell.h"
#import "LineBackgroundView.h"
#import "Item.h"
#import "GCD.h"
#import "PushAnimator.h"
#import "PopAnimator.h"
#import "UIFont+Fonts.h"
//#import "ButtonPressViewController.h"
#import "TransformFadeViewController.h"
#import "StrokeCircleLayerConfigure.h"

typedef enum : NSUInteger {
    
    kTypeOne,
    kTypeTwo,
    
} EType;

@interface TransformFadeViewController ()

@property (nonatomic, strong) TranformFadeView *tranformFadeViewOne;
@property (nonatomic, strong) TranformFadeView *tranformFadeViewTwo;

@property (nonatomic, strong) GCDTimer *timer;
@property (nonatomic)         EType     type;

@property (nonatomic, strong) NSArray   *images;
@property (nonatomic)         NSInteger  count;
@property(nonatomic,strong)UIView * titleView;
@end

@implementation TransformFadeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureTitleView];
    [self setup];
}

- (void)configureTitleView {
    
    
    
    LineBackgroundView *lineBackgroundView = [LineBackgroundView createViewWithFrame:CGRectMake(-(self.view.width/2), -64/2, self.view.width, 64) lineWidth:4 lineGap:4
                                                                           lineColor:[[UIColor redColor] colorWithAlphaComponent:0.015]];
    [self.titleView addSubview:lineBackgroundView];
    
    // Title label.
    UILabel *headlinelabel          = [UIView animationsListViewControllerNormalHeadLabel];
    UILabel *animationHeadLineLabel = [UIView animationsListViewControllerHeadLabel];
    
    // Title view.
    UIView *titleView             = [[UIView alloc] initWithFrame:CGRectMake(-(self.view.width/2), -64/2, self.view.width, 64)];
    headlinelabel.center          = titleView.middlePoint;
    animationHeadLineLabel.center = titleView.middlePoint;
    [titleView addSubview:headlinelabel];
    [titleView addSubview:animationHeadLineLabel];
    [self.titleView addSubview:titleView];
    
    //    UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, self.view.width, 0.5f)];
    //    line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    //    [titleView addSubview:line];
    
    // Start glow.
    animationHeadLineLabel.glowRadius            = @(2.f);
    animationHeadLineLabel.glowOpacity           = @(1.f);
    animationHeadLineLabel.glowColor             = [[UIColor colorWithRed:0.203  green:0.598  blue:0.859 alpha:1] colorWithAlphaComponent:0.95f];
    
    animationHeadLineLabel.glowDuration          = @(1.f);
    animationHeadLineLabel.hideDuration          = @(3.f);
    animationHeadLineLabel.glowAnimationDuration = @(2.f);
    
    [animationHeadLineLabel createGlowLayer];
    [animationHeadLineLabel insertGlowLayer];
    
    [GCDQueue executeInMainQueue:^{
        
        [animationHeadLineLabel startGlowLoop];
        
    } afterDelaySecs:2.f];
    
    self.navigationItem.titleView=self.titleView;
}
- (void)setup {
    
    //    [super setup];
    
    self.images = @[[UIImage imageNamed:@"5"],
                    [UIImage imageNamed:@"1"],
                    [UIImage imageNamed:@"2"],
                    [UIImage imageNamed:@"3"],
                    [UIImage imageNamed:@"4"]];
    
    // 图片1
    self.tranformFadeViewOne                      = [[TranformFadeView alloc] initWithFrame:self.view.bounds];
    self.tranformFadeViewOne.contentMode          = UIViewContentModeScaleAspectFill;
    self.tranformFadeViewOne.image                = [self currentImage];
    self.tranformFadeViewOne.verticalCount        = 3;
    self.tranformFadeViewOne.horizontalCount      = 12;
    self.tranformFadeViewOne.center               = self.view.center;
    self.tranformFadeViewOne.fadeDuradtion        = 1.f;
    self.tranformFadeViewOne.animationGapDuration = 0.075f;
    [self.tranformFadeViewOne buildMaskView];
    [self.view addSubview:self.tranformFadeViewOne];
    
    // 图片2
    self.tranformFadeViewTwo                      = [[TranformFadeView alloc] initWithFrame:self.view.bounds];
    self.tranformFadeViewTwo.contentMode          = UIViewContentModeScaleAspectFill;
    self.tranformFadeViewTwo.verticalCount        = 3;
    self.tranformFadeViewTwo.horizontalCount      = 12;
    self.tranformFadeViewTwo.center               = self.view.center;
    self.tranformFadeViewTwo.fadeDuradtion        = 1.f;
    self.tranformFadeViewTwo.animationGapDuration = 0.075f;
    [self.tranformFadeViewTwo buildMaskView];
    [self.view addSubview:self.tranformFadeViewTwo];
    [self.tranformFadeViewTwo fadeAnimated:NO];
    
    // timer
    __weak typeof(self) weakSelf = self;
    self.timer = [[GCDTimer alloc] initInQueue:[GCDQueue mainQueue]];
    [self.timer event:^{
        
        [weakSelf timerEvent];
        
    } timeIntervalWithSecs:8 delaySecs:1.f];
    [self.timer start];
}

- (void)timerEvent {
    
    if (self.type == kTypeOne) {
        
        self.type = kTypeTwo;
        
        [self.view sendSubviewToBack:self.tranformFadeViewTwo];
        self.tranformFadeViewTwo.image = [self currentImage];
        [self.tranformFadeViewTwo showAnimated:NO];
        [self.tranformFadeViewOne fadeAnimated:YES];
        
    } else {
        
        self.type = kTypeOne;
        
        [self.view sendSubviewToBack:self.tranformFadeViewOne];
        self.tranformFadeViewOne.image = [self currentImage];
        [self.tranformFadeViewOne showAnimated:NO];
        [self.tranformFadeViewTwo fadeAnimated:YES];
    }
}

- (UIImage *)currentImage {
    
    self.count = ++self.count % self.images.count;
    
    return self.images[self.count];
}
-(UIView *)titleView{
    
    if (_titleView==nil) {
        _titleView=[[UIView alloc]init];
    }
    return _titleView;
}
@end
