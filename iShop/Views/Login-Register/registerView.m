//
//  registerView.m
//  iShop
//
//  Created by 周磊 on 2017/2/20.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "registerView.h"

@interface registerView ()
/**
 *  背景
 */
@property (nonatomic,strong) UIView *bgView;

@end

@implementation registerView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.userNameTxtfield];
        [self.bgView addSubview:self.passwordTxtfield];
        [self addSubview:self.registerBtn];
        [self.bgView addSubview:self.showCodeBtn1];
        [self.bgView addSubview:self.showCodeBtn2];
        [self addSubview:self.hintLab];
        [self.bgView addSubview:self.userNameLab];
        [self.bgView addSubview:self.passwordLab];
        [self.bgView addSubview:self.affirmPasswordLab];
        [self.bgView addSubview:self.affirmPasswordTxtfield];
        [self addSubview:self.readClauseBtn];

        [self setupConstraints];
        
    }
    return self;
}
- (void)setupConstraints {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(10);
        make.height.offset(136);
    }];
    [self.userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.top.equalTo(self.bgView).offset(0);
        make.width.offset(70);
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
        make.width.offset(70);
        make.height.offset(45);
    }];
    
    [self.passwordTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameLab.mas_right).offset(30);
        make.right.equalTo(self.bgView).offset(-50);
        make.top.equalTo(self.userNameLab.mas_bottom).offset(0.5);
        make.height.offset(45);
    }];
    
    [self.affirmPasswordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.top.equalTo(self.passwordLab.mas_bottom).offset(0.5);
        make.width.offset(70);
        make.height.offset(45);
    }];
    
    [self.affirmPasswordTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.affirmPasswordLab.mas_right).offset(30);
        make.right.equalTo(self.bgView).offset(-50);
        make.top.equalTo(self.passwordLab.mas_bottom).offset(0.5);
        make.height.offset(45);
    }];

    for (int i = 0; i<2; i++) {
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithHex:@"f5f5f5"];
        [self.bgView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).offset(0);
            make.top.equalTo(self.userNameTxtfield.mas_bottom).offset(i*45);
            make.height.offset(0.5);
        }];
    }
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.mas_equalTo(self.bgView.mas_bottom).offset(45);
        make.height.mas_equalTo(45);
    }];
    
    [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.equalTo(self.registerBtn.mas_bottom).offset(30);
    }];
    
    [self.readClauseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self.bgView.mas_bottom).offset(0);
        make.height.offset(45);
    }];
    
    [self.showCodeBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.mas_trailing).offset(-10);
        make.size.mas_equalTo(CGSizeMake(40, 30));
        make.centerY.mas_equalTo(self.passwordTxtfield.mas_centerY);
    }];
    [self.showCodeBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.mas_trailing).offset(-10);
        make.size.mas_equalTo(CGSizeMake(40, 30));
        make.centerY.mas_equalTo(self.affirmPasswordTxtfield.mas_centerY);
    }];
    
}


