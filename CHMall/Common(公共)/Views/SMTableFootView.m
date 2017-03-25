//
//  SMTableFootView.m
//  ShuoShuo
//
//  Created by 了凡 on 16/5/16.
//  Copyright © 2016年 sanmi. All rights reserved.
//

#import "SMTableFootView.h"

@implementation SMTableFootView

+ (instancetype)footViewWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    SMTableFootView * footView =[SMTableFootView new];
    footView.backgroundColor =[UIColor clearColor];
    UIButton * dredgeBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [dredgeBtn setRadius:6.f];
//    [dredgeBtn setBackgroundColor:kOrangeColor];
    [dredgeBtn setTintColor:[UIColor whiteColor]];
    [dredgeBtn setTitle:title forState:UIControlStateNormal];
    dredgeBtn.titleLabel.font =[UIFont systemFontOfSize:14];
    [dredgeBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:dredgeBtn];
    dredgeBtn.sd_layout
    .leftSpaceToView(footView,16)
    .rightSpaceToView(footView,16)
    .heightIs(40)
    .centerYEqualToView(footView);
    return footView;
}
@end
