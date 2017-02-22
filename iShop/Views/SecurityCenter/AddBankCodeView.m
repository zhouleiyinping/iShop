
//
//  AddBankCodeView.m
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AddBankCodeView.h"

@implementation AddBankCodeView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.bgView];
        [self addSubview:self.submitBtn];
        [self addSubview:self.reminder1];
        [self addSubview:self.reminder2];
        [self addSubview:self.reminder3];
        [self addSubview:self.acquiescentBtn];
        [self.bgView addSubview:self.userNameTextField];
        [self.bgView addSubview:self.userNameLab];
        [self.bgView addSubview:self.bankCodeTextField];
        [self.bgView addSubview:self.bankCodeLab];
        [self.bgView addSubview:self.depositBankLab];
        [self.bgView addSubview:self.depositBankTitle];
        [self.bgView addSubview:self.arrowImage];
        [self setupConstraints];
        
    }
    return self;
}
-(void)setupConstraints {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.right.left.equalTo(self).offset(0);
        make.height.offset(136);
    }];
    
    [self.userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).offset(0);
        make.left.equalTo(self.bgView).offset(20);
        make.height.offset(45);
    }];
    
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.userNameLab.mas_centerY).offset(0);
        make.right.equalTo(self.bgView).offset(-20);
        make.left.equalTo(self.userNameLab.mas_right).offset(20);
        make.height.offset(45);
    }];
    
    [self.bankCodeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.userNameLab.mas_bottom).offset(0);
        make.height.offset(45);
    }];
    
    [self.bankCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bankCodeLab.mas_centerY).offset(0);
        make.left.equalTo(self.bankCodeLab.mas_right).offset(20);
        make.right.equalTo(self.bgView).offset(-20);
        make.height.offset(45);
    }];
    
    [self.depositBankTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.bankCodeLab.mas_bottom).offset(0);
        make.height.offset(45);
    }];
    
    [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.depositBankTitle.mas_centerY).offset(0);
        make.right.equalTo(self.bgView).offset(-20);
    }];
    
    [self.depositBankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView).offset(-40);
        make.centerY.equalTo(self.depositBankTitle.mas_centerY).offset(0);
        make.left.equalTo(self.depositBankTitle.mas_right).offset(20);
        make.height.offset(45);
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
    
    [self.acquiescentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self.bgView.mas_bottom).offset(20);
    }];
    
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.offset(45);
        make.top.equalTo(self.acquiescentBtn.mas_bottom).offset(20);
    }];

    [self.reminder1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.submitBtn.mas_bottom).offset(20);
    }];
    [self.reminder2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.reminder1.mas_bottom).offset(0);
    }];
    [self.reminder3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.reminder2.mas_bottom).offset(0);
    }];
}
-(UIView *)bgView {
    
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
#pragma mark - 开户姓名
-(UITextField *)userNameTextField {
    
    if (!_userNameTextField) {
        _userNameTextField = [UITextField setUpTextFieldForPubilc];
        _userNameTextField.delegate = self;
        _userNameTextField.keyboardType = UIKeyboardTypeDefault;
        _userNameTextField.placeholder = @"请输入真实姓名";
        [_userNameTextField addTarget:self action:@selector(userNameEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _userNameTextField;
}
-(void)userNameEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.bankCodeTextField.text.length > 0) {
            [self submitBtnEnabledYes];
            
        } else {
            [self submitBtnEnabledNo];
        }
    }
    else {
        [self submitBtnEnabledNo];
    }
}

-(UILabel *)userNameLab {
    
    if (!_userNameLab) {
        _userNameLab = [[UILabel alloc]init];
        _userNameLab.textAlignment = NSTextAlignmentLeft;
        _userNameLab.backgroundColor = [UIColor whiteColor];
        _userNameLab.textColor = [UIColor colorWithHex:@"333333"];
        _userNameLab.font = [UIFont systemFontOfSize:16];
        _userNameLab.text = @"开户姓名";
    }
    return _userNameLab;
}
#pragma mark - 银行卡号
-(UITextField *)bankCodeTextField {
    
    if (!_bankCodeTextField) {
        _bankCodeTextField = [UITextField setUpTextFieldForPubilc];
        _bankCodeTextField.delegate = self;
        _bankCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
        _bankCodeTextField.placeholder = @"请输入正确的银行卡号";
        [_bankCodeTextField addTarget:self action:@selector(bankCodeEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _bankCodeTextField;
}
-(void)bankCodeEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.userNameTextField.text.length > 0) {
            [self submitBtnEnabledYes];
            
        } else {
            [self submitBtnEnabledNo];
        }
    }
    else {
        [self submitBtnEnabledNo];
    }
}

-(UILabel *)bankCodeLab {
    
    if (!_bankCodeLab) {
        _bankCodeLab = [[UILabel alloc]init];
        _bankCodeLab.textAlignment = NSTextAlignmentLeft;
        _bankCodeLab.backgroundColor = [UIColor whiteColor];
        _bankCodeLab.textColor = [UIColor colorWithHex:@"333333"];
        _bankCodeLab.font = [UIFont systemFontOfSize:16];
        _bankCodeLab.text = @"银行卡号";
    }
    return _bankCodeLab;
}
#pragma mark - 开户银行
-(UILabel *)depositBankTitle {
    
    if (!_depositBankTitle) {
        _depositBankTitle = [[UILabel alloc]init];
        _depositBankTitle.textAlignment = NSTextAlignmentLeft;
        _depositBankTitle.backgroundColor = [UIColor whiteColor];
        _depositBankTitle.textColor = [UIColor colorWithHex:@"333333"];
        _depositBankTitle.font = [UIFont systemFontOfSize:16];
        _depositBankTitle.text = @"开户银行";
    }
    return _depositBankTitle;
}
-(UILabel *)depositBankLab {
    
    if (!_depositBankLab) {
        _depositBankLab = [[UILabel alloc]init];
        _depositBankLab.textAlignment = NSTextAlignmentLeft;
        _depositBankLab.backgroundColor = [UIColor whiteColor];
        _depositBankLab.textColor = [UIColor colorWithHex:@"999999"];
        _depositBankLab.font = [UIFont systemFontOfSize:15];
        _depositBankLab.text = @"请选择银行卡";
        _depositBankLab.userInteractionEnabled = YES;

        UITapGestureRecognizer *tapDepositBan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(depositBankAction)];
        [_depositBankLab addGestureRecognizer:tapDepositBan];
        
    }
    return _depositBankLab;
}
-(void) depositBankAction {
    [self endEditing:YES];
    NSLog(@"---选择银行卡--");
}
-(UIImageView *)arrowImage {
    if (!_arrowImage) {
        _arrowImage = [[UIImageView alloc]init];
        _arrowImage.image = [UIImage imageNamed:@"arrow_down"];
    }
    return _arrowImage;
}
#pragma mark - 设为默认银行卡
-(UIButton *)acquiescentBtn {
    
    if (!_acquiescentBtn) {
        _acquiescentBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_acquiescentBtn setImage:kGetImage(@"btn_login_hideCode") forState:UIControlStateNormal];
        [_acquiescentBtn setExclusiveTouch:YES];
        _acquiescentBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [_acquiescentBtn setTitle:@"将此卡设为默认银行卡" forState:UIControlStateNormal];
        [_acquiescentBtn setTitleColor:[UIColor colorWithHex:@"#666666"] forState:UIControlStateNormal];
        _acquiescentBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_acquiescentBtn addTarget:self action:@selector(acquiescentAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _acquiescentBtn;
}
-(void)acquiescentAction {
    
    self.acquiescentBtn.selected = !self.acquiescentBtn.selected;
    
    if (self.acquiescentBtn.selected) {
        
        [_acquiescentBtn setTitleColor:[UIColor colorWithHex:@"#eb203b"] forState:UIControlStateNormal];
        [_acquiescentBtn setImage:kGetImage(@"btn_login_showCode") forState:UIControlStateNormal];
        
    }else {
        
        [_acquiescentBtn setImage:kGetImage(@"btn_login_hideCode") forState:UIControlStateNormal];
        [_acquiescentBtn setTitleColor:[UIColor colorWithHex:@"#666666"] forState:UIControlStateNormal];
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
        
        // 用户未输入时，按钮禁用
        _submitBtn.enabled = NO;
        _submitBtn.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
        [_submitBtn setTitleColor:[UIColor colorWithString:@"#cccccc"] forState:UIControlStateNormal];
    }
    return _submitBtn;
}
-(void)submitAction {
    
    [self endEditing:YES];
    
    if ([self checkSubmitBtnContent] == NO) {
        // 内容非法
        return;
    }
    NSLog(@"---点击了立即提交---");

}

#pragma mark - 提示
- (UILabel *)reminder1 {
    
    if (!_reminder1) {
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"*开户姓名必须与真实姓名一致，否则提款申请将被退回"];
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attrString.length)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#eb203b"] range:NSMakeRange(0, 1)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#666666"] range:NSMakeRange(1, attrString.length - 1)];
        
        _reminder1 = [UILabel new];
        _reminder1.backgroundColor = [UIColor clearColor];
        _reminder1.textAlignment = NSTextAlignmentLeft;
        _reminder1.font = [UIFont systemFontOfSize:14];
        _reminder1.attributedText = attrString;
        _reminder1.numberOfLines = 0;
        _reminder1.userInteractionEnabled = YES;
        
    }
    return _reminder1;
}
- (UILabel *)reminder2 {
    
    if (!_reminder2) {
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"*目前暂不支持信用卡和存折提款，绑定时请使用银行借记卡(储值卡)"];
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attrString.length)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#eb203b"] range:NSMakeRange(0, 1)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#666666"] range:NSMakeRange(1, attrString.length - 1)];
        
        _reminder2 = [UILabel new];
        _reminder2.backgroundColor = [UIColor clearColor];
        _reminder2.textAlignment = NSTextAlignmentLeft;
        _reminder2.font = [UIFont systemFontOfSize:14];
        _reminder2.attributedText = attrString;
        _reminder2.numberOfLines = 0;
        _reminder2.userInteractionEnabled = YES;
        
    }
    return _reminder2;
}
- (UILabel *)reminder3 {
    
    if (!_reminder3) {
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"*如有疑问，请联系在线客服"];
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attrString.length)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#eb203b"] range:NSMakeRange(0, 1)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#eb203b"] range:NSMakeRange(attrString.length - 5, 5)];
        
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#666666"] range:NSMakeRange(1, attrString.length - 5)];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reminder3Action)];
        
        _reminder3 = [UILabel new];
        _reminder3.backgroundColor = [UIColor clearColor];
        _reminder3.textAlignment = NSTextAlignmentLeft;
        _reminder3.font = [UIFont systemFontOfSize:14];
        _reminder3.attributedText = attrString;
        _reminder3.numberOfLines = 0;
        _reminder3.userInteractionEnabled = YES;
        [_reminder3 addGestureRecognizer:tapGesture];

    }
    return _reminder3;
}
-(void)reminder3Action {
    
    NSLog(@"--联系在线客服--");
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
- (BOOL)checkSubmitBtnContent {
    
    
    NSString *userName = [self.userNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *bankCode = [self.bankCodeTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (userName != nil && userName.length > 0) {
        // 长度限制
        
        if ([NSString isChinese:userName] == NO) {
            
            [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入真实有效的姓名"];
            return NO;
        }
        
    } else {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入真实姓名"];
        return NO;
    }
    
    if (bankCode != nil && bankCode.length > 0) {
        
        //验证身份证号的真实性
        if ([NSString checkBankCodeYes:bankCode] == NO) {
            [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入真实有效的银行卡号"];
            return NO;
        }
        
    } else {
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入银行卡号"];
        return NO;
    }
    
    return YES;
}

@end
