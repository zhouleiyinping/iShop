//
//  LoginViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/20.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "RetrievePasswordViewController.h"

@interface LoginViewController ()
/**
 *  注册按钮
 */
@property (nonatomic,strong) UIButton *registerButton;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = @"用户登录";
    
    [self.navView addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.navView).offset(-20);
        make.centerY.equalTo(self.navView.mas_centerY).offset(10);
    }];
    
    [self.view addSubview:self.userLoginView];
    [self.userLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view).offset(0);
    }];
}


-(UIButton *)registerButton {
    
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton setTintColor:[UIColor colorWithHex:@"f5f5f5"]];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_registerButton addTarget:self action:@selector(clickRegisterButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _registerButton;
}

-(void)clickRegisterButton:(UIButton *)button {
    
    RegisterViewController *registerViewController = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}

-(loginView *)userLoginView {
    
    if (!_userLoginView) {
        _userLoginView = [[loginView alloc]init];
        
        __WEAKSELF
        [_userLoginView setLoginBlock:^{
            
            NSLog(@"点击登录");
        }];
        [_userLoginView setForgetPasswordBlock:^{
            // 忘记密码
            [wself forgetPasswrodAction];
        }];
        
    }
    
    return _userLoginView;
}

// 忘记密码
- (void)forgetPasswrodAction {
    NSLog(@"点击忘记密码");
    RetrievePasswordViewController * retrievePasswordVC = [[RetrievePasswordViewController alloc]init];
    
    [self.navigationController pushViewController:retrievePasswordVC animated:YES];
}

@end
