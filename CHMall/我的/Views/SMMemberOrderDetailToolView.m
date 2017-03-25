//
//  SMMemberOrderDetailToolView.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberOrderDetailToolView.h"

@interface SMMemberOrderDetailToolView ()
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end
@implementation SMMemberOrderDetailToolView


- (void)awakeFromNib{
    [super awakeFromNib];
    [_leftBtn setMyBorder:colorOf_LineGray borderWidth:0.5];
}
+ (instancetype)shareInstance{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}
- (void)setupBtns:(NSArray *)titles{
    if (titles.count == 1) {
        _leftBtn.hidden = YES;
        [_rightBtn setTitle:titles[0] forState:UIControlStateNormal];
        for (NSString * title in titles) {
            if ([title isEqualToString:@"等待发货"]) {
                _rightBtn.backgroundColor = colorOf_GrayC;
            }
        }
    }else{
        _leftBtn.hidden = NO;
        [_leftBtn setTitle:titles[0] forState:UIControlStateNormal];
        [_rightBtn setTitle:titles[1] forState:UIControlStateNormal];
    }
}
- (void)setOrderType:(MemberOrderType)orderType{
    _orderType = orderType;
    switch (orderType) {
        case orderTypePay:{
            [self setupBtns:@[@"取消订单",@"去付款"]];
        }
            break;
        case orderTypeDeliver:{
            [self setupBtns:@[@"等待发货"]];
        }
            break;
        case orderTypeReceive:{
            [self setupBtns:@[@"确认收货"]];
        }
            break;
        case orderTypeEvaluate:{
            [self setupBtns:@[@"删除订单",@"去评价"]];
        }
            break;
        default:
            break;
    }
}

- (IBAction)btnAction:(UIButton *)sender {
    SMMemberOrderItemFooterViewBtnType btnType = orderItemFooterViewBtnTypeReceive;//确认收货
    NSString * currentTitle = sender.currentTitle;
    if ([currentTitle containsString:@"去付款"]) {
        btnType = orderItemFooterViewBtnTypePay;
    }else if ([currentTitle containsString:@"取消订单"]){
        btnType = orderItemFooterViewBtnTypeCancel;
    }else if ([currentTitle containsString:@"等待发货"]){
        btnType = orderItemFooterViewBtnTypeDeliver;
    }else if ([currentTitle containsString:@"删除订单"]){
        btnType = orderItemFooterViewBtnTypeDelete;
    }else if ([currentTitle containsString:@"去评价"]){
        btnType = orderItemFooterViewBtnTypeEvaluate;
    }
    if (self.btnActionBlock) {
        self.btnActionBlock(btnType);
    }
}
@end
