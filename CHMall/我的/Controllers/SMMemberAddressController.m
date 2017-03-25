//
//  SMMemberAddressController.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberAddressController.h"
#import "SMMemberAddressCell.h"
#import "SMMemberAddressAlterController.h"

static NSString * addressCellID = @"SMMemberAddressCell";
@interface SMMemberAddressController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataSource;

@end

@implementation SMMemberAddressController
- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@"消息推送",@"修改密码",@"意见反馈",@"使用帮助",@"关于我们",@"版本介绍"];
    }
    return _dataSource;
}
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberAddressCell class]) bundle:nil] forCellReuseIdentifier:addressCellID];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"收货地址"];
    self.navigationItem.rightBarButtonItem =[UIBarButtonItem BarButtonItemWithBackgroudImageName:@"icon_tj" highBackgroudImageName:nil target:self action:@selector(rightAction)];
    [self.tableView reloadData];
}

#pragma mark - action
- (void)rightAction{
    SMMemberAddressAlterController * vc =[SMMemberAddressAlterController new];
    vc.addressAlterType = addressAlterTypeAdd;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 124.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMMemberAddressCell * cell =[tableView dequeueReusableCellWithIdentifier:addressCellID];
    if (!indexPath.section) {
        cell.isDefault = YES;
    }
    @weakify(self);
    cell.defaultActionBlock =^(BOOL isDefault){
        if (isDefault) {
            SMMemberAddressCell * cell = [weak_self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            cell.isDefault = NO;
           [weak_self.tableView moveSection:indexPath.section toSection:0];
        }else{
            SMMemberAddressCell * cell = [weak_self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
            cell.isDefault = YES;
            [weak_self.tableView moveSection:indexPath.section toSection:1];
        }
    };
    cell.editActionBlock = ^(){
        SMMemberAddressAlterController * vc =[SMMemberAddressAlterController new];
        vc.addressAlterType = addressAlterTypeEdit;
        [self.navigationController pushViewController:vc animated:YES];
    };
    cell.deleteActionBlock =^(){
        
    };
    return cell;
}
#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectRowBlock) {
        SMMemberAddressCell * cell =[tableView cellForRowAtIndexPath:indexPath];
        self.selectRowBlock(cell.infoL.text,cell.addressL.text);
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

@end
