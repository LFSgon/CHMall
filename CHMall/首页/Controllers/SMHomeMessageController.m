//
//  SMHomeMessageController.m
//  CHMall
//
//  Created by pro on 2017/1/10.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeMessageController.h"
#import "SMHomeMessageCell.h"
#import "SMHomeMessageDetailController.h"

static NSString * const messageCellID = @"SMHomeMessageCell";
@interface SMHomeMessageController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;
@end

@implementation SMHomeMessageController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[[NSMutableArray alloc]init];
        for (int i = 0; i < 5; i++) {
            [_dataSource addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _dataSource;
}
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.sectionFooterHeight = 0.1f;
        tableView.rowHeight = 120 * WIDTH_SCALE;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMHomeMessageCell class]) bundle:nil] forCellReuseIdentifier:messageCellID];
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"我的消息"];
    [self.tableView reloadData];
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0.1f;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20 * WIDTH_SCALE;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMHomeMessageCell * cell =[tableView dequeueReusableCellWithIdentifier:messageCellID];
    return cell;
}
#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SMHomeMessageDetailController * vc =[SMHomeMessageDetailController new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