-(UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
#pragma mark - 用户名
-(UITextField *)userNameTxtfield {
    
    if (!_userNameTxtfield) {
        _userNameTxtfield = [UITextField new];
        _userNameTxtfield.delegate = self;
        _userNameTxtfield.backgroundColor = [UIColor whiteColor];
        _userNameTxtfield.font = [UIFont systemFontOfSize:15];
        _userNameTxtfield.returnKeyType = UIReturnKeyNext;
        _userNameTxtfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userNameTxtfield.keyboardType = UIKeyboardTypeDefault;
        _userNameTxtfield.placeholder = @"由4~16个字符组成";
        _userNameTxtfield.borderStyle = UITextBorderStyleNone;
        _userNameTxtfield.autocorrectionType = UITextAutocorrectionTypeNo;
        [_userNameTxtfield addTarget:self action:@selector(userNameEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _userNameTxtfield;
}
-(void)userNameEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.passwordTxtfield.text.length > 0 && self.affirmPasswordTxtfield.text.length > 0 && self.readClauseBtn.selected == YES) {
                [self registerBtnEnabledYes];
            
        }  else {
            [self registerBtnEnabledNo];
        }
    } else {
         [self registerBtnEnabledNo];
    }
}
#pragma mark - 密码
- (UITextField *)passwordTxtfield {
    
    if (!_passwordTxtfield) {
        _passwordTxtfield = [UITextField new];
        _passwordTxtfield.delegate = self;
        _passwordTxtfield.font = [UIFont systemFontOfSize:15];
        _passwordTxtfield.returnKeyType = UIReturnKeyDone;
        _passwordTxtfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTxtfield.keyboardType = UIKeyboardTypeASCIICapable;
        _passwordTxtfield.placeholder = @"由4~20个字符组成";
        _passwordTxtfield.borderStyle = UITextBorderStyleNone;
        _passwordTxtfield.secureTextEntry = YES;
        _passwordTxtfield.autocorrectionType = UITextAutocorrectionTypeNo;
        [_passwordTxtfield addTarget:self action:@selector(passwordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _passwordTxtfield;
}
-(void)passwordEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.userNameTxtfield.text.length > 0 && self.affirmPasswordTxtfield.text.length > 0 && self.readClauseBtn.selected == YES) {
            [self registerBtnEnabledYes];
        }  else {
             [self registerBtnEnabledNo];
        }
    } else {
        [self registerBtnEnabledNo];
    }
}
#pragma mark - 再次输入密码
- (UITextField *)affirmPasswordTxtfield {
    
    if (!_affirmPasswordTxtfield) {
        _affirmPasswordTxtfield = [UITextField new];
        _affirmPasswordTxtfield.delegate = self;
        _affirmPasswordTxtfield.font = [UIFont systemFontOfSize:15];
        _affirmPasswordTxtfield.returnKeyType = UIReturnKeyDone;
        _affirmPasswordTxtfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _affirmPasswordTxtfield.keyboardType = UIKeyboardTypeASCIICapable;
        _affirmPasswordTxtfield.placeholder = @"请再次输入密码";
        _affirmPasswordTxtfield.borderStyle = UITextBorderStyleNone;
        _affirmPasswordTxtfield.secureTextEntry = YES;
        _affirmPasswordTxtfield.autocorrectionType = UITextAutocorrectionTypeNo;
        [_affirmPasswordTxtfield addTarget:self action:@selector(affirmPasswordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _affirmPasswordTxtfield;
}
-(void)affirmPasswordEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.userNameTxtfield.text.length > 0 && self.passwordTxtfield.text.length > 0 && self.readClauseBtn.selected == YES) {
             [self registerBtnEnabledYes];
            
        }  else {
             [self registerBtnEnabledNo];
        }
    } else {
        [self registerBtnEnabledNo];
    }
}
#pragma mark - 显示密码
- (UIButton *)showCodeBtn1
{
    if (!_showCodeBtn1) {
        _showCodeBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _showCodeBtn1.backgroundColor = [UIColor clearColor];
        [_showCodeBtn1 setImage:[UIImage imageNamed:@"btn_login_hideCode"] forState:UIControlStateNormal];
        [_showCodeBtn1 setImage:[UIImage imageNamed:@"btn_login_showCode"] forState:UIControlStateSelected];
        [_showCodeBtn1 addTarget:self action:@selector(showOrHidePassword1:) forControlEvents:UIControlEventTouchUpInside];
        _showCodeBtn1.selected = NO;
    }
    return _showCodeBtn1;
}
- (UIButton *)showCodeBtn2
{
    if (!_showCodeBtn2) {
        _showCodeBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _showCodeBtn2.backgroundColor = [UIColor clearColor];
        [_showCodeBtn2 setImage:[UIImage imageNamed:@"btn_login_hideCode"] forState:UIControlStateNormal];
        [_showCodeBtn2 setImage:[UIImage imageNamed:@"btn_login_showCode"] forState:UIControlStateSelected];
        [_showCodeBtn2 addTarget:self action:@selector(showOrHidePassword2:) forControlEvents:UIControlEventTouchUpInside];
        _showCodeBtn2.selected = NO;
    }
    return _showCodeBtn2;
}

-(void)showOrHidePassword1:(UIButton *)button {
    
    self.showCodeBtn1.selected = !self.showCodeBtn1.selected;
    
    if (self.showCodeBtn1.selected) {
        // 显示密码
        self.passwordTxtfield.secureTextEntry = NO;
    }
    else {
        // 隐藏密码
        self.passwordTxtfield.secureTextEntry = YES;
    }
}
-(void)showOrHidePassword2:(UIButton *)button {
    
    self.showCodeBtn2.selected = !self.showCodeBtn2.selected;
    
    if (self.showCodeBtn2.selected) {
        // 显示密码
        self.affirmPasswordTxtfield.secureTextEntry = NO;
    }
    else {
        // 隐藏密码
        self.affirmPasswordTxtfield.secureTextEntry = YES;
    }
}

#pragma mark - 注册
- (UIButton *)registerBtn
{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
        _registerBtn.layer.masksToBounds = YES;
        _registerBtn.layer.cornerRadius = 4;
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_registerBtn setTitle:@"注  册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
        _registerBtn.enabled = NO;
        
        // 用户未输入时，按钮禁用
        _registerBtn.enabled = NO;
        _registerBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [_registerBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
    return _registerBtn;
}
-(void)registerAction {
    
    // 隐藏键盘
    [self endEditing:YES];
    
    if ([self checkRegisterContent] == NO) {
        // 内容非法
        return;
    }
    if (self.registerBlock) {
        self.registerBlock();
    }
    
    
}
- (BOOL)checkRegisterContent {
    
    
    NSString *userName = [self getInputUserName];
    NSString *password = [self getInputPassword];
    NSString *affirmPassword = [self getInputaffirmPassword];
    
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
    if (affirmPassword != nil && affirmPassword.length > 0) {
        // 长度限制
    } else {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"确认密码不能为空"];
        return NO;
    }
    
    if (password != affirmPassword) {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"确认密码错误"];
        return NO;
    }
    
    return YES;
}

