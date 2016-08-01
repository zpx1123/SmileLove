//
//  OffsetCellViewController.m
//  Animations
//
//  Created by YouXianMing on 16/4/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "OffsetCellViewController.h"
#import "WanDouJiaModel.h"
#import "OffsetImageCell.h"
//#import "MessageAlertView.h"
#import "OffsetHeaderView.h"
#import "LoadingView.h"
#import "GCD.h"
#import "WDBaseRequest.h"
#import "WDHttpRequest.h"

@interface OffsetCellViewController () < UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView       *tableView;
@property (nonatomic, strong) WanDouJiaModel    *rootModel;
@property (nonatomic, strong) LoadingView       *showLoadingView;

@end

@implementation OffsetCellViewController

- (void)setup {
    
    [super setup];
    
  

    
    
    NSDictionary *params = @{@"num"  : @"5",
                             @"date" : @"20160725",
                             @"vc"   : @"67",
                             @"u"    : @"011f2924aa2cf27aa5dc8066c041fe08116a9a0c",
                             @"v"    : @"1.8.0",
                             @"f"    : @"iphone"};
    
   
   
    NSString * requestUrl=[NSString stringWithFormat:@"http://baobab.wandoujia.com/api/v1/feed"];
    WDBaseRequest * baserequest=[[WDBaseRequest alloc]init];
    
    baserequest.requestUrl=requestUrl;
    baserequest.requestArgument=params;
    baserequest.requestMethod=WDRequestMethodPost;
    baserequest.requestSerializerType=WDRequestSerializerTypeJSON;
    
    [[WDHttpRequest creatNetRequest]startWithRequest:baserequest downloadProgress:nil success:^(WDBaseRequest *request) {
        
        [GCDQueue executeInMainQueue:^{
            
            [self.showLoadingView hide];
            
            CATransition *transition=[[CATransition alloc]init];
            
            //2.设置动画类型,注意对于苹果官方没公开的动画类型只能使用字符串，并没有对应的常量定义
            transition.type=@"rippleEffect";
            
            //设置子类型
            if (/* DISABLES CODE */ (YES)) {
                transition.subtype=kCATransitionFromRight;
            }else{
                transition.subtype=kCATransitionFromLeft;
            }
            //设置动画时常
            transition.duration=0.7f;
            
            self.view.backgroundColor=[UIColor grayColor];
            //3.设置转场后的新视图添加转场动画
            [self.view.layer addAnimation:transition forKey:@"KCTransitionAnimation"];
            
        } afterDelaySecs:0.5f];
        
        
        return ;
        self.rootModel = request.responseJSONObject;
        [self.tableView reloadData];
        
        [UIView animateWithDuration:0.5f animations:^{
            
            self.tableView.alpha = 1.f;
        }];
    } failure:^(WDBaseRequest *request) {
        
        [self.showLoadingView hide];
//        AbsAlertMessageView *alertView   = [[MessageAlertView alloc] init];
//        alertView.message                = @"Network error.";
//        alertView.contentView            = self.loadingView;
//        alertView.autoHiden              = YES;
//        alertView.delayAutoHidenDuration = 2.f;
//        [alertView show];
        
        
    }];
    
        
    self.tableView                     = [[UITableView alloc] initWithFrame:self.contentView.bounds];
    self.tableView.delegate            = self;
    self.tableView.dataSource          = self;
    self.tableView.rowHeight           = 250;
    self.tableView.sectionHeaderHeight = 25.f;
    self.tableView.separatorStyle      = UITableViewCellSeparatorStyleNone;
    self.tableView.alpha               = 0.f;
    
    [self.tableView registerClass:[OffsetImageCell class]  forCellReuseIdentifier:@"OffsetImageCell"];
    [self.tableView registerClass:[OffsetHeaderView class] forHeaderFooterViewReuseIdentifier:@"OffsetHeaderView"];
    [self.contentView addSubview:self.tableView];
    
    self.showLoadingView             = [[LoadingView alloc] init];
    self.showLoadingView.backgroundColor=[UIColor blueColor];
    self.showLoadingView.contentView = self.loadingView;
    [self.showLoadingView show];
}

#pragma mark - UITableView's delegate.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    DailyListModel *dailyModel = self.rootModel.dailyList[section];
    
    return dailyModel.videoList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.rootModel.dailyList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OffsetImageCell"];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(OffsetImageCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    [cell cellOffset];
    
    DailyListModel *dailyModel = self.rootModel.dailyList[indexPath.section];
    VideoListModel *model      = dailyModel.videoList[indexPath.row];
    
    cell.data      = model;
    cell.indexPath = indexPath;
    [cell loadContent];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(OffsetImageCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {

    [cell cancelAnimation];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    DailyListModel *dailyModel = self.rootModel.dailyList[section];
    
    CustomHeaderFooterView *titleView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"OffsetHeaderView"];
    titleView.data                    = dailyModel;
    titleView.section                 = section;
    [titleView loadContent];
    
    return titleView;
}

#pragma mark - UIScrollView's delegate.

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSArray <OffsetImageCell *> *array = [self.tableView visibleCells];
    
    [array enumerateObjectsUsingBlock:^(OffsetImageCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj cellOffset];
    }];
}

#pragma mark - Networking's delegate.



@end
