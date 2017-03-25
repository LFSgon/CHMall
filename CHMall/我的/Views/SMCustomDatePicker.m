//
//  SMCustomDatePicker.m
//  CHMall
//
//  Created by pro on 2017/1/13.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMCustomDatePicker.h"

#define MainColor  UIColorFromRGB(0x4887CA)

@interface SMCustomDatePicker ()< UIPickerViewDataSource,UIPickerViewDelegate >

@property (nonatomic,strong) NSArray *yearArr , *monthArr , *dayArr;

@property (nonatomic,strong) NSString *yearNow , *monthNow , *dayNow;

// 当前 '年' '月' '日' 数组中所占的索引值
@property (nonatomic,assign) NSInteger rowLeft , rowMiddle , rowRight;

// the year and month of displaying on view now
@property (nonatomic,assign) NSInteger chosenYear , chosenMonth , chosenDay;

@end
@implementation SMCustomDatePicker

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self =[super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}
-(void)setup
{
    [self timeNow];
    [self timeArray];
    _pickerView = [[UIPickerView alloc] initWithFrame:self.bounds];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    [self addSubview:_pickerView];
    [self defaultDisplay];
}


-(void)timeArray
{
    NSInteger yearN = [_yearNow integerValue];
    
    _yearArr = [[NSMutableArray alloc] initWithObjects:
               [NSString stringWithFormat:@"%ld",yearN-4],
                [NSString stringWithFormat:@"%ld",yearN-3],
                [NSString stringWithFormat:@"%ld",yearN-2],
                [NSString stringWithFormat:@"%ld",yearN-1],
                [NSString stringWithFormat:@"%ld",yearN],
                nil];
    
    _monthArr = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",];
    
    _dayArr = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31"];
}

-(void)timeNow
{
    // 当前时间 选择器默认显示时间
    NSDate* date = [NSDate date];
    NSDateFormatter *fm =[[NSDateFormatter alloc] init];
    fm.dateFormat = @"yyyy";
    self.yearNow = [fm stringFromDate:date];
    self.chosenYear = [_yearNow integerValue];
    
    fm.dateFormat = @"MM";
    self.monthNow = [fm stringFromDate:date];
    self.chosenMonth = [_monthNow integerValue];
    
    fm.dateFormat = @"dd";
    self.dayNow = [fm stringFromDate:date];
    self.chosenDay = [_dayNow integerValue];
}


-(void)defaultDisplay
{
    NSUInteger rowLeft = [_yearArr indexOfObject:_yearNow];
    NSUInteger rowMiddle = [_monthArr indexOfObject:_monthNow];
    NSUInteger rowRight = [_dayArr indexOfObject:_dayNow];
    
    _rowLeft = rowLeft;
    _rowMiddle = rowMiddle;
    _rowRight = rowRight;
    
    [_pickerView selectRow:rowLeft inComponent:0 animated:YES];
    [_pickerView selectRow:rowMiddle inComponent:1 animated:YES];
    [_pickerView selectRow:rowRight inComponent:2 animated:YES];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return _yearArr.count;
    }
    
    else if (component == 1)
    {
        return _monthArr.count;
    }
    else
    {
        if ((self.chosenMonth == 1) || (self.chosenMonth == 3) || (self.chosenMonth == 5) ||(self.chosenMonth == 7)||(self.chosenMonth == 8)||(self.chosenMonth == 10)||(self.chosenMonth == 12))
        {
            return 31;
        }
        if ((self.chosenMonth == 4)||(self.chosenMonth == 6)||(self.chosenMonth == 9)||(self.chosenMonth == 11)) {
            return 30;
        }
        if ((self.chosenYear % 100 != 0)&(self.chosenYear % 4 == 0)) {
            return 29;
        }
        if ((self.chosenYear % 400 == 0)) {
            return 29;
        }
        return 28;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return  [_yearArr objectAtIndex:row];
    }
    
    else if(component == 1)
    {
        return [_monthArr objectAtIndex:row];
    }
    
    else
    {
        return [_dayArr objectAtIndex:row];
    }
    return nil;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        //pickerLabel.minimumFontSize = 8.;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        pickerLabel.textColor = UIColorFromRGB(0x666666);
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:17]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    
//    [pickerView clearSpearatorLine];
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *year , *month , *day;
    
    if (component == 0) {
        
        _rowLeft = row;
        [self commonYearOrLeapYear];
    }
    if (component == 1) {
        
        _rowMiddle = row;
        [self numberOfDaysEachMonth];
    }
    
    if (component == 2) {
        _rowRight = row;
    }
    
    year = _yearArr[_rowLeft];
    month = _monthArr[_rowMiddle];
    day = _dayArr[_rowRight];

    
    self.chosenYear = [year integerValue];
    self.chosenMonth = [month integerValue];
    self.chosenDay = [day integerValue];
    
    // 刷新
    [pickerView reloadComponent:2];
    
    //NSLog(@"current date pick %@%@%@",year,month,day);
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(CustomPickerView:didSelectRow:inComponent:year:month:day:)]) {
        [self.delegate CustomPickerView:pickerView didSelectRow:row inComponent:component year:year month:month day:day];
    }
}


