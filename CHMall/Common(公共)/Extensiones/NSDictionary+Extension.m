//
//  NSDictionary+Extension.m
//  showjianghu
//
//  Created by 了凡 on 16/4/22.
//  Copyright © 2016年 潘多拉. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    
}

@end
