//
//  SMMemberSettingController.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberSettingController.h"
#import "SMCentreNumCell.h"
#import "SMWebViewController.h"
#import "SMMemberSettingFeedbackController.h"
#import "SMMemberSettingPwdController.h"
#import "UIView+TYAlertView.h"

@interface SMMemberSettingController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataSource;
@end

@implementation SMMemberSettingController
- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@"消息推送",@"修改密码",@"意见反馈",@"使用帮助",@"关于我们",@"版本介绍"];
    }
    return _dataSource;
}
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView =[UIView new];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(0, 0, 48, 0));
        _tableView = tableView;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    
}
- (void)setup{
    [self initTitleView:@"设置"];
    [self.tableView reloadData];
    UIButton * logoutBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [logoutBtn setBackgroundColor:ColorOfTheme_Yellow];
    [logoutBtn setTitleColor:RGB(69, 69, 69) forState:UIControlStateNormal];
    logoutBtn.titleLabel.font =[UIFont systemFontOfSize:selfont2];
    [logoutBtn addTarget:self action:@selector(logoutBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutBtn];
    logoutBtn.sd_layout
    .leftEqualToView(self.tableView)
    .rightEqualToView(self.tableView)
    .bottomSpaceToView(self.view,0)
    .topSpaceToView(self.tableView,0);
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.f;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMCentreNumCell * cell =[SMCentreNumCell cellWithTableView:tableView];
    cell.textLabel.text = self.dataSource[indexPath.row];
    if (!indexPath.row) {
        cell.centreNumCellType =centreNumCellTypeSwitch;
    }else if (indexPath.row == self.dataSource.count - 1){
        cell.centreNumCellType = centreNumCellTypeNoAccessory;
        cell.detailTextLabel.text = @"1.0";
        cell.detailTextLabel.textColor = ColorOfTheme_Red;
    }else{
        cell.centreNumCellType = centreNumCellTypeAccessory;
    }
    return cell;
}
#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 1:{
            SMMemberSettingPwdController * vc =[SMMemberSettingPwdController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            SMMemberSettingFeedbackController * vc =[SMMemberSettingFeedbackController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            SMWebViewController * vc =[SMWebViewController new];
            vc.webViewType = webViewTypeUseHelp;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:{
            SMWebViewController * vc =[SMWebViewController new];
            vc.webViewType = webViewTypeAboutUs;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:{
            
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - action
- (void)logoutBtnAction{
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"确定退出登录" message:nil];
    alertView.titleLable.font =[UIFont systemFontOfSize:selfont1];
    alertView.titleLable.textColor = colorOf_GrayB;
    alertView.buttonDestructiveBgColor = ColorOfTheme_Yellow;
    alertView.buttonCancelBgColor = RGB(242, 242, 242);
    alertView.buttonFont = [UIFont systemFontOfSize:selfont3_5];
    alertView.buttonTitleColor = colorOf_GrayA;
    alertView.buttonCornerRadius = 0;
    alertView.buttonContentViewEdge = 0;
    alertView.buttonSpace = 0;
    alertView.buttonHeight = 45;
    alertView.contentViewBottomSpace = 0;
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    @weakify(self);
    [alertView addAction:[TYAlertAction actionWithTitle:@"确定" style:TYAlertActionStyleDestructive handler:^(TYAlertAction *action) {
        
    }]];
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleAlert];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
