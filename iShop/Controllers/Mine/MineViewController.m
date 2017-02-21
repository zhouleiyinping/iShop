//
//  MineViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"
#import "SecurityCenterViewController.h"

@interface MineViewController ()
@property (nonatomic,strong) UIButton *loginButton;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHex:@"f5f5f5"];
    self.titleLabel.text = @"我的";
    self.backButton.hidden = YES;

    [self.navView addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.navView).offset(-20);
        make.centerY.equalTo(self.navView.mas_centerY).offset(10);
    }];
}

-(UIButton *)loginButton {
    
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTintColor:[UIColor colorWithHex:@"f5f5f5"]];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_loginButton addTarget:self action:@selector(clickLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _loginButton;
}

-(void)clickLoginButton:(UIButton *)button {
    
//    SecurityCenterViewController * VC = [[SecurityCenterViewController alloc]init];
    LoginViewController *VC = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
    
}

@end
