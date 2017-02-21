//
//  AmendPasswordView.m
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AmendPasswordView.h"

@implementation AmendPasswordView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.bgView];
        [self addSubview:self.submitBtn];
        [self.bgView addSubview:self.oldPasswordTxtfield];
        [self.bgView addSubview:self.oldPasswordLab];
        [self.bgView addSubview:self.nowPasswordLab];
        [self.bgView addSubview:self.nowPasswordTxtfield];
        [self.bgView addSubview:self.affirmPasswordLab];
        [self.bgView addSubview:self.affirmPasswordTxtfield];
        [self setupConstraints];
        
    }
    return self;
}


-(void)setupConstraints {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(10);
        make.height.offset(136);
    }];
    
    [self.oldPasswordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.top.equalTo(self.bgView).offset(0);
        make.width.offset(70);
        make.height.offset(45);
    }];
    
    [self.oldPasswordTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.oldPasswordLab.mas_right).offset(20);
        make.right.equalTo(self.bgView).offset(-30);
        make.top.equalTo(self.bgView).offset(0);
        make.height.offset(45);
    }];
    
    [self.nowPasswordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.top.equalTo(self.oldPasswordLab.mas_bottom).offset(0.5);
        make.width.offset(70);
        make.height.offset(45);
    }];
    
    [self.nowPasswordTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.oldPasswordLab.mas_right).offset(20);
        make.right.equalTo(self.bgView).offset(-50);
        make.top.equalTo(self.oldPasswordLab.mas_bottom).offset(0.5);
        make.height.offset(45);
    }];
    
    [self.affirmPasswordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.top.equalTo(self.nowPasswordLab.mas_bottom).offset(0.5);
        make.width.offset(70);
        make.height.offset(45);
    }];
    
    [self.affirmPasswordTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.affirmPasswordLab.mas_right).offset(20);
        make.right.equalTo(self.bgView).offset(-50);
        make.top.equalTo(self.nowPasswordLab.mas_bottom).offset(0.5);
        make.height.offset(45);
    }];
    
    for (int i = 0; i<2; i++) {
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithHex:@"f5f5f5"];
        [self.bgView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).offset(0);
            make.top.equalTo(self.oldPasswordLab.mas_bottom).offset(i*45);
            make.height.offset(0.5);
        }];
    }
    
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.mas_equalTo(self.bgView.mas_bottom).offset(30);
        make.height.mas_equalTo(45);
    }];
    
}

