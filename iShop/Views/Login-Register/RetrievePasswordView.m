//
//  RetrievePasswordView.m
//  iShop
//
//  Created by 周磊 on 2017/2/20.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "RetrievePasswordView.h"

@interface RetrievePasswordView ()
/**
 *  背景
 */
@property (nonatomic,strong) UIView *bgView;

@end

@implementation RetrievePasswordView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.phoneTxtfield];
        [self.bgView addSubview:self.codeTxtfield];
        [self addSubview:self.loginBtn];
        [self addSubview:self.hintLab];
        [self.bgView addSubview:self.phoneLab];
        [self.bgView addSubview:self.codeLab];
        [self.bgView addSubview:self.getCodeBtn];

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
    
    [self.phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.top.equalTo(self.bgView).offset(0);
        make.width.offset(50);
        make.height.offset(45);
    }];
    
    [self.phoneTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneLab.mas_right).offset(30);
        make.right.equalTo(self.bgView).offset(-30);
        make.top.equalTo(self.bgView).offset(0);
        make.height.offset(45);
    }];
    
    [self.codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(15);
        make.top.equalTo(self.phoneLab.mas_bottom).offset(0.5);
        make.width.offset(50);
        make.height.offset(45);
    }];
    
    [self.codeTxtfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneLab.mas_right).offset(30);
        make.right.equalTo(self.bgView).offset(-110);
        make.top.equalTo(self.phoneLab.mas_bottom).offset(0.5);
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
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.mas_equalTo(self.bgView.mas_bottom).offset(20);
        make.height.mas_equalTo(45);
    }];

    [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(30);
    }];
    
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.codeTxtfield.mas_centerY).offset(0);
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

#pragma mark - 手机号
-(UITextField *)phoneTxtfield {
    
    if (!_phoneTxtfield) {
        _phoneTxtfield = [UITextField new];
        _phoneTxtfield.delegate = self;
        _phoneTxtfield.backgroundColor = [UIColor whiteColor];
        _phoneTxtfield.font = [UIFont systemFontOfSize:15];
        _phoneTxtfield.returnKeyType = UIReturnKeyNext;
        _phoneTxtfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTxtfield.keyboardType = UIKeyboardTypeDefault;
        _phoneTxtfield.placeholder = @"请输入绑定的手机号码";
        _phoneTxtfield.borderStyle = UITextBorderStyleNone;
        _phoneTxtfield.autocorrectionType = UITextAutocorrectionTypeNo;
        [_phoneTxtfield addTarget:self action:@selector(phoneNumberEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _phoneTxtfield;
}
-(void)phoneNumberEditingChanged:(UITextField *)textField {
    NSLog(@"手机号");
}
#pragma mark - 验证码
-(UITextField *)codeTxtfield {
    
    if (!_codeTxtfield) {
        _codeTxtfield = [UITextField new];
        _codeTxtfield.delegate = self;
        _codeTxtfield.backgroundColor = [UIColor whiteColor];
        _codeTxtfield.font = [UIFont systemFontOfSize:15];
        _codeTxtfield.returnKeyType = UIReturnKeyNext;
        _codeTxtfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _codeTxtfield.keyboardType = UIKeyboardTypeNumberPad;
        _codeTxtfield.placeholder = @"请输入收到的验证码";
        _codeTxtfield.borderStyle = UITextBorderStyleNone;
        _codeTxtfield.autocorrectionType = UITextAutocorrectionTypeNo;
        [_codeTxtfield addTarget:self action:@selector(codeTxtfieldChanged:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return _codeTxtfield;
}
-(void)codeTxtfieldChanged:(UITextField *)textField {
    NSLog(@"验证码");
}
- (UIButton *)loginBtn {
    
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
-(void)loginAction {
    NSLog(@"登录");
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

- (UILabel *)hintLab
{
    if (!_hintLab) {
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"*如还未绑定手机号，请联系"];
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
-(UILabel *)phoneLab {
    
    if (!_phoneLab) {
        _phoneLab = [[UILabel alloc]init];
        _phoneLab.textAlignment = NSTextAlignmentLeft;
        _phoneLab.backgroundColor = [UIColor whiteColor];
        _phoneLab.textColor = [UIColor colorWithHex:@"333333"];
        _phoneLab.font = [UIFont systemFontOfSize:16];
        _phoneLab.text = @"手机号";
    }
    return _phoneLab;
}

-(UILabel *)codeLab {
    
    if (!_codeLab) {
        _codeLab = [[UILabel alloc]init];
        _codeLab.textAlignment = NSTextAlignmentLeft;
        _codeLab.textColor = [UIColor colorWithHex:@"333333"];
        _codeLab.font = [UIFont systemFontOfSize:16];
        _codeLab.text = @"验证码";
    }
    return _codeLab;
}

@end
