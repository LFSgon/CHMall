//
//  SMHomeGoodsAffirmOrderController.m
//  CHMall
//
//  Created by pro on 2017/1/14.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsAffirmOrderController.h"
#import "SMHomeGoodsAffirmFooterView.h"
#import "SMHomeGoodsAffirmHeaderView.h"
#import "SMMemberOrderItemCell.h"
#import "SMMemberOrderItemHeaderView.h"
#import "SMMemberAddressController.h"
#import "SMHomeGoodsAffirmOrderToolView.h"
#import "SMHomeGoodsPaySelectController.h"
#import "UIView+TYAlertView.h"

static NSString * const orderItemCellID = @"SMMemberOrderItemCell";
static NSString * const headerViewID = @"GoodsAffirmHeaderView";
static NSString * const footerViewID = @"SMHomeGoodsAffirmFooterView";
static NSString * const orderItemHeaderViewID = @"SMMemberOrderItemHeaderView";

@interface SMHomeGoodsAffirmOrderController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;

@end

@implementation SMHomeGoodsAffirmOrderController
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        NSMutableArray * dataSource = [[NSMutableArray alloc]init];
        for (int i = 0; i < 1; i++) {
            [dataSource addObject:@(i)];
        }
        _dataSource = dataSource;
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = colorOf_White;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderItemCell class]) bundle:nil] forCellReuseIdentifier:orderItemCellID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeGoodsAffirmHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:headerViewID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeGoodsAffirmFooterView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:footerViewID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderItemHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:orderItemHeaderViewID];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(0, 0, 48, 0));
        _tableView = tableView;
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"确认订单"];
    [self.tableView reloadData];
    SMHomeGoodsAffirmOrderToolView * toolView =[SMHomeGoodsAffirmOrderToolView shareInstance];
    @weakify(self);
    toolView.submitBtnActionBlock =^(){
        SMHomeGoodsPaySelectController * vc =[SMHomeGoodsPaySelectController new];
        [weak_self.navigationController pushViewController:vc animated:YES];
    };
    [self.view addSubview:toolView];
    toolView.sd_layout
    .topSpaceToView(self.tableView,0)
    .leftEqualToView(self.tableView)
    .rightEqualToView(self.tableView)
    .bottomSpaceToView(self.view,0);
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section ? self.dataSource.count : 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (!section) {
        return 68 + 10;
    }
    return 35;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (!section) {
        return 0.1f;
    }
    return 205;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (!section) {
        SMHomeGoodsAffirmHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewID];
        @weakify(self);
        headerView.btnActionBlock = ^(){
            SMMemberAddressController * vc =[SMMemberAddressController new];
            vc.selectRowBlock = ^(NSString * info,NSString * address){
                DLog(@"info:%@=====address:%@",info,address);
            };
            [weak_self.navigationController pushViewController:vc animated:YES];
        };
        return headerView;
    }
    SMMemberOrderItemHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:orderItemHeaderViewID];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section) {
        SMHomeGoodsAffirmFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:footerViewID];
        @weakify(self);
        footerView.deliveryBtnActionBlock = ^(){
            [weak_self showActionSheet];
        };
        return footerView;
    }
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMMemberOrderItemCell * cell =[tableView dequeueReusableCellWithIdentifier:orderItemCellID forIndexPath:indexPath];
    cell.orderItemCellType = orderItemCellTypeNone;
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - aciton
- (void)showActionSheet{
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"配送方式" message:nil];
    
    alertView.titleLable.textAlignment = NSTextAlignmentLeft;
    alertView.titleLable.font = [UIFont systemFontOfSize:selfont2];
    alertView.buttonDefaultBgColor = ColorOfTheme_Yellow;
    alertView.buttonFont = [UIFont systemFontOfSize:selfont3_5];
    alertView.buttonSpace = 5;
    alertView.buttonTitleColor = colorOf_GrayA;
    alertView.buttonCornerRadius = 5;
    [alertView addAction:[TYAlertAction actionWithTitle:@"商家配送" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    UIButton * cancelBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setImage:[UIImage imageNamed:@"wrong_cha"] forState:UIControlStateNormal];
    [cancelBtn addTarget:alertView action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
    [alertView addSubview:cancelBtn];
    cancelBtn.sd_layout
    .rightSpaceToView(alertView,15)
    .topSpaceToView(alertView,15)
    .widthIs(18)
    .heightIs(18);
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleActionSheet];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
