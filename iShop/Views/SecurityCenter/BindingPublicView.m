//
//  BindingPublicView.m
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "BindingPublicView.h"

@implementation BindingPublicView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self setupConstraints];
        
    }
    return self;
}

-(void)setupConstraints {
    
    [self addSubview:self.bgView];
    [self addSubview:self.changeBtn];
    [self addSubview:self.hintLab];
    [self.bgView addSubview:self.phoneOrPassword];
    [self.bgView addSubview:self.bindingLab];
    [self.bgView addSubview:self.titleLab];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(10);
        make.height.offset(45);
    }];
    
    [self.changeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.mas_equalTo(self.bgView.mas_bottom).offset(30);
        make.height.mas_equalTo(45);
    }];
    
    [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.equalTo(self.changeBtn.mas_bottom).offset(30);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bgView.mas_centerY).offset(0);
        make.leading.mas_equalTo(self.bgView).offset(10);
    }];
    
    [self.bindingLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView.mas_centerY).offset(0);
        make.right.equalTo(self.bgView).offset(-20);
    }];
    
    [self.phoneOrPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.bgView.mas_centerY).offset(0);
        make.left.mas_equalTo(self.titleLab.mas_right).offset(20);
    }];

}


-(void)setTitleOrBindingWith:(SafeViewControllerTypes)safeVCType {
    
    switch (safeVCType) {
        case PhoneBinding://手机绑定
            self.bindingLab.text = @"已绑定";
            self.titleLab.text = @"手机号";
            _phoneOrPassword.text = @"185****1234";
            [self attrStringWith:@"*忘记密码时，可通过手机号找回"];
            break;
        case Loginpassword://登录密码
            self.bindingLab.text = @"已绑定";
            self.titleLab.text = @"登录密码";
            _phoneOrPassword.text = @"8******";
            [self attrStringWith:@"*为保障账户资金安全，建议定期更换登录密码"];
            break;
            
        default://提款密码
            self.bindingLab.text = @"已设置";
            self.titleLab.text = @"提现密码";
            _phoneOrPassword.text = @"*******";
            [self attrStringWith:@"*为保障账户资金安全，建议定期更换提现密码"];
            break;
    }
    
}

-(void)attrStringWith:(NSString *)string {
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attrString.length)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#eb203b"] range:NSMakeRange(0, 1)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#666666"] range:NSMakeRange(1, attrString.length - 1)];
    self.hintLab.attributedText = attrString;
    
}

-(UILabel *)phoneOrPassword {
    
    if (!_phoneOrPassword) {
        _phoneOrPassword = [UILabel new];
        _phoneOrPassword.textAlignment = NSTextAlignmentLeft;
        _phoneOrPassword.backgroundColor = [UIColor whiteColor];
        _phoneOrPassword.textColor = [UIColor colorWithHex:@"666666"];
        _phoneOrPassword.font = [UIFont systemFontOfSize:14];
    }
    return _phoneOrPassword;
}

-(UILabel *)bindingLab {
    
    if (!_bindingLab) {
        _bindingLab = [UILabel new];
        _bindingLab.textAlignment = NSTextAlignmentLeft;
        _bindingLab.backgroundColor = [UIColor whiteColor];
        _bindingLab.textColor = [UIColor colorWithHex:@"eb203b"];
        _bindingLab.font = [UIFont systemFontOfSize:14];
        _bindingLab.text = @"已绑定";

    }
    return _bindingLab;
}
-(UILabel *)titleLab {
    
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.backgroundColor = [UIColor whiteColor];
        _titleLab.textColor = [UIColor colorWithHex:@"333333"];
        _titleLab.font = [UIFont systemFontOfSize:16];
        _titleLab.text = @"登录密码";

    }
    return _titleLab;
}

-(UIView *)bgView {
    
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
        
    }
    return _bgView;
}

#pragma mark - 立即更换
- (UIButton *)changeBtn {
    
    if (!_changeBtn) {
        _changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeBtn.backgroundColor = [UIColor colorWithString:@"#eb203b"];
        _changeBtn.layer.masksToBounds = YES;
        _changeBtn.layer.cornerRadius = 4;
        _changeBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_changeBtn setTitle:@"立即更换" forState:UIControlStateNormal];
        [_changeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_changeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_changeBtn addTarget:self action:@selector(changeBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _changeBtn;
}
-(void)changeBtnAction {
    
    if (self.bindingPublicBlock) {
        self.bindingPublicBlock();
    }
}
- (UILabel *)hintLab {
    
    if (!_hintLab) {
        _hintLab = [UILabel new];
        _hintLab.backgroundColor = [UIColor clearColor];
        _hintLab.textAlignment = NSTextAlignmentLeft;
        _hintLab.font = [UIFont systemFontOfSize:14];
        _hintLab.numberOfLines = 0;
        _hintLab.userInteractionEnabled = YES;
    }
    return _hintLab;
}

@end
