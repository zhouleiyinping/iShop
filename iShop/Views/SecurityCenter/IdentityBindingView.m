//
//  IdentityBindingView.m
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "IdentityBindingView.h"

@implementation IdentityBindingView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.bgView];
        [self addSubview:self.hintLab];
        [self.bgView addSubview:self.userNameLab];
        [self.bgView addSubview:self.userName];
        [self.bgView addSubview:self.realNameLab];
        [self.bgView addSubview:self.realNameTxtfield];
        [self.bgView addSubview:self.identityCodeLab];
        [self.bgView addSubview:self.identityCodeTxtfield];
        [self addSubview:self.bindingBtn];
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
    
    [self.userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).offset(0);
        make.left.equalTo(self.bgView).offset(20);
        make.height.offset(45);
    }];
    
    [self.realNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameLab.mas_bottom).offset(0);
        make.left.equalTo(self.bgView).offset(20);
        make.height.offset(45);
    }];
    [self.realNameTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.realNameLab.mas_centerY).offset(0);
        make.left.equalTo(self.realNameLab.mas_right).offset(30);
        make.height.offset(45);

    }];
    [self.identityCodeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.realNameLab.mas_bottom).offset(0);
        make.left.equalTo(self.bgView).offset(20);
        make.height.offset(45);
    }];
    
    [self.identityCodeTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.identityCodeLab.mas_centerY).offset(0);
        make.left.equalTo(self.identityCodeLab.mas_right).offset(30);
        make.height.offset(45);
    }];
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.userNameLab.mas_centerY).offset(0);
        make.left.equalTo(self.realNameLab.mas_right).offset(30);
    }];

    
    for (int i = 0; i<2; i++) {
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithHex:@"f5f5f5"];
        [self.bgView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).offset(0);
            make.top.equalTo(self.userNameLab.mas_bottom).offset(i*45);
            make.height.offset(0.5);
        }];
    }
    
    [self.bindingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.mas_equalTo(self.bgView.mas_bottom).offset(30);
        make.height.mas_equalTo(45);
    }];
    
    [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.mas_equalTo(self.bindingBtn.mas_bottom).offset(30);

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
-(UILabel *)userName {
    
    if (!_userName) {
        _userName = [UILabel new];
        _userName.backgroundColor = [UIColor whiteColor];
        _userName.textColor = [UIColor colorWithHex:@"666666"];
        _userName.font = [UIFont systemFontOfSize:16];
        _userName.text = @"我要中大奖";
        
    }
    return _userName;
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
#pragma mark - 真实姓名
-(UITextField *)realNameTxtfield {
    
    if (!_realNameTxtfield) {
        _realNameTxtfield = [UITextField setUpTextFieldForPubilc];
        _realNameTxtfield.delegate = self;
        _realNameTxtfield.textColor = [UIColor colorWithHex:@"666666"];
        _realNameTxtfield.keyboardType = UIKeyboardTypeDefault;
        _realNameTxtfield.placeholder = @"请与身份证上保持一致";
        [_realNameTxtfield addTarget:self action:@selector(realNameEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _realNameTxtfield;
}
-(UILabel *)realNameLab {
    
    if (!_realNameLab) {
        _realNameLab = [[UILabel alloc]init];
        _realNameLab.backgroundColor = [UIColor whiteColor];
        _realNameLab.textColor = [UIColor colorWithHex:@"333333"];
        _realNameLab.font = [UIFont systemFontOfSize:16];
        _realNameLab.text = @"真实姓名";
    }
    return _realNameLab;
}
-(void)realNameEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.identityCodeTxtfield.text.length > 0) {
            
            self.bindingBtn.enabled = YES;
            self.bindingBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
            [self.bindingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }  else {
            self.bindingBtn.enabled = NO;
            self.bindingBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
            [self.bindingBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
        }
    } else {
        self.bindingBtn.enabled = NO;
        self.bindingBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [self.bindingBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
}
#pragma mark - 身份证号
-(UITextField *)identityCodeTxtfield {
    
    if (!_identityCodeTxtfield) {
        _identityCodeTxtfield = [UITextField setUpTextFieldForPubilc];
        _identityCodeTxtfield.delegate = self;
        _identityCodeTxtfield.textColor = [UIColor colorWithHex:@"666666"];
        _identityCodeTxtfield.keyboardType = UIKeyboardTypeNumberPad;
        _identityCodeTxtfield.placeholder = @"请输入真实有效的身份证号";
        [_identityCodeTxtfield addTarget:self action:@selector(identityCodeEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _identityCodeTxtfield;
}
-(UILabel *)identityCodeLab {
    
    if (!_identityCodeLab) {
        _identityCodeLab = [[UILabel alloc]init];
        _identityCodeLab.backgroundColor = [UIColor whiteColor];
        _identityCodeLab.textColor = [UIColor colorWithHex:@"333333"];
        _identityCodeLab.font = [UIFont systemFontOfSize:16];
        _identityCodeLab.text = @"身份证号";
    }
    return _identityCodeLab;
}
-(void)identityCodeEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.realNameTxtfield.text.length > 0) {
            
            self.bindingBtn.enabled = YES;
            self.bindingBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
            [self.bindingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }  else {
            self.bindingBtn.enabled = NO;
            self.bindingBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
            [self.bindingBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
        }
    } else {
        self.bindingBtn.enabled = NO;
        self.bindingBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [self.bindingBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
}

#pragma mark - 安全提示
- (UILabel *)hintLab {
    
    if (!_hintLab) {
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"*身份信息提交后不可修改，请填写真实有效的身份信息"];
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
#pragma mark - 绑定
- (UIButton *)bindingBtn
{
    if (!_bindingBtn) {
        _bindingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bindingBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
        _bindingBtn.layer.masksToBounds = YES;
        _bindingBtn.layer.cornerRadius = 4;
        _bindingBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_bindingBtn setTitle:@"立即绑定" forState:UIControlStateNormal];
        [_bindingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bindingBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_bindingBtn addTarget:self action:@selector(bindingAction) forControlEvents:UIControlEventTouchUpInside];
        _bindingBtn.enabled = NO;
        
        // 用户未输入时，按钮禁用
        _bindingBtn.enabled = NO;
        _bindingBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [_bindingBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
    return _bindingBtn;
}
-(void)bindingAction {
    
    [self endEditing:YES];
    
    if ([self checkBindingContent] == NO) {
        // 内容非法
        return;
    }
    if (self.bindingBlock) {
        self.bindingBlock();
    }
    
}
- (BOOL)checkBindingContent {
    
    
    NSString *realName = [self.realNameTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *identityCode = [self.identityCodeTxtfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (realName != nil && realName.length > 0) {
        // 长度限制
        
        if ([NSString isChinese:realName] == NO) {
            
            [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入真实有效的姓名"];
            return NO;
        }
        
    } else {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入真实姓名"];
        return NO;
    }
    
    if (identityCode != nil && identityCode.length > 0) {

        //验证身份证号的真实性
        if ([NSString verifyIDCardNumber:identityCode] == NO) {
            [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入真实有效的身份证号"];
            return NO;
        }
        
    } else {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入身份证号"];
        return NO;
    }
    
    return YES;
}




@end
