//
//  UIButton+Extension.m
//  GongDan
//
//  Created by 了凡 on 16/1/20.
//  Copyright © 2016年 河北广联. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

/**
 *  UIButton文字图片垂直显示
 *
 *  @param image    图片
 *  @param title    文字
 *  @param target   self
 *  @param selector 点击时间
 *
 *  @return 返回button
 */
+ (UIButton*) createButtonWithImage:(NSString *)image HighImage:(NSString *)highImage Title:(NSString *)title Target:(id)target Selector:(SEL)selector{
    UIButton * button = [UIButton new];
    UIImage * norImage = [UIImage imageNamed:image];
    UIImage * norImage1 = [UIImage imageNamed:highImage];
    [button setImage:norImage forState:UIControlStateNormal];
    [button setImage:norImage1 forState:UIControlStateHighlighted];
    
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:90/255.0 green:194/255.0 blue:183/255.0 alpha:1] forState:UIControlStateHighlighted];
        button.titleLabel.font =[UIFont systemFontOfSize:14];
        
    }
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//设置button的内容横向居中。。设置content是title和image一起变化
    //设置内容垂直或水平显示位置
    CGFloat imageW = norImage.size.width;
    CGFloat imageH = norImage.size.height;
    CGFloat y = (60 - imageH)/2;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, imageW, y, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(y, -14, 0, 0);
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
}

+ (UIButton*) createButtonWithImage:(NSString *)image tag:(NSInteger)tag selectImage:(NSString *)selectImage Title:(NSString *)title normalTextColor:(UIColor *)normalColor seletTextColor:(UIColor *)selectColor Target:(id)target Selector:(SEL)selector{
    UIButton * button = [UIButton new];
    button.tag = tag;
    UIImage * norImage = [UIImage imageNamed:image];
    UIImage * norImage1 = [UIImage imageNamed:selectImage];
    [button setImage:norImage forState:UIControlStateNormal];
    [button setImage:norImage1 forState:UIControlStateSelected];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:normalColor forState:UIControlStateNormal];
        [button setTitleColor:selectColor forState:UIControlStateSelected];
        button.titleLabel.font =[UIFont systemFontOfSize:14];
    }
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

-(void)bootstrapStyle:(CGFloat)cornerRadius{
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    [self setAdjustsImageWhenHighlighted:NO];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    [self.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:self.titleLabel.font.pointSize]];
}

-(void)defaultStyleWithNormalTitleColor:(UIColor *)titleColor andHighTitleColor:(UIColor *)highTitleColor andBorderColor:(UIColor *)borderColor andBackgroundColor:(UIColor *)bgColor andHighBgColor:(UIColor *)highBgColor withcornerRadius:(CGFloat)cornerRadius{
    [self bootstrapStyle:cornerRadius];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setTitleColor:highTitleColor forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self buttonImageFromColor:bgColor] forState:UIControlStateNormal];
    self.layer.borderColor = [borderColor CGColor];
    [self setBackgroundImage:[self buttonImageFromColor:highBgColor] forState:UIControlStateHighlighted];
}

-(void)defaultStyleWithNormalTitleColor:(UIColor *)titleColor andHighTitleColor:(UIColor *)highTitleColor andBorderColor:(UIColor *)borderColor andBackgroundColor:(UIColor *)bgColor andHighBgColor:(UIColor *)highBgColor andSelectedBgColor:(UIColor *)selectedBgColor withcornerRadius:(CGFloat)cornerRadius{
    [self bootstrapStyle:cornerRadius];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setTitleColor:highTitleColor forState:UIControlStateHighlighted];
    [self setTitleColor:highTitleColor forState:UIControlStateSelected];
    self.layer.borderColor = [borderColor CGColor];
    [self setBackgroundImage:[self buttonImageFromColor:bgColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:highBgColor] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self buttonImageFromColor:selectedBgColor] forState:UIControlStateSelected];
}
-(void)customBtnStyleBackgroundColor:(UIColor *)bgColor andHighBgColor:(UIColor *)highBgColor andSelectedBgColor:(UIColor *)selectedBgColor {
    [self setBackgroundImage:[self buttonImageFromColor:bgColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[self buttonImageFromColor:highBgColor] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[self buttonImageFromColor:selectedBgColor] forState:UIControlStateSelected];
}
- (UIImage *) buttonImageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
/**
 *  自定义按钮 图片和文字的样式
 *
 *  @param image     图片
 *  @param title     按钮文字
 *  @param _position 图片的位置
 *  @param _font
 *  @param stateType 按钮的状态
 */
- (void)setImageWithTitle:(UIImage *)image withTitle:(NSString *)title position:(NSString *)_position font:(UIFont *)_font forState:(UIControlState)stateType{
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = _font;
    CGSize titleSize = [title sizeWithAttributes:attr];
    [self.imageView setContentMode:UIViewContentModeCenter];
    
    if([_position isEqualToString:@"left"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2, 10.0, 0.0, 0)];
    }else if([_position isEqualToString:@"top"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake(2.0, 0.0, 25.0, -titleSize.width)];
    }else if([_position isEqualToString:@"right"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2, titleSize.width + 25, 0.0, 0.0)];
    }
    
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:_font];
    
    if([_position isEqualToString:@"left"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2,
                                                  image.size.width,
                                                  0.0,
                                                  0.0)];
    }else if([_position isEqualToString:@"top"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake(50.0,
                                                  -image.size.width,
                                                  0.0,
                                                  0.0)];
    }else if([_position isEqualToString:@"right"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2,
                                                  -40.0,
                                                  0.0,
                                                  0)];
    }
    
    
    [self setTitle:title forState:stateType];
}

