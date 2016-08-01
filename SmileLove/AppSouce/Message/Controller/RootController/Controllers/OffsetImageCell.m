//
//  OffsetImageCell.m
//  Animations
//
//  Created by YouXianMing on 16/4/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "OffsetImageCell.h"
#import "UIView+SetRect.h"
#import "WanDouJiaModel.h"
#import "LineBackgroundView.h"
#import "UIFont+Fonts.h"
#import <YYKit/UIImageView+YYWebImage.h>
@interface OffsetImageCell ()

@property (nonatomic, strong) UIImageView *pictureView;
@property (nonatomic, strong) UILabel     *infoLabel;

@end

@implementation OffsetImageCell

- (void)setupCell {
    
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor blackColor];
}

- (void)buildSubview {
    
    self.clipsToBounds           = YES;
    self.pictureView             = [[UIImageView alloc]initWithFrame:CGRectMake(0, -(Height / 1.7 - 250) / 2, Width, Height / 1.7)];
    self.pictureView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.pictureView];
    
    UIView *blackView         = [[UIView alloc] initWithFrame:CGRectMake(0, 250 - 30, Width, 30)];
    blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    [self addSubview:blackView];
    
    LineBackgroundView *lineBackgroundView = [LineBackgroundView createViewWithFrame:blackView.frame
                                                                           lineWidth:4 lineGap:4
                                                                           lineColor:[[UIColor blackColor] colorWithAlphaComponent:0.1f]];
    [self addSubview:lineBackgroundView];
    
    {
        UIView *lineView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 0.5f)];
        lineView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5f];
        lineView.bottom          = lineBackgroundView.top;
        [self addSubview:lineView];
    }

    {
        UIView *lineView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 0.5f)];
        lineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        lineView.bottom          = lineBackgroundView.bottom;
        [self addSubview:lineView];
    }
    
    self.infoLabel               = [[UILabel alloc] initWithFrame:lineBackgroundView.frame];
    self.infoLabel.width        -= 10;
    self.infoLabel.textColor     = [UIColor whiteColor];
    self.infoLabel.textAlignment = NSTextAlignmentRight;
    self.infoLabel.font = [UIFont HeitiSCWithFontSize:13.f];
    [self addSubview:self.infoLabel];
}

- (void)loadContent {
    
    VideoListModel         *model = self.data;
    __weak OffsetImageCell *wself = self;
    
    self.infoLabel.text = model.title;
    [_pictureView setImageWithURL:[NSURL URLWithString:model.coverForDetail] placeholder:nil options:YYWebImageOptionShowNetworkActivity completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        wself.pictureView.alpha = 0;
        wself.pictureView.image = image;
        
        [UIView animateWithDuration:0.35f animations:^{
            
            wself.pictureView.alpha = 1.f;
        }];
    }];
    
   }

- (void)cancelAnimation {
    
    [self.pictureView.layer removeAllAnimations];
}

- (CGFloat)cellOffset {
    
    CGRect  centerToWindow = [self convertRect:self.bounds toView:self.window];
    CGFloat centerY        = CGRectGetMidY(centerToWindow);
    CGPoint windowCenter   = self.superview.center;
    
    CGFloat cellOffsetY = centerY - windowCenter.y;
    
    CGFloat offsetDig =  cellOffsetY / self.superview.frame.size.height * 2;
    CGFloat offset    =  -offsetDig * (Height / 1.7 - 250) / 2;
    
    CGAffineTransform transY   = CGAffineTransformMakeTranslation(0, offset);
    self.pictureView.transform = transY;
    
    return offset;
}

@end
