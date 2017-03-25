//
//  LFGoodAttributesView.m
//  HFCBuyer
//
//  Created by 了凡 on 2016/11/28.
//  Copyright © 2016年 ZTB. All rights reserved.
//

#import "LFGoodAttributesView.h"
#import "LFGoodDetailModel.h"

#define kSmallMargin 15
#define kBigMargin 20

#define kATTR_VIEW_HEIGHT SCREEN_HEIGHT * 0.7
#define kContentTextFont   [UIFont systemFontOfSize:15]
#define kButtonTextFont   [UIFont systemFontOfSize:13]

@interface LFGoodAttributesView ()

{
    UIButton *_selectedButton;
    NSMutableArray *_mutableArr;
    CGFloat _content_height;
}
@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, weak) UIView *iconBackView;
@property (nonatomic, weak) UIImageView *iconImgView;
@property (nonatomic, weak) UILabel *goodsNameLbl;
@property (nonatomic, weak) UILabel *goodsPriceLbl;
/** 购买数量Lbl */
@property (nonatomic, weak) UILabel *buyNumsLbl;
// 放置属性的scrollView
@property (nonatomic, weak) UIScrollView *scrollView;

// 存放buttons的数组
@property (nonatomic, strong) NSMutableArray *firstBtnsArr;
@property (nonatomic, strong) NSMutableArray *secondBtnsArr;
@property (nonatomic, strong) NSMutableArray *thirdBtnsArr;
@property (nonatomic, strong) NSMutableArray *forthBtnsArr;

@end
@implementation LFGoodAttributesView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5];
        [self setupBasicView];
    }
    return self;
}


/**
 *  设置视图的基本内容
 */
- (void)setupBasicView {
    // 添加手势，点击背景视图消失
    UITapGestureRecognizer *tapBackGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(noneAction)];
    [self addGestureRecognizer:tapBackGesture];
    
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    // 添加手势，遮盖整个视图的手势，
    UITapGestureRecognizer *contentViewTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    [contentView addGestureRecognizer:contentViewTapGesture];
    [self addSubview:contentView];
    self.contentView = contentView;
    
    UIView * infoView =[[UIView alloc]init];
    infoView.backgroundColor =[UIColor clearColor];
    [contentView addSubview:infoView];
    
    
    UIImageView * iconImageView =[[UIImageView alloc]init];
    iconImageView.image =[UIImage imageNamed:@"lead-1.1"];
    [iconImageView setRadius:2];
    [contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UIButton * cancelBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setImage:[UIImage imageNamed:@"wrong_cha"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:cancelBtn];
    
    UILabel *priceL =[[UILabel alloc]init];
    priceL.text = @"¥99.00";
    priceL.textColor = ColorOfTheme_Red;
    priceL.font =[UIFont systemFontOfSize:selfont3_5];
    [infoView addSubview:priceL];
    
    UILabel *salesL =[[UILabel alloc]init];
    salesL.text = @"累积销量: 1256件";
    salesL.textColor = colorOf_GrayB;
    salesL.font =[UIFont systemFontOfSize:selfont3_5];
    [infoView addSubview:salesL];
    
    UILabel *stockL =[[UILabel alloc]init];
    stockL.text = @"库存数量: 899件";
    stockL.textColor = colorOf_GrayB;
    stockL.font =[UIFont systemFontOfSize:selfont3_5];
    [infoView addSubview:stockL];
    
    iconImageView.sd_layout
    .topSpaceToView(contentView,-30)
    .leftSpaceToView(contentView,15)
    .widthIs(115)
    .heightEqualToWidth();
    
    cancelBtn.sd_layout
    .topSpaceToView(contentView,5)
    .rightSpaceToView(contentView,5)
    .widthIs(38)
    .heightEqualToWidth();
    
    infoView.sd_layout
    .leftSpaceToView(iconImageView,15)
    .rightSpaceToView(cancelBtn,15)
    .topSpaceToView(contentView,20)
    .bottomEqualToView(iconImageView);

    
    priceL.sd_layout
    .topSpaceToView(infoView,0)
    .leftSpaceToView(infoView,0)
    .heightIs(18)
    .rightSpaceToView(infoView,0);
    stockL.sd_layout
    .bottomSpaceToView(infoView,0)
    .leftEqualToView(priceL)
    .heightRatioToView(priceL,1)
    .rightSpaceToView(infoView,0);
    
    salesL.sd_layout
    .centerYEqualToView(infoView)
    .leftEqualToView(priceL)
    .heightRatioToView(priceL,1)
    .rightSpaceToView(infoView,0);
    
    
    UIButton * leftBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.backgroundColor = ColorOfTheme_Yellow;
    [leftBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:selfont2];
    [leftBtn setTitleColor:colorOf_White forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:leftBtn];
    leftBtn.sd_layout
    .leftSpaceToView(contentView,0)
    .bottomSpaceToView(contentView,0)
    .widthRatioToView(contentView,0.5)
    .heightIs(44);
    
    UIButton * rightBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.backgroundColor = ColorOfTheme_Red;
    [rightBtn setTitle:@"立即购买" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:selfont2];
    [rightBtn setTitleColor:colorOf_White forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:rightBtn];
    rightBtn.sd_layout
    .leftSpaceToView(leftBtn,0)
    .bottomSpaceToView(contentView,0)
    .rightSpaceToView(contentView,0)
    .heightRatioToView(leftBtn,1);
    
    UIScrollView *attrScrollView = [[UIScrollView alloc] init];
    attrScrollView.bounces = YES;
    attrScrollView.scrollEnabled = NO;
    attrScrollView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:attrScrollView];
    attrScrollView.sd_layout
    .topSpaceToView(iconImageView,20)
    .leftSpaceToView(contentView,0)
    .rightSpaceToView(contentView,0)
    .bottomSpaceToView(contentView,44 + 8);
    self.scrollView = attrScrollView;
}
/**
 *  设置属性控件 - setter方法
 默认传的是两组属性
 */
