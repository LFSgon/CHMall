//
//  SMCartController.m
//  CHMall
//
//  Created by pro on 2017/1/7.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMCartController.h"
#import "SMCartCell.h"
#import "SMCartToolView.h"

static NSString * const cartCellID = @"SMCartCell";
@interface SMCartController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)SMCartToolView * toolView;
@property(nonatomic,strong)NSMutableArray * dataSource;
@end

@implementation SMCartController
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[[NSMutableArray alloc]init];
        for (int i = 0; i < 20; i++) {
            [_dataSource addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _dataSource;
}
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 240*WIDTH_SCALE;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMCartCell class]) bundle:nil] forCellReuseIdentifier:cartCellID];
        _tableView = tableView;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"购物车"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem BarButtonItemWithTitle:@"完成" selTitle:@"编辑" target:self action:@selector(rightItemAction:)];
    [self.view addSubview:self.tableView];
    
    _toolView = [SMCartToolView shareInstance];
    [self.view addSubview:_toolView];
    self.tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, 0, 48, 0));
    _toolView.sd_layout
    .leftEqualToView(self.tableView)
    .rightEqualToView(self.tableView)
    .bottomEqualToView(self.tableView)
    .heightIs(48);
}
#pragma mark - action
- (void)rightItemAction:(UIButton *)btn{
    btn.selected = !btn.selected;
    _toolView.isEdit = btn.selected;
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMCartCell * cell =[tableView dequeueReusableCellWithIdentifier:cartCellID];
    cell.count = 1;
    return cell;
}
#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
