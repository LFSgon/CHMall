//
//  UIDefine.m
//  showjianghu
//
//  Created by 了凡 on 16/2/29.
//  Copyright © 2016年 潘多拉. All rights reserved.
//

#import "UIDefine.h"

@implementation UIDefine

float GDDeviceSystemVersion(){
    static float version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.floatValue;
        NSLog(@"version:%f",version);
    });
    return version;
}

CGSize GDDeviceScreenSize(){
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height <= size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}


@end
