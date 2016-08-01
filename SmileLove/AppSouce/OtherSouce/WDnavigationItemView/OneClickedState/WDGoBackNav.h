//
//  WDGoBackNav.h
//  WuDaoForOrganiza
//
//  Created by hgh on 16/1/13.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WDGoBackNav : UIView
{
    
}

@property(nonatomic,copy)void(^mGoBackBlock)(void);

-(id) initWithFrame:(CGRect)frame;
-(id) initWithFrame:(CGRect)frame WithImage:(UIImage*)_img;
-(id) initWithFrame:(CGRect)frame WithText:(NSString*)_text;

-(void) modifyText:(NSString*)_text;

-(NSString*) text;


@end
