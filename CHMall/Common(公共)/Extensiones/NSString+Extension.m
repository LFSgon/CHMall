//
//  NSString+Extension.m
//  GongDan
//
//  Created by 了凡 on 16/1/14.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "NSString+Extension.h"
#import "CommonCrypto/CommonDigest.h"

@implementation NSString (Extension)

#pragma mark - 计算字符串大小

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT];
}
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary * describe = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:describe context:nil].size;
}


#pragma mark - 32位MD5加密方式
+ (NSString *)md5_32Bit:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

//获取路径
+ (NSString* )getFilePath:(NSString* )filePath
{
    //filePath = chatscache/1/chat.plist
    //通过拆分得到一个个路径
    NSArray* array = [filePath componentsSeparatedByString:@"/"];
    NSString* fileName = [array lastObject];
    //找到chat.plist在这个chatscache/1/chat.plist字符串的位置
    NSRange range = [filePath rangeOfString:fileName];
    //根据位置range把这个位置的字符替换掉
    filePath = [filePath stringByReplacingCharactersInRange:range withString:@""];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        if ([[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil]) {
            NSLog(@"成功");
        }
    }
    
    filePath = [filePath stringByAppendingString:fileName];
    return filePath;
}
//获取文件大小
+ (float)getFileSizeWithPath:(NSString* )filePath
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        //不存在，直接返回0
        return 0;
    }
    
    //array放的是这个路径下的所有子路径
    NSArray* array = [[NSFileManager defaultManager] subpathsAtPath:filePath];
    //把一个array转化为枚举(取一个，少一个)
    NSEnumerator* enumerator = [array objectEnumerator];
    
    float length = 0;
    NSString* path = [enumerator nextObject];
    while (path) {
        NSString* subFilePath = [NSString stringWithFormat:@"%@/%@",filePath,path];
        length = length + [[[[NSFileManager defaultManager] attributesOfItemAtPath:subFilePath error:nil] objectForKey:NSFileSize] floatValue];
        //再次取出下一个
        path = [enumerator nextObject];
    }
    return length / (1000.0*1000.0);
}





@end
