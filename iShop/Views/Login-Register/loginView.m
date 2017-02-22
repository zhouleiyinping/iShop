//
//  loginView.m
//  iShop
//
//  Created by 周磊 on 2017/2/20.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "loginView.h"

@interface loginView ()
/**
 *  背景
 */
@property (nonatomic,strong) UIView *bgView;


@end

@implementation loginView
-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.userNameTxtfield];
        [self.bgView addSubview:self.passwordTxtfield];
        [self addSubview:self.loginBtn];
        [self.bgView addSubview:self.showCodeBtn];
        [self addSubview:self.forgetBtn];
        [self addSubview:self.rememberBtn];
        [self.bgView addSubview:self.userNameLab];
        [self.bgView addSubview:self.passwordLab];
        [self addSubview:self.hintLab];
        [self setupConstraints];
        
    }
    return self;
}

- (void)setupConstraints {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(10);
        make.height.offset(90.5);
    }];

    [self.userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.top.equalTo(self.bgView).offset(0);
        make.width.offset(50);
        make.height.offset(45);
    }];
    
    [self.userNameTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameLab.mas_right).offset(30);
        make.right.equalTo(self.bgView).offset(-30);
        make.top.equalTo(self.bgView).offset(0);
        make.height.offset(45);
    }];
    
    [self.passwordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.top.equalTo(self.userNameLab.mas_bottom).offset(0.5);
        make.width.offset(50);
        make.height.offset(45);
    }];
    
    [self.passwordTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameLab.mas_right).offset(30);
        make.right.equalTo(self.bgView).offset(-50);
        make.top.equalTo(self.userNameLab.mas_bottom).offset(0.5);
        make.height.offset(45);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorWithHex:@"f5f5f5"];
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).offset(0);
        make.centerY.equalTo(self.bgView.mas_centerY).offset(0);
        make.height.offset(0.5);
    }];
    
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).offset(10);
        make.right.equalTo(self).offset(-20);
        make.size.mas_equalTo(CGSizeMake(80, 30));
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.mas_equalTo(self.forgetBtn.mas_bottom).offset(20);
        make.height.mas_equalTo(45);
    }];
    
    [self.showCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.size.mas_equalTo(CGSizeMake(40, 30));
        make.centerY.mas_equalTo(self.passwordTxtfield.mas_centerY);
    }];
    
    [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(30);
    }];
    
    [self.rememberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.centerY.equalTo(self.forgetBtn.mas_centerY).offset(0);
    }];
}

