//
//  WDFileManage.m
//  FileManage
//
//  Created by 周鹏翔 on 15/12/24.
//  Copyright © 2015年 周鹏翔. All rights reserved.
//



#import "WDFileManage.h"

@implementation WDFileManage

//获取Documents目录
+(NSString *)getDocumentPath
{
//    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"getDocumentPath: %@",documentsDirectory);
    return documentsDirectory;
}
//获取Library目录
+(NSString *)getLibraryPath{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSLog(@"getLibraryPath: %@",libraryDirectory);
    return libraryDirectory;
}

//获取Cache目录
+(NSString *)getCachePath{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    NSLog(@"app_home_lib_cache: %@",cachePath);
    return cachePath;
}

//获取Tmp目录
+(NSString *)getTmpPath{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSString *tmpDirectory = NSTemporaryDirectory();
    NSLog(@"app_home_tmp: %@",tmpDirectory);
    return tmpDirectory;
}

//创建目录
+(NSString *)creatDirectoryType:(fileType)fileType fileName:(NSString *)name{
    
    NSString *pathstr= [[self class] getPathDirectoryType:fileType];
    pathstr = [pathstr stringByAppendingPathComponent:name];
   
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSError *error;
    if(![fileManager fileExistsAtPath:pathstr])
    {
        [fileManager createDirectoryAtPath:pathstr withIntermediateDirectories:YES attributes:nil error:&error];
        if(!error)
        {
            NSLog(@"%@",[error description]);
            
        }
    }
    return pathstr;
}
/**
 *  获取目录地址
 */
+(NSString *)getPathDirectoryType:(fileType)fileType{
    
    NSString *pathstr=[[self class]getDocumentPath];
    
    switch (fileType) {
        case Video:
            return [pathstr stringByAppendingPathComponent:VideoCacheDocument];
            
            break;
            
        case Audio:
            return [pathstr stringByAppendingPathComponent:AudioCacheDocument];
            
            break;
        case Image:
            return [pathstr stringByAppendingPathComponent:ImageCacheDocument];
            
            break;
        case File:
            return [pathstr stringByAppendingPathComponent:FileCacheDocument];
            
            break;
        default:
            break;
    }
    
}
/**
 *  删除目录下单一文件
 */
+(BOOL)deleteDirectoryType:(fileType)fileType fileName:(NSString *)name{
    
    NSString *pathstr= [[self class] getPathDirectoryType:fileType];
    pathstr = [pathstr stringByAppendingPathComponent:name];
    if ([[self class] isExistFile:pathstr]) {
        
        return [[NSFileManager defaultManager] removeItemAtPath:pathstr error:nil];
        
    }else{
        
        return NO;
    }
    
}

/**
 *  删除整个目录
 */
+(BOOL)deleteAllDirectoryType:(fileType)fileType{
    
     NSString *pathstr= [[self class] getPathDirectoryType:fileType];
    if ([[self class] isExistFile:pathstr]) {
        
        return [[NSFileManager defaultManager] removeItemAtPath:pathstr error:nil];
        
    }else{
        
        return NO;
    }
    
}

/**
 *  获取一组文件大小
 *
 *  @param patharr 文件列表目录地址
 *
 *  @return 返回listdic
 */
