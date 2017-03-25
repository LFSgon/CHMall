//
//  UIImage+Extension.h
//  GongDan
//
//  Created by 了凡 on 16/1/14.
//  Copyright © 2016年 河北广联. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum  {
    topToBottom = 0,//从上到下
    leftToRight = 1,//从左到右
    upleftTolowRight = 2,//左上到右下
    uprightTolowLeft = 3,//右上到左下
}GradientType;
@interface UIImage (Extension)

+ (UIImage*) imageWithName:(NSString *) imageName;
+ (UIImage*) resizableImageWithName:(NSString *)imageName;
//  修改iamge尺寸
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)newsize;
//  从URL获取图片
+ (UIImage*) getImageWithURL:(NSString *)url;
+(UIImage*)getSubImage:(UIImage *)image mCGRect:(CGRect)mCGRect centerBool:(BOOL)centerBool;

/*
 *绘制蒙板
 */
+(UIImage*)getGradientImageWithSize:(CGSize)size fromColors:(NSArray*)colors ByGradientType:(GradientType)gradientType;

@end
