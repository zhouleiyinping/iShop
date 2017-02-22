//
//  ChangePhoneNumberView.m
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "ChangePhoneNumberView.h"

@implementation ChangePhoneNumberView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.bgView];
        [self addSubview:self.reminderLab1];
        [self addSubview:self.reminderLab2];
        [self addSubview:self.submitBtn];
        [self.bgView addSubview:self.oldPhoneLab];
        [self.bgView addSubview:self.oldPhoneTextfield];
        [self.bgView addSubview:self.nowPhoneLab];
        [self.bgView addSubview:self.nowPhoneTextfield];
        [self.bgView addSubview:self.codeLab];
        [self.bgView addSubview:self.codeTextfield];
        [self.bgView addSubview:self.getCodeBtn];
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
    
    [self.oldPhoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).offset(0);
        make.left.equalTo(self.bgView).offset(20);
        make.height.offset(45);
    }];
    
    [self.oldPhoneTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.oldPhoneLab.mas_centerY).offset(0);
        make.right.equalTo(self.bgView).offset(-20);
        make.left.equalTo(self.oldPhoneLab.mas_right).offset(20);
        make.height.offset(45);
    }];

    [self.nowPhoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.oldPhoneLab.mas_bottom).offset(0);
        make.height.offset(45);
    }];
    
    [self.nowPhoneTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nowPhoneLab.mas_centerY).offset(0);
        make.left.equalTo(self.nowPhoneLab.mas_right).offset(20);
        make.right.equalTo(self.bgView).offset(-20);

        make.height.offset(45);
    }];
    
    [self.codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(20);
        make.top.equalTo(self.nowPhoneLab.mas_bottom).offset(0);
        make.height.offset(45);
    }];
    
    [self.codeTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.codeLab.mas_centerY).offset(0);
        make.left.equalTo(self.nowPhoneLab.mas_right).offset(20);
        make.height.offset(45);
    }];
    
    for (int i = 0; i<2; i++) {
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithHex:@"f5f5f5"];
        [self.bgView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).offset(0);
            make.top.equalTo(self.oldPhoneLab.mas_bottom).offset(i*45);
            make.height.offset(0.5);
        }];
    }
    
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.bgView.mas_bottom).offset(30);
        make.height.offset(45);
    }];
    
    [self.reminderLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.submitBtn.mas_bottom).offset(30);
    }];
    
    [self.reminderLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.reminderLab1.mas_bottom).offset(5);
    }];
    
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.codeTextfield.mas_centerY).offset(0);
        make.right.equalTo(self.bgView).offset(-10);
        make.width.offset(100);
    }];
}

