//
//  SMMemberAddressAlterController.m
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberAddressAlterController.h"
#import "UIView+TYAlertView.h"
#import "SMCustomAddressPickerView.h"

@interface SMMemberAddressAlterController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *areaTF;

@property (weak, nonatomic) IBOutlet UITextField *detailAddressTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@end

@implementation SMMemberAddressAlterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)setAddressAlterType:(SMMemberAddressAlterType)addressAlterType{
    _addressAlterType = addressAlterType;
    if (addressAlterType == addressAlterTypeAdd) {
        [self initTitleView:@"添加收货地址"];
    }else{
        [self initTitleView:@"编辑收货地址"];
    }
}

- (IBAction)areaBtnAction {
    SMCustomAddressPickerView * pickerView =[SMCustomAddressPickerView shareInstance];
    @weakify(_areaTF);
    pickerView.selectAreaBlock = ^(NSString * areaStr){
        weak__areaTF.text = areaStr;
        DLog(@"%@",areaStr);
    };
    [pickerView showInWindow];
}

- (IBAction)nextBtnAction {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