- (void)setGoodAttrsArr:(NSArray *)goodAttrsArr {
    _goodAttrsArr = goodAttrsArr;
    CGFloat bottomY = 0;
    for (int i = 0; i < goodAttrsArr.count; i++) {
        LFGoodSpecListModel * model = goodAttrsArr[i];
        bottomY = [self createMarkView:model bottomY:bottomY index:i];
    }
    UILabel *numLab=[[UILabel alloc] initWithFrame:CGRectMake(kSmallMargin,bottomY + 5, 80, kBigMargin)];
    [numLab setText:@"数量"];
    numLab.font=[UIFont systemFontOfSize:selfont3_5];
    numLab.textColor=colorOf_GrayA;
    [self.scrollView addSubview:numLab];
    
    UIButton *minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [minusBtn setTitle:@"-" forState:UIControlStateNormal];
    CGFloat minusBtnWH = 20;
    CGFloat minusBtnX = kSmallMargin;
    CGFloat minusBtnY = CGRectGetMaxY(numLab.frame)+15;
    minusBtn.frame = CGRectMake(minusBtnX, minusBtnY, minusBtnWH, minusBtnWH);
    [minusBtn defaultStyleWithNormalTitleColor:colorOf_GrayC andHighTitleColor:colorOf_GrayC andBorderColor:colorOf_GrayE andBackgroundColor:colorOf_Clean andHighBgColor:colorOf_Clean withcornerRadius:1];
    [minusBtn addTarget:self action:@selector(minusBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:minusBtn];
    
    // count
    UILabel *buyNumsLbl = [[UILabel alloc] init];
    buyNumsLbl.text = [NSString stringWithFormat:@"%d", self.buyNum];
    buyNumsLbl.textAlignment = NSTextAlignmentCenter;
    buyNumsLbl.layer.borderWidth = 0.5;
    buyNumsLbl.layer.borderColor = colorOf_GrayE.CGColor;
    buyNumsLbl.font =[UIFont systemFontOfSize:selfont3];
    buyNumsLbl.textColor = colorOf_GrayA;
    CGFloat buyNumsLblW = minusBtnWH * 2;
    CGFloat buyNumsLblH = minusBtnWH;
    CGFloat buyNumsLblX = CGRectGetMaxX(minusBtn.frame) - 1;
    CGFloat buyNumsLblY = minusBtnY;
    buyNumsLbl.frame = CGRectMake(buyNumsLblX, buyNumsLblY, buyNumsLblW, buyNumsLblH);
    [self.scrollView addSubview:buyNumsLbl];
    self.buyNumsLbl = buyNumsLbl;
    
    // +
    UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [plusBtn setTitle:@"+" forState:UIControlStateNormal];
    CGFloat plusBtnWH = 20;
    CGFloat plusBtnX = CGRectGetMaxX(buyNumsLbl.frame);
    CGFloat plusBtnY = minusBtnY;
    plusBtn.frame = CGRectMake(plusBtnX, plusBtnY, plusBtnWH, plusBtnWH);
    [plusBtn defaultStyleWithNormalTitleColor:colorOf_GrayC andHighTitleColor:colorOf_GrayC andBorderColor:colorOf_GrayE andBackgroundColor:colorOf_Clean andHighBgColor:colorOf_Clean withcornerRadius:0];
    [plusBtn addTarget:self action:@selector(plusBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:plusBtn];
    
    UIView *line4=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(buyNumsLbl.frame)+kBigMargin, SCREEN_WIDTH, 0.5)];
    line4.backgroundColor=colorOf_GrayD;
    _content_height = CGRectGetMaxY(buyNumsLbl.frame) + kSmallMargin + 44 + 70 + 20 * 2;
    [self.scrollView setupAutoContentSizeWithBottomView:line4 bottomMargin:8];
}

