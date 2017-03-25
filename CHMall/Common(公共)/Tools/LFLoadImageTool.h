//
//  LFLoadImageTool.h
//  HFCBuyer
//
//  Created by 了凡 on 2016/11/6.
//  Copyright © 2016年 ZTB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFLoadImageTool : NSObject
+ (void)loadPicWithView:(UIImageView *)imageView url:(NSString *)url placeholderImage:(NSString *)placeholder;
+ (void)loadPicWithView:(UIImageView *)imageView url:(NSString *)url;
@end
