//
//  SetUpDrawMoneyPwViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "SetUpDrawMoneyPwViewController.h"

@interface SetUpDrawMoneyPwViewController ()
@property (nonatomic,strong)UIView *bgView;
@property (nonatomic,strong)UILabel *passwordLab;
@property (nonatomic,strong)UILabel *affirmPasswordLab;
@property (nonatomic,strong)UITextField *passwordTextField;
@property (nonatomic,strong)UITextField *affirmPasswordTextField;
@property (nonatomic,strong)UIButton *submitBtn;
@end

@implementation SetUpDrawMoneyPwViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"提现密码";
    
    [self setUpInitSubViews];
}

-(void)setUpInitSubViews {
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.submitBtn];
    [self.bgView addSubview:self.passwordLab];
    [self.bgView addSubview:self.passwordTextField];
    [self.bgView addSubview:self.affirmPasswordLab];
    [self.bgView addSubview:self.affirmPasswordTextField];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(74);
        make.height.offset(90.5);
    }];
    [self.passwordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).offset(0);
        make.left.equalTo(self.bgView).offset(20);
        make.height.offset(45);
    }];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordLab.mas_centerY).offset(0);
        make.right.equalTo(self.view).offset(-20);
        make.left.equalTo(self.passwordLab.mas_right).offset(20);
        make.height.offset(45);
    }];
    
    [self.affirmPasswordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordLab.mas_bottom).offset(0);
        make.left.equalTo(self.bgView).offset(20);
        make.height.offset(45);
    }];
    [self.affirmPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.affirmPasswordLab.mas_centerY).offset(0);
        make.left.equalTo(self.affirmPasswordLab.mas_right).offset(20);
        make.height.offset(45);
        make.right.equalTo(self.view).offset(-20);

    }];
    
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.bgView.mas_bottom).offset(30);
        make.height.offset(45);
    }];
}

-(UIView *)bgView {
    
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
#pragma mark - 提现密码
-(UITextField *)passwordTextField {
    
    if (!_passwordTextField) {
        _passwordTextField = [UITextField setUpTextFieldForPubilc];
        _passwordTextField.delegate = self;
        _passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
        _passwordTextField.placeholder = @"由6~15位数字组成";
        [_passwordTextField addTarget:self action:@selector(passwordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _passwordTextField;
}
-(UILabel *)passwordLab {
    
    if (!_passwordLab) {
        _passwordLab = [[UILabel alloc]init];
        _passwordLab.textAlignment = NSTextAlignmentLeft;
        _passwordLab.backgroundColor = [UIColor whiteColor];
        _passwordLab.textColor = [UIColor colorWithHex:@"333333"];
        _passwordLab.font = [UIFont systemFontOfSize:16];
        _passwordLab.text = @"提现密码";
    }
    return _passwordLab;
}
-(void)passwordEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.affirmPasswordTextField.text.length > 0 ) {
            self.submitBtn.enabled = YES;
            self.submitBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
            [self.submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        } else {
            self.submitBtn.enabled = NO;
            self.submitBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
            [self.submitBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
        }
    }
    else {
        self.submitBtn.enabled = NO;
        self.submitBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [self.submitBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }

    
}
#pragma mark - 确认密码
-(UITextField *)affirmPasswordTextField {
    
    if (!_affirmPasswordTextField) {
        _affirmPasswordTextField = [UITextField setUpTextFieldForPubilc];
        _affirmPasswordTextField.delegate = self;
        _affirmPasswordTextField.keyboardType = UIKeyboardTypeNumberPad;
        _affirmPasswordTextField.placeholder = @"请再次输入密码";
        [_affirmPasswordTextField addTarget:self action:@selector(affirmPasswordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _affirmPasswordTextField;
}
-(UILabel *)affirmPasswordLab {
    
    if (!_affirmPasswordLab) {
        _affirmPasswordLab = [[UILabel alloc]init];
        _affirmPasswordLab.textAlignment = NSTextAlignmentLeft;
        _affirmPasswordLab.backgroundColor = [UIColor whiteColor];
        _affirmPasswordLab.textColor = [UIColor colorWithHex:@"333333"];
        _affirmPasswordLab.font = [UIFont systemFontOfSize:16];
        _affirmPasswordLab.text = @"确认密码";
    }
    return _affirmPasswordLab;
}
-(void)affirmPasswordEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.passwordTextField.text.length > 0 ) {
            self.submitBtn.enabled = YES;
            self.submitBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
            [self.submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        } else {
            self.submitBtn.enabled = NO;
            self.submitBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
            [self.submitBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
        }
    }
    else {
        self.submitBtn.enabled = NO;
        self.submitBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [self.submitBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
    
    
}
#pragma mark - 提交
- (UIButton *)submitBtn
{
    if (!_submitBtn) {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
        _submitBtn.layer.masksToBounds = YES;
        _submitBtn.layer.cornerRadius = 4;
        _submitBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_submitBtn setTitle:@"立即提交" forState:UIControlStateNormal];
        [_submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submitBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_submitBtn addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
        _submitBtn.enabled = NO;
        
        // 用户未输入时，按钮禁用
        _submitBtn.enabled = NO;
        _submitBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [_submitBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
    return _submitBtn;
}
-(void)submitAction {
    [self.view endEditing:YES];
    [self hideHUDWithOnlyMessage:@"点击了立即提交按钮"];
}
@end
