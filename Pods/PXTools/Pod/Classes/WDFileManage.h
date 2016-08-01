//
//  WDFileManage.h
//  FileManage
//
//  Created by 周鹏翔 on 15/12/24.
//  Copyright © 2015年 周鹏翔. All rights reserved.
//


#define AudioCacheDocument      @"AudioCache"
#define VideoCacheDocument      @"VideoCache"
#define ImageCacheDocument      @"ImageCache"
#define FileCacheDocument       @"FileCache"

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, fileType) {
    
    Video    = 0, //
    Audio    = 1, //
    Image    = 2, //
    File     = 3
    
    
};
@interface WDFileManage : NSObject
/**
 *  获取磁盘空间
 */
+(NSString *)getDiskSpaceInfo;

//返回进度百分比
+(float)getProgress:(float)totalSize currentSize:(float)currentSize;


/**
 *  文件是否存在
 */
+(BOOL)isExistFile:(NSString *)fileName;


/**
 *  创建目录
 */
+(NSString *)creatDirectoryType:(fileType)fileType fileName:(NSString *)name;


/**
 *  获取目录地址
 */
+(NSString *)getPathDirectoryType:(fileType)fileType;

/**
 *  删除目录下单一文件
 */
+(BOOL)deleteDirectoryType:(fileType)fileType fileName:(NSString *)name;

/**
 *  删除整个目录
 */
+(BOOL)deleteAllDirectoryType:(fileType)fileType;


/**
 *  获取一组文件大小
 *
 *  @param patharr 文件列表目录地址
 *
 *  @return 返回listdic
 */
+(NSMutableArray *)getAllFinishFilesListWithPatharr:(NSArray *)patharr;


/**
 *  获取莫个目录下所有文件
 */
- (NSArray*) allFilesAtPath:(NSString*) dirString;

@end
