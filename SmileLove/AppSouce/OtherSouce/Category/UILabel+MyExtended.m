//
//  UILabel+MyExtended.m
//  MEIKU
//
//  Created by shifenglei on 15/10/28.
//  Copyright (c) 2015年 Mrrck. All rights reserved.
//

#import "UILabel+MyExtended.h"

@implementation UILabel (MyExtended)
/**
 *拓展 字体颜色 字体大小 字体位置
 */
-(void)getWithTextColor:(UIColor*)color font:(NSInteger)font TextAlignment:(NSTextAlignment)textAlignment text:(NSString *)text{
    self.textColor=color;
    self.font=[UIFont systemFontOfSize:font];
    self.textAlignment=textAlignment;
    self.text=text;

}
/**
 *拓展 根据内容布局label大小
 */
- (CGSize)sizeWithText:(NSString *)str font:(NSInteger)font maxSize:(CGSize)maxSize
{
    return [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
}

-(CGSize)getSizeViewforText:(NSString *)str fontSize:(CGFloat)font{
    
    return  [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}];
}
- (CGSize)sizeWithString:(NSString*)str font:(UIFont*)font width:(CGFloat)width
{
    NSDictionary* dict = @{ NSFontAttributeName : font };
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}
@end
