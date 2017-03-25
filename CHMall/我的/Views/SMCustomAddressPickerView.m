//
//  SMCustomAddressPickerView.m
//  CHMall
//
//  Created by pro on 2017/1/17.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMCustomAddressPickerView.h"
#import "HMAddressPickerView.h"
#import "UIView+TYAlertView.h"
@interface SMCustomAddressPickerView ()

@property (weak, nonatomic) IBOutlet UILabel *line;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (nonatomic,copy)NSString * areaStr;
@end
@implementation SMCustomAddressPickerView
- (void)awakeFromNib{
    [super awakeFromNib];
    @weakify(self);
    HMAddressPickerView * pickerView = (HMAddressPickerView *)[[HMAddressPickerView alloc] initWithCompletion:^(HMProvince *province, HMCity *city, HMDistrict *district) {
        weak_self.areaStr = [NSString stringWithFormat:@"%@%@%@",province.name,city.name,district.name];
    }];
    pickerView.backgroundColor = colorOf_White;
    [self addSubview:pickerView];
    pickerView.sd_layout
    .topSpaceToView(_line,0)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .bottomSpaceToView(_cancelBtn,0);
}
+ (instancetype)shareInstance{
    SMCustomAddressPickerView * pickerView = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    pickerView.width = SCREEN_WIDTH * 0.9;
    return pickerView;
}
- (IBAction)nextBtnAction {
    [self hideView];
    if (self.selectAreaBlock) {
        self.selectAreaBlock(self.areaStr);
    }
}

- (IBAction)cancelBtnAction {
    [self hideView];
}
@end
