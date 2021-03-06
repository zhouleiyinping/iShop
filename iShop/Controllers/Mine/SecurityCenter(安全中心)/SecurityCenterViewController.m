//
//  SecurityCenterViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "SecurityCenterViewController.h"
#import "SecurityCenterTabCell.h"
#import "SecurityCenterModel.h"
#import "PromptlyChangeViewController.h"
#import "IdentityBindingViewController.h"
#import "PhoneBindingViewController.h"
#import "SetUpDrawMoneyPwViewController.h"
#import "BankCodeViewController.h"

@interface SecurityCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *safeTableView;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) NSArray *explainArray;

@end

@implementation SecurityCenterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.titleLabel.text = @"安全中心";
    self.view.backgroundColor = [UIColor colorWithHex:@"f5f5f5"];
    [self.view addSubview:self.safeTableView];
    
    self.titleArray = @[@[@"身份绑定",@"手机绑定",@"登录密码"],@[@"银行卡",@"提款密码"]];
    self.explainArray = @[@[@"未绑定",@"更换手机号",@"更换密码"],@[@"未绑定",@"修改密码"]];
    
}

-(UITableView *)safeTableView {
    
    if (!_safeTableView) {
        _safeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _safeTableView.delegate = self;
        _safeTableView.dataSource = self;
        _safeTableView.scrollEnabled = NO;
        _safeTableView.backgroundColor = [UIColor colorWithHex:@"f5f5f5"];
        _safeTableView.tableFooterView = [UIView new];
        _safeTableView.separatorInset = UIEdgeInsetsZero;
        _safeTableView.separatorColor = _safeTableView.backgroundColor;
        [_safeTableView registerClass:[SecurityCenterTabCell class] forCellReuseIdentifier:@"SecurityCenterTabCell"];

    }
    return _safeTableView;
}

#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *rowArray = self.titleArray[section];
    return rowArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *rowArray = self.titleArray[indexPath.section];

    SecurityCenterTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecurityCenterTabCell"];
    
    cell.titleLab.text = rowArray[indexPath.row];
    cell.explainLab.text = ((NSArray *)self.explainArray[indexPath.section])[indexPath.row];
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45.;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = _safeTableView.backgroundColor;
    
    return headerView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    switch (indexPath.section) {
        case 0: {
            switch (indexPath.row) {
                case 0:
                {
                    /**
                     这里要判断一下身份是否绑定，改变 VC.bindingType的值
                     */
                    IdentityBindingViewController *VC = [[IdentityBindingViewController alloc]init];
                    VC.bindingType = Unbounded;
                    [self.navigationController pushViewController:VC animated:YES];
                    
                }
                    break;
                case 1: //手机绑定
                {
                    /**
                     这里应判断一下当前是否已绑定过手机号，如果已绑定，则进入PromptlyChangeViewController，如果未绑定，则进手机绑定页面
                     */
//                    PromptlyChangeViewController *VC = [[PromptlyChangeViewController alloc]init];//已绑定
//                    VC.safeVCType = PhoneBinding;
                    
                    PhoneBindingViewController *VC = [[PhoneBindingViewController alloc]init];//未绑定
                    [self.navigationController pushViewController:VC animated:YES];
                }
                    break;
                case 2: //登录密码
                {
                    PromptlyChangeViewController *VC = [[PromptlyChangeViewController alloc]init];
                    VC.safeVCType = Loginpassword;
                    [self.navigationController pushViewController:VC animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        default: {
            
            switch (indexPath.row) {
                case 0:
                {
                    BankCodeViewController *VC = [[BankCodeViewController alloc]init];
                    
                    [self.navigationController pushViewController:VC animated:YES];
                }
                    break;
                case 1:
                {
                    /**
                     这里应判断一下当前是否已设置过提现密码，如果已设置，则进入PromptlyChangeViewController，如果未设置，则进入提现密码设置页面
                     */
//                    PromptlyChangeViewController *VC = [[PromptlyChangeViewController alloc]init];
//                    VC.safeVCType = DrawMoneyPassword;
                    
                    SetUpDrawMoneyPwViewController *VC = [[SetUpDrawMoneyPwViewController alloc]init];
                    [self.navigationController pushViewController:VC animated:YES];
                }
                    
                default:
                    break;
            }
        }
            break;
    }
    

    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
