//
//  RegisterViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/20.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
/**
 *  登录按钮
 */
@property (nonatomic,strong) UIButton *loginButton;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"快速注册";
    
    [self.navView addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.navView).offset(-20);
        make.centerY.equalTo(self.navView.mas_centerY).offset(10);
    }];
    
    [self.view addSubview:self.quickRegisterView];
    [self.quickRegisterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view).offset(0);
    }];
    
}
-(UIButton *)loginButton {
    
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTintColor:[UIColor colorWithHex:@"f5f5f5"]];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_loginButton addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _loginButton;
}

-(void)clickLoginButton {
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(registerView *)quickRegisterView {
    
    if (!_quickRegisterView) {
        _quickRegisterView = [[registerView alloc]init];
        [_quickRegisterView setRegisterBlock:^{
            
            NSLog(@"点击注册");

        }];
    }
    return _quickRegisterView;
}

@end