-(UIButton *)rememberBtn {
    
    if (!_rememberBtn) {
        _rememberBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_rememberBtn setImage:kGetImage(@"btn_login_hideCode") forState:UIControlStateNormal];
        [_rememberBtn setExclusiveTouch:YES];
        _rememberBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [_rememberBtn setTitle:@"记住密码" forState:UIControlStateNormal];
        [_rememberBtn setTitleColor:[UIColor colorWithHex:@"#666666"] forState:UIControlStateNormal];
        _rememberBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_rememberBtn addTarget:self action:@selector(onButtonActionBack:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rememberBtn;
}


-(UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

-(UITextField *)userNameTxtfield {
    
    if (!_userNameTxtfield) {
        _userNameTxtfield = [UITextField setUpTextFieldForPubilc];
        _userNameTxtfield.delegate = self;
        _userNameTxtfield.keyboardType = UIKeyboardTypeDefault;
        _userNameTxtfield.placeholder = @"手机号/用户名";
        [_userNameTxtfield addTarget:self action:@selector(userNameEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _userNameTxtfield;
}
- (UITextField *)passwordTxtfield {
    
    if (!_passwordTxtfield) {
        _passwordTxtfield = [UITextField setUpTextFieldForPubilc];
        _passwordTxtfield.delegate = self;
        _passwordTxtfield.returnKeyType = UIReturnKeyDone;
        _passwordTxtfield.keyboardType = UIKeyboardTypeASCIICapable;
        _passwordTxtfield.placeholder = @"输入密码";
        _passwordTxtfield.secureTextEntry = YES;
        [_passwordTxtfield addTarget:self action:@selector(passwordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _passwordTxtfield;
}

- (UIButton *)showCodeBtn
{
    if (!_showCodeBtn) {
        _showCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _showCodeBtn.backgroundColor = [UIColor clearColor];
        [_showCodeBtn setImage:[UIImage imageNamed:@"btn_login_hideCode"] forState:UIControlStateNormal];
        [_showCodeBtn setImage:[UIImage imageNamed:@"btn_login_showCode"] forState:UIControlStateSelected];
        [_showCodeBtn addTarget:self action:@selector(showOrHidePassword:) forControlEvents:UIControlEventTouchUpInside];
        _showCodeBtn.selected = NO;
    }
    return _showCodeBtn;
}

- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 4;
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn.enabled = NO;
        
        // 用户未输入时，按钮禁用
        _loginBtn.enabled = NO;
        _loginBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [_loginBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
    return _loginBtn;
}

- (UIButton *)forgetBtn
{
    if (!_forgetBtn) {
        _forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetBtn.backgroundColor = [UIColor clearColor];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:[UIColor colorWithString:@"#666666"] forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_forgetBtn addTarget:self action:@selector(forgetAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}

-(UILabel *)userNameLab {
    
    if (!_userNameLab) {
        _userNameLab = [[UILabel alloc]init];
        _userNameLab.backgroundColor = [UIColor whiteColor];
        _userNameLab.textColor = [UIColor colorWithHex:@"333333"];
        _userNameLab.font = [UIFont systemFontOfSize:16];
        _userNameLab.text = @"用户名";
    }
    return _userNameLab;
}

-(UILabel *)passwordLab {
    
    if (!_passwordLab) {
        _passwordLab = [[UILabel alloc]init];
        _passwordLab.textColor = [UIColor colorWithHex:@"333333"];
        _passwordLab.font = [UIFont systemFontOfSize:16];
        _passwordLab.text = @"密 码";
    }
    return _passwordLab;
}

- (UILabel *)hintLab
{
    if (!_hintLab) {
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"*为保证资金安全，如未绑定手机号请前往安全中心绑定"];
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attrString.length)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#eb203b"] range:NSMakeRange(0, 1)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#666666"] range:NSMakeRange(1, attrString.length - 1)];
        
        _hintLab = [UILabel new];
        _hintLab.backgroundColor = [UIColor clearColor];
        _hintLab.textAlignment = NSTextAlignmentLeft;
        _hintLab.font = [UIFont systemFontOfSize:14];
        _hintLab.attributedText = attrString;
        _hintLab.numberOfLines = 0;
        _hintLab.userInteractionEnabled = YES;
    }
    return _hintLab;
}

-(void)userNameEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.passwordTxtfield.text.length > 0) {
            self.loginBtn.enabled = YES;
            self.loginBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
            [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
        } else {
            self.loginBtn.enabled = NO;
            self.loginBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
            [self.loginBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
        }
    }
    else {
        self.loginBtn.enabled = NO;
        self.loginBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [self.loginBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
}
-(void)passwordEditingChanged:(UITextField *)textField {
    if (textField.text.length > 0) {
        if (self.userNameTxtfield.text.length > 0) {
            self.loginBtn.enabled = YES;
            self.loginBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
            [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }  else {
            self.loginBtn.enabled = NO;
            self.loginBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
            [self.loginBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
        }
    } else {
        self.loginBtn.enabled = NO;
        self.loginBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [self.loginBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
}
/**
 *  忘记密码
 */
-(void)forgetAction {
    
    if (self.forgetPasswordBlock) {
        self.forgetPasswordBlock();
    }
    
}
-(void)loginAction {
    
    // 隐藏键盘
    [self endEditing:YES];
    
    if ([self checkLoginContent] == NO) {
        // 内容非法
        return;
    }
    
    if (self.loginBlock) {
        self.loginBlock();
    }
}
// 显示/隐藏密码
- (void)showOrHidePassword:(UIButton *)button {
    
    self.showCodeBtn.selected = !self.showCodeBtn.selected;
    
    if (self.showCodeBtn.selected) {
        // 显示密码
        self.passwordTxtfield.secureTextEntry = NO;
    }
    else {
        // 隐藏密码
        self.passwordTxtfield.secureTextEntry = YES;
    }
}

-(void)onButtonActionBack:(UIButton *)button {
    
    self.rememberBtn.selected = !self.rememberBtn.selected;

    if (self.rememberBtn.selected) {
        
        [_rememberBtn setTitleColor:[UIColor colorWithHex:@"#eb203b"] forState:UIControlStateNormal];
        [_rememberBtn setImage:kGetImage(@"btn_login_showCode") forState:UIControlStateNormal];

    }else {
        
        [_rememberBtn setImage:kGetImage(@"btn_login_hideCode") forState:UIControlStateNormal];
        [_rememberBtn setTitleColor:[UIColor colorWithHex:@"#666666"] forState:UIControlStateNormal];
    }
    
}

- (BOOL)checkLoginContent {
    
    
    NSString *userName = [self getInputUserName];
    NSString *password = [self getInputPassword];
    
    if (userName != nil && userName.length > 0) {
        // 长度限制
    } else {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"手机号/用户名不能为空"];
        return NO;
    }
    
    if (password != nil && password.length > 0) {
        // 长度限制
    } else {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"密码不能为空"];
        return NO;
    }
    
    return YES;
}

- (NSString *)getInputUserName
{
    return [self.userNameTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)getInputPassword
{
    return [self.passwordTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.userNameTxtfield) {
        [textField resignFirstResponder];
        [self.passwordTxtfield becomeFirstResponder];
    }
    else if (textField == self.passwordTxtfield) {
        [textField resignFirstResponder];
    }
    
    return YES;
}

@end
