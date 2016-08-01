//
//  NSString+ZPX.h
//  dddddddd
//
//  Created by 周鹏翔 on 15/8/24.
//  Copyright (c) 2015年 周鹏翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZPX)
//检查字符串是否为空
-(BOOL)isBlank;

//检查字符串是否为 空 或者 nil
-(BOOL)isValid;

// 去除字符串中空格
- (NSString *)removeWhiteSpacesFromString;


//检测字符串字符个数
- (NSUInteger)countNumberOfWords;

// If string contains substring
- (BOOL)containsString:(NSString *)subString;

// If my string starts with given string
- (BOOL)isBeginsWith:(NSString *)string;

// If my string ends with given string
- (BOOL)isEndssWith:(NSString *)string;

// Replace particular characters in my string with new character
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;


// Get Substring from particular location to given lenght
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;


- (NSString *)addString:(NSString *)string;
- (NSString *)removeSubString:(NSString *)subString;

- (BOOL)containsOnlyLetters;
- (BOOL)containsOnlyNumbers;
- (BOOL)containsOnlyNumbersAndLetters;
- (BOOL)isInThisarray:(NSArray*)array;

+ (NSString *)getStringFromArray:(NSArray *)array;
- (NSArray *)getArray;

+ (NSString *)getMyApplicationVersion;
+ (NSString *)getMyApplicationName;

- (NSData *)convertToData;
+ (NSString *)getStringFromData:(NSData *)data;

- (BOOL)isValidEmail;
- (BOOL)isVAlidPhoneNumber;
-(BOOL)checkPassword;
- (BOOL)isValidUrl;


- (NSNumber*)stringToNSNumber;
- (BOOL)isEmpty;
- (BOOL)stringContainsSubString:(NSString *)subString;
- (NSString *)stringByReplacingStringsFromDictionary:(NSDictionary *)dict;





















@end
