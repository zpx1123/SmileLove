//
//  WebViewController.h
//  WuDaoForOrganiza
//
//  Created by 周鹏翔 on 16/1/19.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

-(id)initWithUrl:(NSString *)url;
- (void)loadWebViewUrl:(NSString *)strUrl;
@property(nonatomic,strong)NSString * NavTitle;
@end