#pragma mark - 同意服务条款
-(UIButton *)readClauseBtn {
    
    if (!_readClauseBtn) {
        _readClauseBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_readClauseBtn setImage:kGetImage(@"btn_login_hideCode") forState:UIControlStateNormal];
        [_readClauseBtn setExclusiveTouch:YES];
        _readClauseBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [_readClauseBtn setTitle:@"我已阅读并同意《XXX服务条款》" forState:UIControlStateNormal];
        [_readClauseBtn setTitleColor:[UIColor colorWithHex:@"#666666"] forState:UIControlStateNormal];
        _readClauseBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_readClauseBtn addTarget:self action:@selector(readClauseAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _readClauseBtn;
}

-(void)readClauseAction:(UIButton *)button {
    
    self.readClauseBtn.selected = !self.readClauseBtn.selected;
    [self userNameEditingChanged:self.userNameTxtfield];

    if (self.readClauseBtn.selected) {
        
        [_readClauseBtn setTitleColor:[UIColor colorWithHex:@"#eb203b"] forState:UIControlStateNormal];
        [_readClauseBtn setImage:kGetImage(@"btn_login_showCode") forState:UIControlStateNormal];
        
    }else {
        
        [_readClauseBtn setImage:kGetImage(@"btn_login_hideCode") forState:UIControlStateNormal];
        [_readClauseBtn setTitleColor:[UIColor colorWithHex:@"#666666"] forState:UIControlStateNormal];
    }
    
}

-(UILabel *)userNameLab {
    
    if (!_userNameLab) {
        _userNameLab = [[UILabel alloc]init];
        _userNameLab.textAlignment = NSTextAlignmentLeft;
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
        _passwordLab.textAlignment = NSTextAlignmentLeft;
        _passwordLab.textColor = [UIColor colorWithHex:@"333333"];
        _passwordLab.font = [UIFont systemFontOfSize:16];
        _passwordLab.text = @"密 码";
    }
    return _passwordLab;
}
-(UILabel *)affirmPasswordLab {
    
    if (!_affirmPasswordLab) {
        _affirmPasswordLab = [[UILabel alloc]init];
        _affirmPasswordLab.textAlignment = NSTextAlignmentLeft;
        _affirmPasswordLab.textColor = [UIColor colorWithHex:@"333333"];
        _affirmPasswordLab.font = [UIFont systemFontOfSize:16];
        _affirmPasswordLab.text = @"确认密码";
        
    }
    return _affirmPasswordLab;
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

-(void)registerBtnEnabledYes {
    
    self.registerBtn.enabled = YES;
    self.registerBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
    [self.registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}
-(void)registerBtnEnabledNo {
    
    self.registerBtn.enabled = NO;
    self.registerBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
    [self.registerBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    
}
- (NSString *)getInputUserName {
    
    return [self.userNameTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)getInputPassword {
    
    return [self.passwordTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
- (NSString *)getInputaffirmPassword {
    
    return [self.affirmPasswordTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
