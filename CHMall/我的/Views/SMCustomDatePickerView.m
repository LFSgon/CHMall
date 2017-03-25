//
//  SMCustomDatePickerView.m
//  CHMall
//
//  Created by pro on 2017/1/13.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMCustomDatePickerView.h"
#import "UIView+TYAlertView.h"
#import "SMCustomDatePicker.h"

@interface SMCustomDatePickerView ()<SMCustomDatePickerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *timeL;

@property (weak, nonatomic) IBOutlet SMCustomDatePicker *datePicker;

@end
@implementation SMCustomDatePickerView
- (void)awakeFromNib{
    [super awakeFromNib];
    _datePicker.delegate = self;
    // 当前时间 选择器默认显示时间
    NSDate* date = [NSDate date];
    NSDateFormatter *fm =[[NSDateFormatter alloc] init];
    fm.dateFormat = @"yyyy";
    NSString * yearNow = [fm stringFromDate:date];
    fm.dateFormat = @"MM";
    NSString * monthNow = [fm stringFromDate:date];
    fm.dateFormat = @"dd";
    NSString * dayNow = [fm stringFromDate:date];
    _timeL.text =[NSString stringWithFormat:@"%@.%@.%@",yearNow,monthNow,dayNow];
}
+ (instancetype)shareInstance{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}
- (IBAction)cancelBtnAction {
    [self hideView];
}

- (IBAction)nextBtnAction {
    [self cancelBtnAction];
    if (self.nextBtnActionBlock) {
        self.nextBtnActionBlock(_timeL.text);
    }
}
#pragma mark - <SMCustomDatePickerDelegate>
- (void)CustomPickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component year:(NSString *)year month:(NSString *)month day:(NSString *)day{
    _timeL.text =[NSString stringWithFormat:@"%@.%@.%@",year,month,day];
}

@end
