//
//  NSDate+Extension.h
//  GDXT
//
//  Created by 了凡 on 16/2/14.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为明天
 */
- (BOOL)isTomorrow;
/**
 *  是否为后天
 */
- (BOOL)isAfterTomorrow;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;

/**
 *获取当前时间
 */
+ (NSString *)currentTime;
+ (NSDate *)hyb_toDateWithTimeStamp:(NSString *)timeStamp;
+ (NSDate *)stringTimestampToDate:(NSString *)sdateStr;
@end
