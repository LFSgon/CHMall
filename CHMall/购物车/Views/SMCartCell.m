//
//  SMCartCell.m
//  CHMall
//
//  Created by pro on 2017/1/9.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMCartCell.h"

@interface SMCartCell ()

@property (weak, nonatomic) IBOutlet UIButton *selectBtn;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UILabel *typeL;
@property (weak, nonatomic) IBOutlet UIButton *subtractBtn;
@property (weak, nonatomic) IBOutlet UITextField *numTF;
@end
@implementation SMCartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setCount:(NSInteger)count{
    _count = count;
    _subtractBtn.enabled = count;
    _numTF.text =[NSString stringWithFormat:@"%ld",count];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)plusBtnAction:(UIButton *)sender {
    self.count++;
}
- (IBAction)subtractBtnAction:(UIButton *)sender {
    self.count--;

}

- (IBAction)selectBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}

@end
