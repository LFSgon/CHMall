//
//  NSString+Extension.h
//  GongDan
//
//  Created by 了凡 on 16/1/14.
//  Copyright © 2016年 河北广联. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

+ (NSString *)md5_32Bit:(NSString *)str;

//获取路径
+ (NSString* )getFilePath:(NSString* )filePath;
//获取文件大小
+ (float)getFileSizeWithPath:(NSString* )filePath;

@end
