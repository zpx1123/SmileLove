//
//  GlobleConfig.h
//  MicroBusinessBank
//
//  Created by 周鹏翔 on 16/4/28.
//  Copyright © 2016年 周鹏翔. All rights reserved.
//

#ifndef GlobleConfig_h
#define GlobleConfig_h


#define BaiduMapKey  @"lLj6Gjn6PApDcYksSFpHWNS8YXcrAdI1"
#define PushAppKey  @"655b0f843ccd213babd8f55e";
#define PushChannel  @"Publish channel";

//开发库
#define ImageUrlHeadPath @"http://192.168.1.192:8080"

//外网库
//#define ImageUrlHeadPath @"http://112.26.168.118:8090"

//测试库
//#define ImageUrlHeadPath @"http://192.168.1.192:9080"


#define PushIsProduction  FALSE;

/*!
 *  当前屏幕尺寸
 */
#define __SCREEN_SIZE [[UIScreen mainScreen] bounds].size
/*!
 *  系统版本号
 */
#define __IPHONE_OS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
/*!
 *  先的坐标
 */
#define xian            CLLocationCoordinate2DMake(34.2239390000,108.9807190000)//数据来源http://www.gpsspg.com/maps.htm
#define changQY         CLLocationCoordinate2DMake(39.9183390000,116.4026860000)//39.9183390000,116.4026860000
#define TianAnM         CLLocationCoordinate2DMake(39.9151220000,116.4040780000)

#ifdef DEBUG
#define KHLog(...) NSLog(__VA_ARGS__)
#else
#define KHLog(...)
#endif

#define NAGBAR_HIGHT                64.0
#define SCREEN_WIDTH                [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT               [UIScreen mainScreen].bounds.size.height

#define TEXT_COLOR_DARK             [UIColor colorWithRed:91.0/255.0 green:91.0/255.0 blue:91.0/255.0 alpha:1.0]

#define TEXT_COLOR_LIGHT             [UIColor colorWithRed:144.0/255.0 green:144.0/255.0 blue:144.0/255.0 alpha:1.0]

#define LINT_COLOR                  [UIColor colorWithRed:200.0/255.0 green:199.0/255.0 blue:204.0/255.0 alpha:1.0]

#define BCK_COLOR                  [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1.0]

//#define THEME_COLOR                  [UIColor colorWithRed:140.0/255.0 green:23.0/255.0 blue:66.0/255.0 alpha:1.0]

//导航栏颜色
#define THEME_COLOR                  [UIColor colorWithRed:231.0/255.0 green:57.0/255.0 blue:122.0/255.0 alpha:1.0]


#define  BGCOLOR  [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1];

#endif /* GlobleConfig_h */