-(UIView *)bgView {
    
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
#pragma mark - 原手机号
-(UITextField *)oldPhoneTextfield {
    
    if (!_oldPhoneTextfield) {
        _oldPhoneTextfield = [UITextField setUpTextFieldForPubilc];
        _oldPhoneTextfield.delegate = self;
        _oldPhoneTextfield.keyboardType = UIKeyboardTypeNumberPad;
        _oldPhoneTextfield.placeholder = @"请填写绑定的手机号码";
        [_oldPhoneTextfield addTarget:self action:@selector(oldPhoneNumberEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _oldPhoneTextfield;
}
-(UILabel *)oldPhoneLab {
    
    if (!_oldPhoneLab) {
        _oldPhoneLab = [[UILabel alloc]init];
        _oldPhoneLab.textAlignment = NSTextAlignmentLeft;
        _oldPhoneLab.backgroundColor = [UIColor whiteColor];
        _oldPhoneLab.textColor = [UIColor colorWithHex:@"333333"];
        _oldPhoneLab.font = [UIFont systemFontOfSize:16];
        _oldPhoneLab.text = @"原手机号";
    }
    return _oldPhoneLab;
}
-(void)oldPhoneNumberEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.nowPhoneTextfield.text.length > 0 && self.codeTextfield.text.length > 0) {
            [self submitBtnEnabledYes];
            
        } else {
             [self submitBtnEnabledNo];
        }
    }
    else {
         [self submitBtnEnabledNo];
    }
}

#pragma mark - 新手机号
-(UITextField *)nowPhoneTextfield {
    
    if (!_nowPhoneTextfield) {
        _nowPhoneTextfield = [UITextField setUpTextFieldForPubilc];
        _nowPhoneTextfield.delegate = self;
        _nowPhoneTextfield.keyboardType = UIKeyboardTypeNumberPad;
        _nowPhoneTextfield.placeholder = @"请输入新的11位手机号";
        [_nowPhoneTextfield addTarget:self action:@selector(nowPhoneEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _nowPhoneTextfield;
}
-(UILabel *)nowPhoneLab {
    
    if (!_nowPhoneLab) {
        _nowPhoneLab = [[UILabel alloc]init];
        _nowPhoneLab.textAlignment = NSTextAlignmentLeft;
        _nowPhoneLab.backgroundColor = [UIColor whiteColor];
        _nowPhoneLab.textColor = [UIColor colorWithHex:@"333333"];
        _nowPhoneLab.font = [UIFont systemFontOfSize:16];
        _nowPhoneLab.text = @"新手机号";
    }
    return _nowPhoneLab;
}
-(void)nowPhoneEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.oldPhoneTextfield.text.length > 0 && self.codeTextfield.text.length > 0) {
            [self submitBtnEnabledYes];
            
        } else {
            [self submitBtnEnabledNo];
        }
    }
    else {
        [self submitBtnEnabledNo];
    }
}

#pragma mark - 验证码
-(UITextField *)codeTextfield {
    
    if (!_codeTextfield) {
        _codeTextfield = [UITextField setUpTextFieldForPubilc];
        _codeTextfield.delegate = self;
        _codeTextfield.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextfield.placeholder = @"请输入收到的验证码";
        [_codeTextfield addTarget:self action:@selector(codeTextfieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _codeTextfield;
}
-(UILabel *)codeLab {
    
    if (!_codeLab) {
        _codeLab = [[UILabel alloc]init];
        _codeLab.textAlignment = NSTextAlignmentLeft;
        _codeLab.backgroundColor = [UIColor whiteColor];
        _codeLab.textColor = [UIColor colorWithHex:@"333333"];
        _codeLab.font = [UIFont systemFontOfSize:16];
        _codeLab.text = @"验证码";
    }
    return _codeLab;
}
-(void)codeTextfieldEditingChanged:(UITextField *)textField {
    
    if (textField.text.length > 0) {
        if (self.oldPhoneTextfield.text.length > 0 && self.nowPhoneTextfield.text.length > 0) {
            [self submitBtnEnabledYes];
            
        } else {
            [self submitBtnEnabledNo];
        }
    }
    else {
        [self submitBtnEnabledNo];
    }
}


#pragma mark - 提示
- (UILabel *)reminderLab1 {
    
    if (!_reminderLab1) {
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"*绑定手机后可以免费接受中奖短信通知，以及最新的活动信息"];
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attrString.length)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#eb203b"] range:NSMakeRange(0, 1)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#666666"] range:NSMakeRange(1, attrString.length - 1)];
        
        _reminderLab1 = [UILabel new];
        _reminderLab1.backgroundColor = [UIColor clearColor];
        _reminderLab1.textAlignment = NSTextAlignmentLeft;
        _reminderLab1.font = [UIFont systemFontOfSize:14];
        _reminderLab1.attributedText = attrString;
        _reminderLab1.numberOfLines = 0;
        _reminderLab1.userInteractionEnabled = YES;
        
    }
    return _reminderLab1;
}
- (UILabel *)reminderLab2 {
    
    if (!_reminderLab2) {
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"*忘记密码时，可通过手机找回"];
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attrString.length)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#eb203b"] range:NSMakeRange(0, 1)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#666666"] range:NSMakeRange(1, attrString.length - 1)];
        
        _reminderLab2 = [UILabel new];
        _reminderLab2.backgroundColor = [UIColor clearColor];
        _reminderLab2.textAlignment = NSTextAlignmentLeft;
        _reminderLab2.font = [UIFont systemFontOfSize:14];
        _reminderLab2.attributedText = attrString;
        _reminderLab2.numberOfLines = 0;
        _reminderLab2.userInteractionEnabled = YES;
        
    }
    return _reminderLab2;
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
    
    [self endEditing:YES];
    NSLog(@"---点击了立即提交---");
}
- (UIButton *)getCodeBtn {
    
    if (!_getCodeBtn) {
        _getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_getCodeBtn.layer setMasksToBounds:YES];//设置按钮的圆角半径不会被遮挡
        [_getCodeBtn.layer setBorderWidth:0.5];//设置边界的宽度
        //设置按钮的边界颜色
        [_getCodeBtn.layer setBorderColor:[UIColor colorWithHex:@"#999999"].CGColor];
        
        _getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_getCodeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_getCodeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_getCodeBtn addTarget:self action:@selector(getCodeAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _getCodeBtn;
}
-(void)getCodeAction:(UIButton *)button {
    
    // 隐藏键盘
    [self endEditing:YES];
    
    NSString *phoneStr = [self.nowPhoneTextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([NSString checkTel:phoneStr] == NO) {
        
        [kAppDelegate.navVC hideHUDWithOnlyMessage:@"请输入正确的手机号"];
        return;
    }
    [kAppDelegate.navVC hideHUDWithOnlyMessage:@"验证码已发送，请注意查收"];
    
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [_getCodeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                _getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
                _getCodeBtn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //让按钮变为不可点击的灰色
                _getCodeBtn.userInteractionEnabled = NO;
                [_getCodeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
                //设置界面的按钮显示 根据自己需求设置
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                _getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
                [_getCodeBtn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
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

@end
