//
//  WDTwoTextNav.h
//  WuDaoForOrganiza
//
//  Created by hgh on 16/1/13.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDTwoTextNav : UIView
{
    
}

@property(nonatomic,copy)void(^mClickedBlock)(NSString*);

-(id) initWithFrame:(CGRect)frame NormalText:(NSString*)_nm PressedText:(NSString*)_p;

-(void) mofifyCurrentText:(NSString*)_t;

-(void) recover;
@end
