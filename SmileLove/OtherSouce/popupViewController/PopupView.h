//
//  PopupView.h
//  UserCardPopupView
//
//  Created by 周鹏翔 on 15/9/15.
//  Copyright (c) 2015年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PopupView : UIView
+ (instancetype)defaultPopupView;
@property (nonatomic, weak)UIViewController *parentVC;

@property (strong, nonatomic) UIImageView *avatarImgView;

@property (strong, nonatomic) UIImageView *topImgView;


@property (strong, nonatomic) UILabel *nameLable;

@property (strong, nonatomic) UILabel *fansLabel;
@property (strong, nonatomic) UILabel *fansNumberLabel;

@property (strong, nonatomic) UILabel *followsLabel;
@property (strong, nonatomic) UILabel *followsNumberLabel;

@property (strong, nonatomic) UILabel *worksLabel;
@property (strong, nonatomic) UILabel *worksNumberLabel;

@property (strong, nonatomic) UIButton *followBtn;


@end
