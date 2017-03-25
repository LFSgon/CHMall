//
//  LFLoadImageTool.m
//  HFCBuyer
//
//  Created by 了凡 on 2016/11/6.
//  Copyright © 2016年 ZTB. All rights reserved.
//

#import "LFLoadImageTool.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation LFLoadImageTool

+ (void)loadPicWithView:(UIImageView *)imageView url:(NSString *)url placeholderImage:(NSString *)placeholder{
    if (url.length == 0 || [url isEqualToString:@"null"] || [url isEqual:[NSNull class]]) {
        return;
    }
    NSString * urlstr = nil;
    if ([url hasPrefix:@"htt"]) {
        urlstr = url;
    }else{
        urlstr = [NSString stringWithFormat:@"%@/%@",tHost_URL,url];
    }
    DLog(@"picurl:%@",urlstr);
    [imageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    imageView.contentMode =  UIViewContentModeScaleAspectFit;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    imageView.clipsToBounds  = YES;
    UIImage * placeholderImage = nil;
    if (placeholder.length) {
        placeholderImage = [UIImage imageNamed:placeholder];
    }
    DLog(@"%@",NSHomeDirectory());
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:placeholderImage options:SDWebImageRetryFailed | SDWebImageRefreshCached];
}
+ (void)loadPicWithView:(UIImageView *)imageView url:(NSString *)url{
    [self loadPicWithView:imageView url:url placeholderImage:nil];
}
@end
