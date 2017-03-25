//
//  SMHomeGoodsPaySelectController.m
//  CHMall
//
//  Created by pro on 2017/1/16.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsPaySelectController.h"
#import "SMHomeGoodsPaySelectCell.h"
#import "SMHomeGoodsPaySelectHeaderView.h"
#import "SMHomeGoodsPaySelectFooterView.h"
#import "SMMemberRechargeWalletController.h"
#import "SMHomeGoodsPayTypeView.h"
#import "UIView+TYAlertView.h"
#import "SMHomeGoodsPaySuccessController.h"

#import "AppDelegate.h"

static NSString * const cellID = @"SMHomeGoodsPaySelectCell";
static NSString * const headerViewID = @"SMHomeGoodsPaySelectHeaderView";
static NSString * const footerViewID = @"SMHomeGoodsPaySelectFooterView";

@interface SMHomeGoodsPaySelectController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataSource;

@end

@implementation SMHomeGoodsPaySelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"网上支付"];
    [self.tableView reloadData];
}

- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource =@[
                       @[@{@"image":@"icon_pay",@"title":@"支付宝支付"},
                       @{@"image":@"icon_wxpay",@"title":@"微信支付"}],
                       @[@{@"image":@"icon_wallet",@"title":@"我的钱包"}]
                       ];
    }
    return _dataSource;
}
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor = colorOf_White;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeGoodsPaySelectCell class]) bundle:nil] forCellReuseIdentifier:cellID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeGoodsPaySelectHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:headerViewID];
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeGoodsPaySelectFooterView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:footerViewID];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        _tableView = tableView;
    }
    return _tableView;
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
    if (!section) {
        return 92;
    }
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (!section) {
        return 0.1f;
    }
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (!section) {
        SMHomeGoodsPaySelectHeaderView * headerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewID];
        return headerView;
    }
    UIView * headerView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    headerView.backgroundColor = BackColorOfController;
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section) {
        SMHomeGoodsPaySelectFooterView * footerView =[tableView dequeueReusableHeaderFooterViewWithIdentifier:footerViewID];
//        @weakify(self);
        
        footerView.rechargeBtnActionBlock =^(){
//            [AppDelegate sharedInstance].tvc.selectedIndex = 3;
            
        };
        return footerView;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMHomeGoodsPaySelectCell * cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    NSDictionary * dict = self.dataSource[indexPath.section][indexPath.row];
    cell.iconImageView.image =[UIImage imageNamed:dict[@"image"]];
    cell.titleL.text = dict[@"title"];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SMHomeGoodsPayTypeView * payTypeView =[SMHomeGoodsPayTypeView createViewFromNib];
    if (indexPath.section) {
        payTypeView.payType = payTypeWallet;
    }else{
        if (indexPath.row) {
            payTypeView.payType = payTypeWeChat;
        }else{
            payTypeView.payType = payTypeAlipay;
        }
    }
    @weakify(self);
    payTypeView.nextBtnActionBlock = ^(){
        SMHomeGoodsPaySuccessController * vc =[SMHomeGoodsPaySuccessController new];
        [weak_self.navigationController pushViewController:vc animated:YES];
    };
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:payTypeView preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [self presentViewController:alertController animated:YES completion:nil];
}



@end