-(void)commonYearOrLeapYear
{
    NSString *year = _yearArr[_rowLeft];
    self.chosenYear = [year integerValue];
    self.chosenMonth = _rowMiddle+1;
    
    if ((self.chosenMonth == 1) || (self.chosenMonth == 3) || (self.chosenMonth == 5) ||(self.chosenMonth == 7)||(self.chosenMonth == 8)||(self.chosenMonth == 10)||(self.chosenMonth == 12))
    {
        
    }
    else if ((self.chosenMonth == 4)||(self.chosenMonth == 6)||(self.chosenMonth == 9)||(self.chosenMonth == 11)) {
        
        if (_rowRight > 29) {
            _rowRight =  29;
        }
    }
    else if ((self.chosenYear % 100 != 0)&(self.chosenYear % 4 == 0)) {
        
        if (_rowRight > 28) {
            _rowRight =  28;
        }
    }
    else if ((self.chosenYear % 400 == 0)) {
        
        if (_rowRight > 28) {
            _rowRight =  28;
        }
    }
    
    else if (_rowRight > 27) {
        _rowRight =  27;
    }
}



-(void)numberOfDaysEachMonth
{
    NSString *year = _yearArr[_rowLeft];
    NSArray *strArr = [year componentsSeparatedByString:@"年"];
    
    self.chosenYear = [strArr[0] integerValue];
    self.chosenMonth = _rowMiddle+1;
    
    if ((self.chosenMonth == 1) || (self.chosenMonth == 3) || (self.chosenMonth == 5) ||(self.chosenMonth == 7)||(self.chosenMonth == 8)||(self.chosenMonth == 10)||(self.chosenMonth == 12))
    {
        
    }
    else if ((self.chosenMonth == 4)||(self.chosenMonth == 6)||(self.chosenMonth == 9)||(self.chosenMonth == 11)) {
        
        if (_rowRight > 29) {
            _rowRight =  29;
        }
    }
    else if ((self.chosenYear % 100 != 0)&(self.chosenYear % 4 == 0)) {
        
        if (_rowRight > 28) {
            _rowRight =  28;
        }
    }
    else if ((self.chosenYear % 400 == 0)) {
        
        if (_rowRight > 28) {
            _rowRight =  28;
        }
    }
    
    else if (_rowRight > 27) {
        _rowRight =  27;
    }
}

////字符串拼接
//- (NSString *)stringCombine:(NSString *)str string:(NSString *)string
//{
//    NSString *stringCom = [NSString stringWithFormat:@"%@%@",str,string];
//    return stringCom;
//}

@end
