//
//  UINavigationController+Extension.m
//  GDXT
//
//  Created by 了凡 on 16/2/5.
//  Copyright © 2016年 河北广联. All rights reserved.
//

#import "UINavigationController+Extension.h"

@implementation UINavigationController (Extension)

- (void) transitionWithType:(AnimationType) animationType  WithSubtype:(NSString *) subtype{
    NSString * type = nil;
    switch (animationType) {
        case Fade:
            type = kCATransitionFade;
            break;
        case Push:
            type = kCATransitionPush;
            break;
        case Reveal:
            type = kCATransitionReveal;
            break;
        case MoveIn:
            type = kCATransitionMoveIn;
            break;
        case Cube:
            type = @"cube";
            break;
        case SuckEffect:
            type = @"suckEffect";
            break;
        case OglFlip:
            type = @"oglFlip";
            break;
        case RippleEffect:
            type = @"rippleEffect";
            break;
        case PageCurl:
            type = @"pageCurl";
            break;
        case PageUnCurl:
            type = @"pageUnCurl";
            break;
        case CameraIrisHollowOpen:
            type = @"cameraIrisHollowOpen";
            break;
        case CameraIrisHollowClose:
            type = @"cameraIrisHollowClose";
            break;
        default:
            break;
    }
    
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = kPUSH_ANIMATION_DURATION;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [self.view.layer addAnimation:animation forKey:@"animation"];
}
@end
