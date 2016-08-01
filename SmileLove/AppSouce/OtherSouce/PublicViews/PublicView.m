//
//  PublicView.m
//  TLServicePlatform
//
//  Created by 周鹏翔 on 16/7/5.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import "PublicView.h"
#import "MyLayout.h"
@implementation PublicView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)bindDataSouceForViews:(NSMutableDictionary *)dataSouce{
    
        
        _dataSouceDic=[NSMutableDictionary dictionary];
        _dataSouceDic=dataSouce;
    [self addviews];
}


- (void)addviews {
    

    
  
    //    self.view.backgroundColor=[UIColor whiteColor];
//    self.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1];

    self.backgroundColor=[UIColor clearColor];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self addSubview:scrollView];
    
    MyLinearLayout *headLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    headLayout.backgroundColor=[UIColor blueColor];
    headLayout.myLeftMargin = 10;
    headLayout.myRightMargin = 10;  //同时指定左右边距为0表示宽度和父视图一样宽
    headLayout.topPadding = 10;
    headLayout.myTopMargin=10;
//    headLayout.layer.masksToBounds=YES;
    headLayout.layer.borderColor = [UIColor lightGrayColor].CGColor;
    headLayout.layer.borderWidth = 0.5;
    headLayout.layer.cornerRadius = 8;
    headLayout.gravity = MyMarginGravity_Horz_Fill;
    [scrollView addSubview:headLayout];
    
    
        UILabel *label = [UILabel new];
        label.myLeftMargin=10;
//        label.myBottomMargin=10;
         label.myHeight=30;
        label.font = [UIFont systemFontOfSize:14];
        label.text = [self.dataSouceDic objectForKey:@"headTitle"];
        label.textColor=[UIColor whiteColor];
        label.backgroundColor=[UIColor blueColor];
        [headLayout addSubview:label];
//        label.hidden=YES;
    
    MyFloatLayout *bottomfloatLayout = [[MyFloatLayout alloc] initWithOrientation:MyLayoutViewOrientation_Vert];
    bottomfloatLayout.myLeftMargin = bottomfloatLayout.myRightMargin = 0;  //宽度和滚动条视图保持一致。
    bottomfloatLayout.wrapContentHeight = YES;
    bottomfloatLayout.subviewHorzMargin = 5;
    bottomfloatLayout.subviewVertMargin = 10;
    bottomfloatLayout.leftPadding = 10;
    bottomfloatLayout.rightPadding = 10;
    bottomfloatLayout.bottomPadding = 10;
//    bottomfloatLayout.topPadding = 10;

    
    bottomfloatLayout.myTopMargin=1;
   
    
    bottomfloatLayout.backgroundColor = [UIColor whiteColor];
    [headLayout addSubview:bottomfloatLayout];
    
    NSMutableArray * bottomTitleArrs=[NSMutableArray array];
    bottomTitleArrs=(NSMutableArray *)[self.dataSouceDic objectForKey:@"bottomTitle"];
    
    
    NSMutableArray * bottomDescsArrs=[NSMutableArray array];
    bottomDescsArrs=(NSMutableArray *)[self.dataSouceDic objectForKey:@"bottomDes"];
    
    
    for (NSInteger i = 0; i < bottomTitleArrs.count; i++)
    {
        
        UIView *lineView = [UIView new];
        lineView.widthDime.equalTo(bottomfloatLayout.widthDime);
        lineView.myHeight=1;
        lineView.myBottomMargin=10;
        lineView.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1];
        [bottomfloatLayout addSubview:lineView];
        
        
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = bottomTitleArrs[i];
        titleLabel.clearFloat = YES;
        titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:14];
        titleLabel.widthDime.equalTo(bottomfloatLayout.widthDime).multiply(0.25);
        titleLabel.adjustsFontSizeToFitWidth = YES;
        [titleLabel sizeToFit];
        [bottomfloatLayout addSubview:titleLabel];
        
        UILabel *descLabel = [UILabel new];
        descLabel.text = bottomDescsArrs[i];
//        descLabel.font = [UIFont fontWithName:@"Heiti SC" size:16];
        descLabel.font = [UIFont systemFontOfSize:16];
        descLabel.weight = 1;
        descLabel.numberOfLines = 0;
        descLabel.flexedHeight = YES;
        [descLabel sizeToFit];
        [bottomfloatLayout addSubview:descLabel];
        
        
        
    }
    
}
@end
