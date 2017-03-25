//
//  XZLegalTool.h
//  showjianghu
//
//  Created by 了凡 on 16/3/1.
//  Copyright © 2016年 潘多拉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZLegalTool : NSObject

+ (BOOL)checkLegalTel:(NSString *)tel;
+ (BOOL)checkLegalEmail:(NSString *)email;
+ (BOOL)checkIDCardNumber:(NSString *)value;
+ (BOOL)checkValidZipcode:(NSString *)value;
@end
