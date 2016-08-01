//
//  ViewController.m
//  MyAppTools
//
//  Created by 周鹏翔 on 16/7/26.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "MessageViewController.h"
#import "UIView+AnimationsListViewController.h"
#import "UIView+SetRect.h"
#import "UIView+GlowView.h"
#import "UITableView+CellClass.h"
#import "LineBackgroundView.h"
#import "GCD.h"
#import "PushAnimator.h"
#import "PopAnimator.h"
#import "UIFont+Fonts.h"
//#import "ButtonPressViewController.h"
#import "TransformFadeViewController.h"
#import "StrokeCircleLayerConfigure.h"
#import "ScrollBlurImageViewController.h"
#import "LiveImageViewController.h"
#import "UINavigationController+Push_Pop.h"
#import "OffsetCellViewController.h"


@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIView * titleView;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSouceArrs;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
//    [self configureTitleView];
    [self addviews];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addviews{
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    //    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.view addSubview:_tableView];
    
}





- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //    return self.dataSouceArrs.count;
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *cellID = @"cell";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text=@"1111";
    
    return cell;
}
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = (UITableViewCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    
    
    OffsetCellViewController  * button=[[OffsetCellViewController alloc]init];
    button.title=@"周鹏翔";
    [self.navigationController pushVC :button animated:YES];
}


-(void)viewDidLayoutSubviews {
    
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}



-(NSMutableArray *)dataSouceArrs{
    if (_dataSouceArrs==nil) {
        _dataSouceArrs=[NSMutableArray array];
    }
    return _dataSouceArrs;
}





- (void)configureTitleView {
    
    
    
    LineBackgroundView *lineBackgroundView = [LineBackgroundView createViewWithFrame:CGRectMake(-(self.view.width/2), -64/2, self.view.width, 64) lineWidth:4 lineGap:4
                                                                           lineColor:[[UIColor blackColor] colorWithAlphaComponent:0.015]];
    [self.titleView addSubview:lineBackgroundView];
    
    //    UIVisualEffectView* effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    //    effectView.userInteractionEnabled = NO;
    //    effectView.frame                  = lineBackgroundView.frame;
    //    effectView.userInteractionEnabled = YES;
    //    [self.titleView addSubview:effectView];
    
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

-(UIView *)titleView{
    
    if (_titleView==nil) {
        _titleView=[[UIView alloc]init];
    }
    return _titleView;
}
@end