- (CGFloat)createMarkView:(LFGoodSpecListModel *)model bottomY:(CGFloat)bottomY index:(int)index{
    UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(kSmallMargin, 5 + bottomY, SCREEN_WIDTH, kBigMargin)];
    label.text = model.name;
    label.textColor=colorOf_GrayA;
    label.font= kContentTextFont;
    [self.scrollView addSubview:label];
    NSString * val1 = model.val;
    NSArray *attrValueArr1 = [val1 componentsSeparatedByString:@","];
    CGFloat one_btnsX = kSmallMargin;
    CGFloat one_btnY = CGRectGetMaxY(label.frame) + kSmallMargin;
    NSMutableArray * btnArr = [NSMutableArray array];
    for (int i = 0; i < attrValueArr1.count ; i++) {
        NSString *btnTittle = attrValueArr1[i];
        CGSize size = [btnTittle sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kButtonTextFont, NSFontAttributeName, nil]];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:btnTittle forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont boldSystemFontOfSize:13];
        btn.tag = (index + 1) * 100 + i;
        [btn addTarget:self action:@selector(attrsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(one_btnsX, one_btnY, size.width + 30, 25);
        one_btnsX += kBigMargin + size.width + kSmallMargin;
        
        while (one_btnsX  > SCREEN_WIDTH) {
            one_btnsX = kBigMargin;
            one_btnY += 40;
            if ((one_btnsX + size.width + 30) > SCREEN_WIDTH) {
                one_btnsX = kSmallMargin;
                break;
            }
            btn.frame = CGRectMake(one_btnsX, one_btnY, size.width + 30, 25);
            one_btnsX += 15 + size.width + kSmallMargin;
        }
        
        [btn defaultStyleWithNormalTitleColor:colorOf_GrayB andHighTitleColor:colorOf_White andBorderColor:colorOf_GrayE andBackgroundColor:colorOf_White andHighBgColor:ColorOfTheme_Yellow andSelectedBgColor:ColorOfTheme_Yellow withcornerRadius:0];
        [self.scrollView addSubview:btn];
        [btnArr addObject:btn];
    }
    if (index == 0) {
        self.firstBtnsArr = btnArr;
    }else if (index == 1){
        self.secondBtnsArr = btnArr;
    }else if (index == 2){
        self.thirdBtnsArr = btnArr;
    }else if (index == 3){
        self.forthBtnsArr = btnArr;
    }
    [self attrsBtnClick:btnArr[model.indexSelected]];
    // 获取 第一个属性中最后一个按钮
    UIButton *btn = (UIButton *)btnArr.lastObject;
    UIView *line1=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame)+kSmallMargin, SCREEN_WIDTH, 0.5)];
    line1.backgroundColor=colorOf_GrayD;
    [self.scrollView addSubview:line1];
    return CGRectGetMaxY(line1.frame);
}

