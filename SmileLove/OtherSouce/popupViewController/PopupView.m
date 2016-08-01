//
//  PopupView.m
//  UserCardPopupView
//
//  Created by 周鹏翔 on 15/9/15.
//  Copyright (c) 2015年 周鹏翔. All rights reserved.
//

#import "PopupView.h"
#import "UIViewController+LewPopupViewController.h"
#import "LewPopupViewAnimationFade.h"
#import "LewPopupViewAnimationSlide.h"
#import "LewPopupViewAnimationSpring.h"
#import "LewPopupViewAnimationDrop.h"
#import <UIKit/UIKit.h>
#define TextFont [UIFont systemFontOfSize:14]
#define NameTextFont [UIFont systemFontOfSize:16]

@implementation PopupView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)defaultPopupView{
    return [[PopupView alloc]initWithFrame:CGRectMake(0, 0, 195, 230)];
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        // _topImgView
        if (!_topImgView) {
            UIImageView *imgView = [[UIImageView alloc] init];
            imgView.backgroundColor=[UIColor colorWithRed:225.0/255.0f green:72.0/255.0f blue:118.0/255.0f alpha:1.0];
//            imgView.translatesAutoresizingMaskIntoConstraints=NO;
            [self addSubview:imgView];
            self.topImgView = imgView;
            
        }
        
        // avatarImgView
        if (!_avatarImgView) {
            UIImageView *imgView = [[UIImageView alloc] init];
            imgView.backgroundColor = [UIColor lightGrayColor];
            imgView.layer.cornerRadius = 5.0;
            imgView.layer.masksToBounds = YES;
            imgView.translatesAutoresizingMaskIntoConstraints=NO;
            [self addSubview:imgView];
            self.avatarImgView = imgView;
            
        }

        // _nameLable
        if (!_nameLable) {
            UILabel *aLbl = [[UILabel alloc] init];
            aLbl.translatesAutoresizingMaskIntoConstraints=NO;
            aLbl.numberOfLines = 0;
            aLbl.textAlignment = NSTextAlignmentCenter;
            aLbl.font = [UIFont systemFontOfSize:16];
            aLbl.textColor = [UIColor blackColor];
            aLbl.backgroundColor = [UIColor clearColor];
            [self addSubview:aLbl];
            self.nameLable = aLbl;
        }
        
        // _fansLabel
        if (!_fansLabel) {
            UILabel *aLbl = [[UILabel alloc] init];
            aLbl.translatesAutoresizingMaskIntoConstraints=NO;
            aLbl.numberOfLines = 0;
            aLbl.textAlignment = NSTextAlignmentCenter;
            aLbl.font = [UIFont systemFontOfSize:14];
            aLbl.textColor = [UIColor blackColor];
            aLbl.backgroundColor = [UIColor clearColor];
            [self addSubview:aLbl];
            self.fansLabel = aLbl;
        }
        
        // _followsLabel
        if (!_followsLabel) {
            UILabel *aLbl = [[UILabel alloc] init];
            aLbl.translatesAutoresizingMaskIntoConstraints=NO;
            aLbl.numberOfLines = 0;
            aLbl.textAlignment = NSTextAlignmentCenter;
            aLbl.font = [UIFont systemFontOfSize:14];
            aLbl.textColor = [UIColor blackColor];
            aLbl.backgroundColor = [UIColor clearColor];
            [self addSubview:aLbl];
            self.followsLabel = aLbl;
        }
        
        // _worksLabel
        if (!_worksLabel) {
            UILabel *aLbl = [[UILabel alloc] init];
            aLbl.translatesAutoresizingMaskIntoConstraints=NO;
            aLbl.numberOfLines = 0;
            aLbl.textAlignment = NSTextAlignmentCenter;
            aLbl.font = [UIFont systemFontOfSize:14];
            aLbl.textColor = [UIColor blackColor];
            aLbl.backgroundColor = [UIColor clearColor];
            [self addSubview:aLbl];
            self.worksLabel = aLbl;
        }
    }
    
    
    // _fansNumberLabel
    if (!_fansNumberLabel) {
        UILabel *aLbl = [[UILabel alloc] init];
        aLbl.translatesAutoresizingMaskIntoConstraints=NO;
        aLbl.numberOfLines = 0;
        aLbl.textAlignment = NSTextAlignmentCenter;
        aLbl.font = [UIFont systemFontOfSize:14];
        aLbl.textColor = [UIColor colorWithRed:249/255.0 green:54/255.0 blue:132/255.0 alpha:1];
        aLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:aLbl];
        self.fansNumberLabel = aLbl;
    }
    
    // _followsNumberLabel
    if (!_followsNumberLabel) {
        UILabel *aLbl = [[UILabel alloc] init];
        aLbl.translatesAutoresizingMaskIntoConstraints=NO;
        aLbl.numberOfLines = 0;
        aLbl.textAlignment = NSTextAlignmentCenter;
        aLbl.font = [UIFont systemFontOfSize:14];
        aLbl.textColor = [UIColor colorWithRed:249/255.0 green:54/255.0 blue:132/255.0 alpha:1];
        aLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:aLbl];
        self.followsNumberLabel = aLbl;
    }
    
    // _worksNumberLabel
    if (!_worksNumberLabel) {
        UILabel *aLbl = [[UILabel alloc] init];
        aLbl.translatesAutoresizingMaskIntoConstraints=NO;
        aLbl.numberOfLines = 0;
        aLbl.textAlignment = NSTextAlignmentCenter;
        aLbl.font = [UIFont systemFontOfSize:14];
        aLbl.textColor = [UIColor colorWithRed:249/255.0 green:54/255.0 blue:132/255.0 alpha:1];
        aLbl.backgroundColor = [UIColor clearColor];
        [self addSubview:aLbl];
        self.worksNumberLabel = aLbl;
    }

    if (!_followBtn) {
        
        UIButton * button=[[UIButton alloc]init];
        button.tintColor=[UIColor whiteColor];
        button.backgroundColor=[UIColor colorWithRed:249/255.0 green:54/255.0 blue:132/255.0 alpha:1];
        button.layer.cornerRadius = 5.0;
        button.layer.masksToBounds = YES;
        [button setTitle:@"关注" forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
        
        UIImageView * buttonimg=[[UIImageView alloc]init];
        buttonimg.frame=CGRectMake(48, 2, 25, 25);
        buttonimg.image=[UIImage imageNamed:@"lookup.png"];
        [button addSubview:buttonimg];
        
        [self addSubview:button];
        self.followBtn=button;
        
    }


    self.avatarImgView.image=[UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"user_male" ofType:@"png"]];
    self.nameLable.text=@"舞1娘";
    
    self.fansLabel.text=@"粉丝";
    self.followsLabel.text=@"关注";
    self.worksLabel.text=@"作品";
    
    self.fansNumberLabel.text=@"1000";
    self.followsNumberLabel.text=@"100";
    self.worksNumberLabel.text=@"100";
    
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    
    return self;
    
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.avatarImgView.frame=CGRectMake(self.frame.size.width/2-25, 25, 50, 50);
    self.topImgView.frame=CGRectMake(0, -1, 195, 50);
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.topImgView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5.0, 5.0)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.topImgView.layer.mask = maskLayer;
    
    
    
    
    CGSize nameTextSize = [self sizeWithString:self.nameLable.text font:NameTextFont];
    self.nameLable.frame=CGRectMake(self.frame.size.width/2-nameTextSize.width/2, 80, nameTextSize.width, nameTextSize.height);
    
    
    
    CGSize fansTextSize =[self sizeWithString:self.fansLabel.text font:TextFont];
    self.fansLabel.frame=CGRectMake(20, 150, fansTextSize.width, fansTextSize.height);
    
    CGSize followTextSize = [self sizeWithString:self.followsLabel.text font:TextFont];
    self.followsLabel.frame=CGRectMake(self.frame.size.width/2-followTextSize.width/2, 150, followTextSize.width, followTextSize.height);
    
    CGSize workTextSize = [self sizeWithString:self.worksLabel.text font:TextFont];
    self.worksLabel.frame=CGRectMake(self.frame.size.width-20-workTextSize.width, 150, workTextSize.width, workTextSize.height);
    
    
    
    
    
    CGSize fansNumberTextSize =[self sizeWithString:self.fansNumberLabel.text font:TextFont];
    self.fansNumberLabel.frame=CGRectMake(20, 130, fansNumberTextSize.width, fansNumberTextSize.height);
    
    CGSize followNumberTextSize = [self sizeWithString:self.followsNumberLabel.text font:TextFont];
    self.followsNumberLabel.frame=CGRectMake(self.frame.size.width/2-followNumberTextSize.width/2, 130, followNumberTextSize.width, followNumberTextSize.height);
    
    CGSize workNumberTextSize = [self sizeWithString:self.worksLabel.text font:TextFont];
    self.worksNumberLabel.frame=CGRectMake(self.frame.size.width-20-workNumberTextSize.width, 130, workNumberTextSize.width, workNumberTextSize.height);
    
   
    self.followBtn.frame=CGRectMake(20, 190, 160, 30);
    
    
}

- (CGSize)sizeWithString:(NSString*)str font:(UIFont*)font
{
    NSDictionary* dict = @{ NSFontAttributeName : font };

    CGSize maxSize=CGSizeMake([UIScreen mainScreen].applicationFrame.size.width, MAXFLOAT);
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}



@end
