//
//  UINavigationController+Extension.h
//  GDXT
//
//  Created by 了凡 on 16/2/5.
//  Copyright © 2016年 河北广联. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPUSH_ANIMATION_DURATION 0.5f

typedef NS_ENUM(NSInteger,AnimationType) {
    Fade = 0,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
};
@interface UINavigationController (Extension)

- (void) transitionWithType:(AnimationType) animationType  WithSubtype:(NSString *) subtype;


@end
