//
//  SMMemberController.m
//  CHMall
//
//  Created by pro on 2017/1/7.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberController.h"
#import "SMMemberHeaderView.h"
#import "SMMemberCell.h"
#import "SMMemberOrderCell.h"
#import "SMMemberOrderController.h"
#import "SMHomeMessageController.h"
#import "SMMemberCollectionController.h"
#import "SMMemberEvaluateController.h"
#import "SMMemberSettingController.h"
#import "SMMemberWalletController.h"
#import "SMMemberAddressController.h"
#import "SMMemberInfoController.h"
#import "UIView+TYAlertView.h"

static NSString * const memberCellID = @"SMMemberCell";
static NSString * const memberOrderCellID = @"SMMemberOrderCell";
@interface SMMemberController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)SMMemberHeaderView * headerView;
@property(nonatomic,strong)NSArray * dataSource;
@property(nonatomic,strong)NSArray *imagesURLStrings;
@end

@implementation SMMemberController
- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@[@{@"image":@"me_dd",@"title":@"我的订单"}],
                        @[@{@"image":@"me_wallet",@"title":@"我的钱包"},
                          @{@"image":@"me_pen",@"title":@"我的评价"},
                          @{@"image":@"me_starr",@"title":@"我的收藏"},
                          @{@"image":@"me_mapmap",@"title":@"收货地址管理"}],
                        @[@{@"image":@"me_sz",@"title":@"设置"}]];
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberCell class]) bundle:nil] forCellReuseIdentifier:memberCellID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberOrderCell class]) bundle:nil] forCellReuseIdentifier:memberOrderCellID];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(-20, 0, 0, 0));
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * list = self.dataSource[section];
    return list.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section ? 10.f : 145;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (!section) {
        SMMemberHeaderView * headerView =[SMMemberHeaderView shareInstance];
        @weakify(self);
        headerView.iconActionBlock = ^(){
            [weak_self showIconAlertView];
        };
        headerView.leftActionBlock =^(){
            SMMemberInfoController * vc =[SMMemberInfoController new];
            [weak_self.navigationController pushViewController:vc animated:YES];
        };
        headerView.rightActionBlock =^(){
            SMHomeMessageController * vc =[SMHomeMessageController new];
            [weak_self.navigationController pushViewController:vc animated:YES];
        };
        return headerView;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section ? 45.f : 105.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!indexPath.section) {
        SMMemberOrderCell * cell =[tableView dequeueReusableCellWithIdentifier:memberOrderCellID];
        @weakify(self);
        cell.btnActionBlock = ^(int selectIndex){
            SMMemberOrderController * vc =[SMMemberOrderController new];
            vc.selectIndex = selectIndex;
            [weak_self.navigationController pushViewController:vc animated:YES];
        };
        return cell;
    }
    SMMemberCell * cell =[tableView dequeueReusableCellWithIdentifier:memberCellID];
    NSDictionary * dict = self.dataSource[indexPath.section][indexPath.row];
    cell.titleL.text = dict[@"title"];
    cell.iconImageView.image =[UIImage imageNamed:dict[@"image"]];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 1) {
        if (!row) {
            SMMemberWalletController * vc =[SMMemberWalletController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (row == 1){
            SMMemberEvaluateController * vc =[SMMemberEvaluateController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (row == 2){
            SMMemberCollectionController * vc =[SMMemberCollectionController new];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            SMMemberAddressController * vc =[SMMemberAddressController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if (section == 2){
        SMMemberSettingController * vc =[SMMemberSettingController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

#pragma mark - alertViewAction
- (void)showIconAlertView{
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:nil message:nil];
    alertView.backgroundColor =[UIColor clearColor];
    alertView.buttonDefaultBgColor = colorOf_White;
    alertView.buttonCancelBgColor = colorOf_White;
    alertView.buttonFont = [UIFont systemFontOfSize:selfont3_5];
    alertView.buttonSpace = 5;
    alertView.buttonTitleColor = colorOf_GrayA;
    alertView.buttonCornerRadius = 5;
    [alertView addAction:[TYAlertAction actionWithTitle:@"从相册选择" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"照相机" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleActionSheet];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}



@end