- (void)setFamillyImageWithTitle:(UIImage *)image withTitle:(NSString *)title position:(NSString *)_position font:(UIFont *)_font forState:(UIControlState)stateType
{
    //    CGSize titleSize = [title sizeWithFont:_font];
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = _font;
    CGSize titleSize = [title sizeWithAttributes:attr];
    [self.imageView setContentMode:UIViewContentModeCenter];
    
    if([_position isEqualToString:@"left"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2, 10.0, 0.0, 0)];
    }else if([_position isEqualToString:@"top"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 15.0, -titleSize.width)];
    }else if([_position isEqualToString:@"right"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2, titleSize.width + 25, 0.0, 0.0)];
    }
    
    
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:_font];
    
    if([_position isEqualToString:@"left"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2,
                                                  image.size.width,
                                                  0.0,
                                                  0.0)];
    }else if([_position isEqualToString:@"top"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake(25.0,
                                                  -image.size.width,
                                                  0.0,
                                                  0.0)];
    }else if([_position isEqualToString:@"right"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2,
                                                  -40.0,
                                                  0.0,
                                                  0)];
    }
    
    
    [self setTitle:title forState:stateType];
}

- (void)setSellerDetailImageWithTitle:(UIImage *)image withTitle:(NSString *)title position:(NSString *)_position font:(UIFont *)_font forState:(UIControlState)stateType
{
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = _font;
    CGSize titleSize = [title sizeWithAttributes:attr];
    [self.imageView setContentMode:UIViewContentModeCenter];
    
    if([_position isEqualToString:@"left"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2, 10.0, 0.0, 0)];
    }else if([_position isEqualToString:@"top"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake(2.0, 0.0, 25.0, -titleSize.width)];
    }else if([_position isEqualToString:@"right"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2, titleSize.width + 25, 0.0, 0.0)];
    }
    
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:_font];
    
    if([_position isEqualToString:@"left"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2,
                                                  image.size.width,
                                                  0.0,
                                                  0.0)];
    }else if([_position isEqualToString:@"top"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake(40.0,
                                                  -image.size.width,
                                                  0.0,
                                                  0.0)];
    }else if([_position isEqualToString:@"right"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2,
                                                  -40.0,
                                                  0.0,
                                                  0)];
    }
    
    
    [self setTitle:title forState:stateType];
}

- (void)setLootProductImageWithTitle:(UIImage *)image withTitle:(NSString *)title position:(NSString *)_position font:(UIFont *)_font forState:(UIControlState)stateType
{
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = _font;
    CGSize titleSize = [title sizeWithAttributes:attr];
    [self.imageView setContentMode:UIViewContentModeCenter];
    
    if([_position isEqualToString:@"left"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2, 10.0, 0.0, 0)];
    }else if([_position isEqualToString:@"top"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake(5.0, 5.0, 18.0, -titleSize.width + 5)];
        //        [self setImageEdgeInsets:UIEdgeInsetsMake(10, 0, 10, 0)];
    }else if([_position isEqualToString:@"right"]){
        [self setImageEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2, titleSize.width + 25, 0.0, 0.0)];
    }
    
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:_font];
    
    if([_position isEqualToString:@"left"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2,
                                                  image.size.width,
                                                  0.0,
                                                  0.0)];
    }else if([_position isEqualToString:@"top"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake(32.0,
                                                  -image.size.width,
                                                  0.0,
                                                  0.0)];
    }else if([_position isEqualToString:@"right"]){
        [self setTitleEdgeInsets:UIEdgeInsetsMake((self.frame.size.height - 50)/2,
                                                  -40.0,
                                                  0.0,
                                                  0)];
    }
    
    
    [self setTitle:title forState:stateType];
}

- (void)setBtnWithImgStr:(NSString *)imgStr withTittle:(NSString *)tittle {
    UIImageView *imgView = [[UIImageView alloc] init];
    [LFLoadImageTool loadPicWithView:imgView url:imgStr];
    CGFloat imgViewWH = self.frame.size.width - 40;
    imgView.frame = (CGRect){20, 10, imgViewWH, imgViewWH};
    imgView.layer.cornerRadius = imgViewWH/2;
    [self addSubview:imgView];
    
    UILabel *tittleLbl = [[UILabel alloc] init];
    tittleLbl.text = tittle;
    tittleLbl.textAlignment = NSTextAlignmentCenter;
    tittleLbl.font = [UIFont systemFontOfSize:13];
    tittleLbl.frame = (CGRect){0, CGRectGetMaxY(imgView.frame) + 5, self.frame.size.width, 15};
    [self addSubview:tittleLbl];
}

@end
