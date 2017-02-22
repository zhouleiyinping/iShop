//
//  BankCodeViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "BankCodeViewController.h"
#import "AddBankCodeViewController.h"

@interface BankCodeViewController ()
@property (nonatomic,strong)UIButton *addBankCodeBtn;
@property (nonatomic,strong)UITableView *bandCodeTableView;
@end

@implementation BankCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = @"银行卡";
    
    [self.view addSubview:self.addBankCodeBtn];
    [self.addBankCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-30);
        make.height.offset(45);
    }];
}


-(UIButton *)addBankCodeBtn {
    if (!_addBankCodeBtn) {
        _addBankCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBankCodeBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
        _addBankCodeBtn.layer.masksToBounds = YES;
        _addBankCodeBtn.layer.cornerRadius = 4;
        _addBankCodeBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_addBankCodeBtn setTitle:@"添加银行卡" forState:UIControlStateNormal];
        [_addBankCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_addBankCodeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_addBankCodeBtn addTarget:self action:@selector(addBankCodeAction) forControlEvents:UIControlEventTouchUpInside];

    }
    
    return _addBankCodeBtn;
}
-(void)addBankCodeAction {
    
    AddBankCodeViewController *addBankCodeVC = [[AddBankCodeViewController alloc]init];
    [self.navigationController pushViewController:addBankCodeVC animated:YES];
}
@end