-(void)submitBtnEnabledYes {
    
    self.submitBtn.enabled = YES;
    self.submitBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
    [self.submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}
-(void)submitBtnEnabledNo {
    
    self.submitBtn.enabled = NO;
    self.submitBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
    [self.submitBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    
}
- (BOOL)checkSubmitContent {
    
    NSString *oldPassword = [self.oldPasswordTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *nowPassword = [self.nowPasswordTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *affirmPassword = [self.affirmPasswordTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (oldPassword != nil && oldPassword.length > 0) {
        // 长度限制
    } else {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入原始密码"];
        return NO;
    }
    
    if (nowPassword != nil && nowPassword.length > 0) {
        // 长度限制
    } else {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入新密码"];
        return NO;
    }
    if (affirmPassword != nil && affirmPassword.length > 0) {
        // 长度限制
    } else {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"确认密码不能为空"];
        return NO;
    }
    
    if (nowPassword != affirmPassword) {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"确认密码错误"];
        return NO;
    }
    
    return YES;
}

- (NSString *)getOldPassword {
    
    return [self.oldPasswordTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
}
- (NSString *)getNowPassword {
    
    return [self.nowPasswordTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
}

-(UIView *)bgView {
    
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

#pragma mark - 原始密码
-(UITextField *)oldPasswordTxtfield {
    
    if (!_oldPasswordTxtfield) {
        _oldPasswordTxtfield = [UITextField new];
        _oldPasswordTxtfield.delegate = self;
        _oldPasswordTxtfield.backgroundColor = [UIColor whiteColor];
        _oldPasswordTxtfield.font = [UIFont systemFontOfSize:15];
        _oldPasswordTxtfield.returnKeyType = UIReturnKeyNext;
        _oldPasswordTxtfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _oldPasswordTxtfield.keyboardType = UIKeyboardTypeASCIICapable;
        _oldPasswordTxtfield.placeholder = @"请输入原始密码";
        _oldPasswordTxtfield.borderStyle = UITextBorderStyleNone;
        _oldPasswordTxtfield.secureTextEntry = YES;
        _oldPasswordTxtfield.autocorrectionType = UITextAutocorrectionTypeNo;
        [_oldPasswordTxtfield addTarget:self action:@selector(oldPasswordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _oldPasswordTxtfield;
}
-(void)oldPasswordEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.nowPasswordTxtfield.text.length > 0 && self.affirmPasswordTxtfield.text.length > 0) {
            [self submitBtnEnabledYes];
        }  else {
            [self submitBtnEnabledNo];
        }
    } else {
        [self submitBtnEnabledNo];
    }
    
}
#pragma mark - 密码
- (UITextField *)nowPasswordTxtfield {
    
    if (!_nowPasswordTxtfield) {
        _nowPasswordTxtfield = [UITextField new];
        _nowPasswordTxtfield.delegate = self;
        _nowPasswordTxtfield.font = [UIFont systemFontOfSize:15];
        _nowPasswordTxtfield.returnKeyType = UIReturnKeyDone;
        _nowPasswordTxtfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _nowPasswordTxtfield.keyboardType = UIKeyboardTypeASCIICapable;
        _nowPasswordTxtfield.placeholder = @"由6~15位字符组成";
        _nowPasswordTxtfield.borderStyle = UITextBorderStyleNone;
        _nowPasswordTxtfield.secureTextEntry = YES;
        _nowPasswordTxtfield.autocorrectionType = UITextAutocorrectionTypeNo;
        [_nowPasswordTxtfield addTarget:self action:@selector(nowPasswordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _nowPasswordTxtfield;
}
-(void)nowPasswordEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.oldPasswordTxtfield.text.length > 0 && self.affirmPasswordTxtfield.text.length > 0) {
            [self submitBtnEnabledYes];
        }  else {
            [self submitBtnEnabledNo];
        }
    } else {
        [self submitBtnEnabledNo];
    }
}
#pragma mark - 确认密码
- (UITextField *)affirmPasswordTxtfield {
    
    if (!_affirmPasswordTxtfield) {
        _affirmPasswordTxtfield = [UITextField new];
        _affirmPasswordTxtfield.delegate = self;
        _affirmPasswordTxtfield.font = [UIFont systemFontOfSize:15];
        _affirmPasswordTxtfield.returnKeyType = UIReturnKeyDone;
        _affirmPasswordTxtfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _affirmPasswordTxtfield.keyboardType = UIKeyboardTypeASCIICapable;
        _affirmPasswordTxtfield.placeholder = @"请再次输入新密码";
        _affirmPasswordTxtfield.borderStyle = UITextBorderStyleNone;
        _affirmPasswordTxtfield.secureTextEntry = YES;
        _affirmPasswordTxtfield.autocorrectionType = UITextAutocorrectionTypeNo;
        [_affirmPasswordTxtfield addTarget:self action:@selector(affirmPasswordEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _affirmPasswordTxtfield;
}
-(void)affirmPasswordEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.oldPasswordTxtfield.text.length > 0 && self.nowPasswordTxtfield.text.length > 0) {
            [self submitBtnEnabledYes];
        }  else {
            [self submitBtnEnabledNo];
        }
    } else {
        [self submitBtnEnabledNo];
    }
    
}

-(UILabel *)oldPasswordLab {
    
    if (!_oldPasswordLab) {
        _oldPasswordLab = [[UILabel alloc]init];
        _oldPasswordLab.backgroundColor = [UIColor whiteColor];
        _oldPasswordLab.textColor = [UIColor colorWithHex:@"333333"];
        _oldPasswordLab.font = [UIFont systemFontOfSize:16];
        _oldPasswordLab.text = @"原始密码";
    }
    return _oldPasswordLab;
}

-(UILabel *)nowPasswordLab {
    
    if (!_nowPasswordLab) {
        _nowPasswordLab = [[UILabel alloc]init];
        _nowPasswordLab.textColor = [UIColor colorWithHex:@"333333"];
        _nowPasswordLab.font = [UIFont systemFontOfSize:16];
        _nowPasswordLab.text = @"新密码";
    }
    return _nowPasswordLab;
}
-(UILabel *)affirmPasswordLab {
    
    if (!_affirmPasswordLab) {
        _affirmPasswordLab = [[UILabel alloc]init];
        _affirmPasswordLab.textColor = [UIColor colorWithHex:@"333333"];
        _affirmPasswordLab.font = [UIFont systemFontOfSize:16];
        _affirmPasswordLab.text = @"确认密码";
    }
    return _affirmPasswordLab;
}
#pragma mark - 注册
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
        [_submitBtn addTarget:self action:@selector(submitBtnAction) forControlEvents:UIControlEventTouchUpInside];
        _submitBtn.enabled = NO;
        
        // 用户未输入时，按钮禁用
        _submitBtn.enabled = NO;
        _submitBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [_submitBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
    return _submitBtn;
}
-(void)submitBtnAction {
    
    // 隐藏键盘
    [self endEditing:YES];
    
    if ([self checkSubmitContent] == NO) {
        
        return;
    }
    
    if (self.submitBlock) {
        self.submitBlock();
    }
}


@end