+(NSMutableArray *)getAllFinishFilesListWithPatharr:(NSArray *)patharr {

    NSMutableArray *finishlist = [[NSMutableArray alloc]init];
    for (NSString *pathstr in patharr) {
        NSFileManager *fileManager=[NSFileManager defaultManager];
        if( ![fileManager fileExistsAtPath:pathstr]){
            break;
        }
        NSError *error;
        NSArray *filelist=[fileManager contentsOfDirectoryAtPath:pathstr error:&error];
        if(!error)
        {
            NSLog(@"%@",[error description]);

        }
        if (filelist ==nil) {
            break;
        }
        for(NSString *fileName in filelist)
        {
            
             NSMutableDictionary * listDic=[NSMutableDictionary dictionary];
            listDic[@"fileName"] = fileName;
            listDic[@"targetPath"] = [pathstr stringByAppendingPathComponent:fileName];
            
            //根据文件名获取文件的大小
            NSInteger length=[[fileManager contentsAtPath:[pathstr stringByAppendingPathComponent:fileName]] length];
            
            listDic[@"fileSize"] = [[self class] getFileSizeString:[NSString stringWithFormat:@"%ld",(long)length]];
            
         

            [finishlist addObject:listDic];

        }
    }
    return finishlist;
}
//文件大小转size
+(NSString *)getFileSizeString:(NSString *)size
{
    if([size floatValue]>=1024*1024)//大于1M，则转化成M单位的字符串
    {
        return [NSString stringWithFormat:@"%1.2fM",[size floatValue]/1024/1024];
    }
    else if([size floatValue]>=1024&&[size floatValue]<1024*1024) //不到1M,但是超过了1KB，则转化成KB单位
    {
        return [NSString stringWithFormat:@"%1.2fK",[size floatValue]/1024];
    }
    else//剩下的都是小于1K的，则转化成B单位
    {
        return [NSString stringWithFormat:@"%1.2fB",[size floatValue]];
    }
}


/**
 *  文件是否存在
 *
 *  @param fileName 文件名
 *
 *  @return 返回bool
 */
+(BOOL)isExistFile:(NSString *)fileName
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:fileName];
}


/**
 *  获取莫个目录下所有文件
 */
- (NSArray*) allFilesAtPath:(NSString*) dirString {
    
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:10];
    
    NSFileManager* fileMgr = [NSFileManager defaultManager];
    
    NSArray* tempArray = [fileMgr contentsOfDirectoryAtPath:dirString error:nil];
    
    for (NSString* fileName in tempArray) {
        
        BOOL flag = YES;
        
        NSString* fullPath = [dirString stringByAppendingPathComponent:fileName];
        
        if ([fileMgr fileExistsAtPath:fullPath isDirectory:&flag]) {
            
            if (!flag) {
                
                [array addObject:fullPath];
                
            }
            
        }
        
    }
    
    return array;
    
}



/**
 *  获取磁盘可用空间
 *
 *  @return 返回剩余空间大小
 */
+(NSString *)getDiskSpaceInfo{

    uint64_t totalSpace = 0.0f;
    uint64_t totalFreeSpace = 0.0f;
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];

    if (dictionary)
    {
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        totalSpace = [fileSystemSizeInBytes floatValue];
        totalFreeSpace = [freeFileSystemSizeInBytes floatValue];
    }else
        return nil;

    NSString *infostr = [NSString stringWithFormat:@"%.2f GB 可用/总共 %.2f GB", ((totalFreeSpace/1024.0f)/1024.0f)/1024.0f, ((totalSpace/1024.0f)/1024.0f)/1024.0f];
    return infostr;

}

//返回进度百分比
+(float)getProgress:(float)totalSize currentSize:(float)currentSize
{
    return currentSize/totalSize;
}


///**
// *  获取音乐时长
// */
//-(NSString *)getMusicDurationAtPath:(NSString *)name fileType:(NSString *)type {
//    
//    
//    NSURL * url=[NSURL fileURLWithPath:[self fullPathByMusicName:name fileType:type]];
//    AVAudioPlayer *audioTime=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
//    NSLog(@"%f",audioTime.duration ) ;
//    
//    float musicTime=audioTime.duration;
//    audioTime=nil;
//    
//    NSString * timeString=[NSString stringWithFormat:@"%@%@",@"时长:",[self dateFromMillisecond:musicTime]];
//    
//    return timeString;
//    
//}
//-(NSString*) dateFromMillisecond:(float) _millisecond
//{
//    
//    
//    long long duration = _millisecond;
//    long long positiveDuration = llabs(duration);
//    if (positiveDuration > 3600)
//        return [NSString stringWithFormat:@"%s%01ld:%02ld:%02ld",
//                duration < 0 ? "-" : "",
//                (long) (positiveDuration / 3600),
//                (long)((positiveDuration / 60) % 60),
//                (long) (positiveDuration % 60)];
//    else
//        return [NSString stringWithFormat:@"%s%02ld:%02ld",
//                duration < 0 ? "-" : "",
//                (long)((positiveDuration / 60) % 60),
//                (long) (positiveDuration % 60)];
//    
//    
//}


@end