- (void)showInView:(UIView *)view {
    [view addSubview:self];
    __weak typeof(self) _weakSelf = self;
    self.contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, _content_height);
    
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        _weakSelf.contentView.frame = CGRectMake(0, SCREEN_HEIGHT - _content_height, SCREEN_WIDTH, _content_height);
    }];
}
- (void)removeView {
    __weak typeof(self) _weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.backgroundColor = [UIColor clearColor];
        _weakSelf.contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, _content_height);
    } completion:^(BOOL finished) {
        [_weakSelf removeFromSuperview];
    }];
}

#pragma mark - 按钮点击事件
/**
 *    属性按钮的点击事件
 */
- (void)attrsBtnClick:(UIButton *)button{
    NSInteger tag = button.tag;
    if (button.selected) {
        return;
    }
    if (tag >= 100 && tag < 200) {
        for (UIButton *btn in self.firstBtnsArr) {
            btn.selected = NO;
            btn.layer.borderWidth = 1;
        }
        button.selected = YES;
        button.layer.borderWidth = 0;
        LFGoodSpecListModel * model = _goodAttrsArr[0];
        model.indexSelected = button.tag - 100;
    }else if (tag >=200 && tag < 300){
        for (UIButton *btn in self.secondBtnsArr) {
            btn.layer.borderWidth = 1;
            btn.selected = NO;
        }
        button.layer.borderWidth = 0;
        button.selected = YES;
        LFGoodSpecListModel * model = _goodAttrsArr[1];
        model.indexSelected = button.tag - 200;
    }else if (tag >= 300 && tag < 400){
        for (UIButton *btn in self.thirdBtnsArr) {
            button.layer.borderWidth = 1;
            btn.selected = NO;
        }
        button.layer.borderWidth = 0;
        button.selected = YES;
        LFGoodSpecListModel * model = _goodAttrsArr[2];
        model.indexSelected = button.tag - 300;
    }else if (tag >= 400 && tag < 500){
        for (UIButton *btn in self.forthBtnsArr) {
            button.layer.borderWidth = 1;
            btn.selected = NO;
        }
        button.layer.borderWidth = 0;
        button.selected = YES;
        LFGoodSpecListModel * model = _goodAttrsArr[2];
        model.indexSelected = button.tag - 400;
    }
}
- (void)minusBtnClick {
    if (self.buyNum == 1) return;
    
    self.buyNumsLbl.text = [NSString stringWithFormat:@"%d", --self.buyNum];
}

- (void)plusBtnClick {
    self.buyNumsLbl.text = [NSString stringWithFormat:@"%d", ++self.buyNum];
}

- (void)leftBtnAction{
    // 购买数量
    NSString *num = self.buyNumsLbl.text;
    if (self.sureBtnsClick) {
        self.sureBtnsClick(num,SureBtnTypeAddCart);
    }
    [self removeView];
}

- (void)rightBtnAction{
    NSString *num = self.buyNumsLbl.text;
    if (self.sureBtnsClick) {
        self.sureBtnsClick(num,SureBtnTypeBuy);
    }
    [self removeView];
}
- (void)noneAction{
    NSString *num = self.buyNumsLbl.text;
    if (self.sureBtnsClick) {
        self.sureBtnsClick(num,SureBtnTypeNone);
    }
    [self removeView];
}
- (void)cancelBtnAction{
    [self removeView];
}

#pragma mark - 懒加载

- (int)buyNum
{
    if (!_buyNum) {
        self.buyNum = 1;
    }
    return _buyNum;
}
#pragma mark - 懒加载
- (NSMutableArray *)firstBtnsArr
{
    if (!_firstBtnsArr) {
        _firstBtnsArr  = [[NSMutableArray alloc] init];
    }
    return _firstBtnsArr;
}
- (NSMutableArray *)secondBtnsArr
{
    if (!_secondBtnsArr) {
        _secondBtnsArr  = [[NSMutableArray alloc] init];
    }
    return _secondBtnsArr;
}
- (NSMutableArray *)thirdBtnsArr{
    if (!_thirdBtnsArr) {
        _thirdBtnsArr =[[NSMutableArray alloc]init];
    }
    return _thirdBtnsArr;
}
- (NSMutableArray *)forthBtnsArr{
    if (_forthBtnsArr) {
        _forthBtnsArr =[[NSMutableArray alloc]init];
    }
    return _forthBtnsArr;
}

@end
