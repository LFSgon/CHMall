//
//  SMSortController.m
//  CHMall
//
//  Created by pro on 2017/1/7.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMSortController.h"

#import "CategoryMeunModel.h"
#import "MultilevelMenu.h"
#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"



@interface SMSortController ()

@end

@implementation SMSortController
{
    NSMutableArray * _list;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"商品分类"];
    //初始化数据
    [self initData];
    //初始化分类菜单
    [self initCategoryMenu];
    
}
- (void)initData{
    
    _list=[NSMutableArray arrayWithCapacity:0];
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"Category" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:path];
    /**
     *  构建需要数据 2层或者3层数据 (ps 2层也当作3层来处理)
     */
    
    for (int i=0; i<[array count]; i++) {
        
        CategoryMeunModel * meun=[[CategoryMeunModel alloc] init];
        meun.menuName=[array objectAtIndex:i][@"menuName"];
        meun.nextArray=[array objectAtIndex:i][@"topMenu"];
        NSMutableArray * sub=[NSMutableArray arrayWithCapacity:0];
        
        for ( int j=0; j <[meun.nextArray count]; j++) {
            
            CategoryMeunModel * meun1=[[CategoryMeunModel alloc] init];
            meun1.menuName=[meun.nextArray objectAtIndex:j][@"topName"];
            meun1.nextArray=[meun.nextArray objectAtIndex:j][@"typeMenu"];
            
            
            
            NSMutableArray *zList=[NSMutableArray arrayWithCapacity:0];
            for ( int k=0; k <[meun1.nextArray count]; k++) {
                CategoryMeunModel * meun2=[[CategoryMeunModel alloc] init];
                meun2.menuName=[meun1.nextArray objectAtIndex:k][@"typeName"];
                meun2.urlName=[meun1.nextArray objectAtIndex:k][@"typeImg"];
                [zList addObject:meun2];
            }
            
            
            meun1.nextArray=zList;
            [sub addObject:meun1];
        }
        
        
        meun.nextArray=sub;
        [_list addObject:meun];
    }
}


- (void)initCategoryMenu{
    
    MultilevelMenu * view=[[MultilevelMenu alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-49) WithData:_list withSelectIndex:^(NSInteger left, NSInteger right,CategoryMeunModel * info) {
        
        NSLog(@"点击的 菜单%@",info.menuName);

    }];

    view.leftUnSelectColor = colorOf_GrayA;
    view.needToScorllerIndex=0; //默认是 选中第一行
    view.leftSelectColor=colorOf_GrayA;//选中文字颜色
    view.leftSelectBgColor= ColorOfTheme_Yellow;//选中背景颜色
    view.isRecordLastScroll=NO;//是否记住当前位置
    view.leftSeparatorColor = colorOf_LineGray;
    view.leftUnSelectBgColor = [UIColor whiteColor];
    [self.view addSubview:view];
}


@end
