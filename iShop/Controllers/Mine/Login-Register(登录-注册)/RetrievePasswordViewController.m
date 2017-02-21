//
//  RetrievePasswordViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/20.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "RetrievePasswordViewController.h"
#import "RegisterViewController.h"

@interface RetrievePasswordViewController ()
/**
 *  注册按钮
 */
@property (nonatomic,strong) UIButton *registerButton;

@end

@implementation RetrievePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.titleLabel.text = @"找回密码";
    [self.navView addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.navView).offset(-20);
        make.centerY.equalTo(self.navView.mas_centerY).offset(10);
    }];
    [self.view addSubview:self.retrievePasswordView];
    [self.retrievePasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view).offset(0);
    }];
}

-(RetrievePasswordView *)retrievePasswordView {
    
    if (!_retrievePasswordView) {
        _retrievePasswordView = [[RetrievePasswordView alloc]init];
       
    }
    return _retrievePasswordView;
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
@end
