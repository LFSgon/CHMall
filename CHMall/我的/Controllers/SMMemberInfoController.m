//
//  SMMemberInfoController.m
//  CHMall
//
//  Created by pro on 2017/1/13.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMMemberInfoController.h"
#import "SMMemberInfoCell.h"
#import "UIView+TYAlertView.h"
#import "SMMemberNicknameController.h"
#import "SMCustomDatePickerView.h"

static NSString * const infoCellID = @"SMMemberInfoCell";

typedef NS_ENUM(NSUInteger,AlertViewType) {
    alertViewTypeIcon,
    alertViewTypeSex
};
@interface SMMemberInfoController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataSource;

@end

@implementation SMMemberInfoController
- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@"我的头像",@"我的昵称",@"性别",@"出生日期"];
    }
    return _dataSource;
}
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView =[UIView new];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SMMemberInfoCell class]) bundle:nil] forCellReuseIdentifier:infoCellID];
        [self.view addSubview:tableView];
        tableView.sd_layout
        .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        _tableView = tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTitleView:@"我的资料"];
    [self.tableView reloadData];
}
#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row ? 45 : 78;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SMMemberInfoCell * cell =[tableView dequeueReusableCellWithIdentifier:infoCellID];
    cell.titleL.text = self.dataSource[indexPath.row];
    if (indexPath.row) {
        cell.infoCellType = infoCellTypeText;
    }else{
        cell.infoCellType = infoCellTyeIcon;
        cell.iconImageView.image =[UIImage imageNamed:@"lead-1.5"];
    }
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SMMemberInfoCell * cell =[tableView cellForRowAtIndexPath:indexPath];
    SMMemberNicknameController * vc =[[SMMemberNicknameController alloc]init];
    vc.nickName = cell.contentL.text;
    @weakify(cell);
    switch (indexPath.row) {
        case 0:{
            [self setupAlertView:alertViewTypeIcon didSelectRowAtIndexPath:indexPath];
        }
            break;
        case 1:{
            
            vc.saveSuccessBlock = ^(NSString * nickName){
                weak_cell.contentL.text = nickName;
            };
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            [self setupAlertView:alertViewTypeSex didSelectRowAtIndexPath:indexPath];
        }
            break;
        case 3:{
            SMCustomDatePickerView * pickerView =[SMCustomDatePickerView shareInstance];
            pickerView.nextBtnActionBlock =^(NSString * dateStr){
                weak_cell.contentL.text = dateStr;
            };
            [pickerView showInWindow];
        }
        default:
            break;
    }
    
}
- (void)setupAlertView:(AlertViewType)alertViewType didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TYAlertView *alertView = [TYAlertView alertViewWithTitle:nil message:nil];
    alertView.backgroundColor =[UIColor clearColor];
    alertView.buttonDefaultBgColor = colorOf_White;
    alertView.buttonCancelBgColor = colorOf_White;
    alertView.buttonFont = [UIFont systemFontOfSize:selfont3_5];
    alertView.buttonSpace = 5;
    alertView.buttonTitleColor = colorOf_GrayA;
    alertView.buttonCornerRadius = 5;
    switch (alertViewType) {
        case alertViewTypeIcon:
            [self showIconAlertView:alertView];
            break;
        case alertViewTypeSex:
            [self showSexAlertView:alertView didSelectRowAtIndexPath:indexPath];
            break;
        default:
            break;
    }
}
- (void)showIconAlertView:(TYAlertView *)alertView{
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
- (void)showSexAlertView:(TYAlertView *)alertView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SMMemberInfoCell * cell =[self.tableView cellForRowAtIndexPath:indexPath];
    @weakify(cell);
    [alertView addAction:[TYAlertAction actionWithTitle:@"男" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        weak_cell.contentL.text = action.title;
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"女" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
        weak_cell.contentL.text = action.title;
    }]];
    
    [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleCancel handler:^(TYAlertAction *action) {
        NSLog(@"%@",action.title);
    }]];
    
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:alertView preferredStyle:TYAlertControllerStyleActionSheet];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
