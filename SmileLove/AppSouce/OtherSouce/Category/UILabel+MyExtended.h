//
//  UILabel+MyExtended.h
//  MEIKU
//
//  Created by shifenglei on 15/10/28.
//  Copyright (c) 2015年 Mrrck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MyExtended)
/**
 *拓展 字体颜色 字体大小 字体位置
 */
-(void)getWithTextColor:(UIColor*)color font:(NSInteger)font TextAlignment:(NSTextAlignment)textAlignment  text:(NSString*)text;
/**
 *  拓展 根据内容布局label大小
 */
- (CGSize)sizeWithText:(NSString *)str font:(NSInteger)font maxSize:(CGSize)maxSize;

-(CGSize)getSizeViewforText:(NSString *)str fontSize:(CGFloat)font;

- (CGSize)sizeWithString:(NSString*)str font:(UIFont*)font width:(CGFloat)width;


@end
