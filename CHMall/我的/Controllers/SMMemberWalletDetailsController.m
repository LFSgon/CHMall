//
//  SMMemberWalletDetailsController.m
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberWalletDetailsController.h"
#import "SMMemberWalletDetailsCell.h"
static NSString * const walletDetailsCellID = @"SMMemberWalletDetailsCell";
@interface SMMemberWalletDetailsController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataSource;
@end

@implementation SMMemberWalletDetailsController
- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@"消息推送",@"修改密码",@"意见反馈",@"使用帮助",@"关于我们",@"版本介绍"];
    }
    return _dataSource;
}
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
        view.backgroundColor =BackColorOfController;
        tableView.tableHeaderView = view;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView =[UIView new];
        tableView.backgroundColor =[UIColor whiteColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberWalletDetailsCell class]) bundle:nil] forCellReuseIdentifier:walletDetailsCellID];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"明细"];
    [self.tableView reloadData];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMMemberWalletDetailsCell * cell =[tableView dequeueReusableCellWithIdentifier:walletDetailsCellID];
    return cell;
}
#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
