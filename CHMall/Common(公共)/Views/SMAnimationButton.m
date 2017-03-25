//
//  SMAnimationButton.m
//  XieFei
//
//  Created by 了凡 on 16/6/27.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "SMAnimationButton.h"

@implementation SMAnimationButton

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
       [self animation];
    }
}
/**
 *  开始动画
 */
- (void)animation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    if (self.selected) {
        animation.values = @[@1.5 ,@0.8, @1.0,@1.5,@1.0];
        animation.duration = 0.5;
    }else{
        animation.values = @[@1.5 ,@0.8, @1.0,@1.5,@1.0];
        animation.duration = 0.5;
    }
    animation.calculationMode = kCAAnimationCubic;
    [self.layer addAnimation:animation forKey:@"transform.scale"];
}

@end
