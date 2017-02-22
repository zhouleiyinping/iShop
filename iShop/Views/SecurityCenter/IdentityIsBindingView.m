//
//  IdentityIsBindingView.m
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "IdentityIsBindingView.h"

@implementation IdentityIsBindingView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.bgView];
        [self addSubview:self.hintLab];
        [self.bgView addSubview:self.userNameLab];
        [self.bgView addSubview:self.userNameTitle];
        [self.bgView addSubview:self.realNameLab];
        [self.bgView addSubview:self.realNameTitle];
        [self.bgView addSubview:self.identityCodeLab];
        [self.bgView addSubview:self.identityCodeTitle];
        [self addSubview:self.onlineServiceLab];
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
    
    [self.userNameTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).offset(0);
        make.left.equalTo(self.bgView).offset(20);
        make.height.offset(45);
    }];
    
    [self.realNameTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameTitle.mas_bottom).offset(0);
        make.left.equalTo(self.bgView).offset(20);
        make.height.offset(45);
    }];
    [self.realNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.realNameTitle.mas_centerY).offset(0);
        make.left.equalTo(self.realNameTitle.mas_right).offset(30);
        make.height.offset(45);
        
    }];
    [self.identityCodeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.realNameTitle.mas_bottom).offset(0);
        make.left.equalTo(self.bgView).offset(20);
        make.height.offset(45);
    }];
    
    [self.identityCodeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.identityCodeTitle.mas_centerY).offset(0);
        make.left.equalTo(self.identityCodeTitle.mas_right).offset(30);
        make.height.offset(45);
    }];
    [self.userNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.userNameTitle.mas_centerY).offset(0);
        make.left.equalTo(self.realNameTitle.mas_right).offset(30);
    }];
    
    for (int i = 0; i<2; i++) {
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithHex:@"f5f5f5"];
        [self.bgView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).offset(0);
            make.top.equalTo(self.userNameTitle.mas_bottom).offset(i*45);
            make.height.offset(0.5);
        }];
    }
    
    [self.hintLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-20);
        make.top.mas_equalTo(self.bgView.mas_bottom).offset(30);
    }];
    
    [self.onlineServiceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.bottom.equalTo(self).offset(-30);
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
-(UILabel *)userNameLab {
    
    if (!_userNameLab) {
        _userNameLab = [UILabel new];
        _userNameLab.backgroundColor = [UIColor whiteColor];
        _userNameLab.textColor = [UIColor colorWithHex:@"666666"];
        _userNameLab.font = [UIFont systemFontOfSize:16];
        _userNameLab.text = @"我要中大奖";
        
    }
    return _userNameLab;
}
-(UILabel *)userNameTitle{
    
    if (!_userNameTitle) {
        _userNameTitle = [[UILabel alloc]init];
        _userNameTitle.backgroundColor = [UIColor whiteColor];
        _userNameTitle.textColor = [UIColor colorWithHex:@"333333"];
        _userNameTitle.font = [UIFont systemFontOfSize:16];
        _userNameTitle.text = @"用户名";
    }
    return _userNameTitle;
}
#pragma mark - 真实姓名
-(UILabel *)realNameTitle {
    
    if (!_realNameTitle) {
        _realNameTitle = [[UILabel alloc]init];
        _realNameTitle.backgroundColor = [UIColor whiteColor];
        _realNameTitle.textColor = [UIColor colorWithHex:@"333333"];
        _realNameTitle.font = [UIFont systemFontOfSize:16];
        _realNameTitle.text = @"真实姓名";
    }
    return _realNameTitle;
}
-(UILabel *)realNameLab {
    
    if (!_realNameLab) {
        _realNameLab = [UILabel new];
        _realNameLab.backgroundColor = [UIColor whiteColor];
        _realNameLab.textColor = [UIColor colorWithHex:@"666666"];
        _realNameLab.font = [UIFont systemFontOfSize:16];
        _realNameLab.text = @"刘**";
        
    }
    return _realNameLab;
}
#pragma mark - 身份证号
-(UILabel *)identityCodeTitle {
    
    if (!_identityCodeTitle) {
        _identityCodeTitle = [[UILabel alloc]init];
        _identityCodeTitle.backgroundColor = [UIColor whiteColor];
        _identityCodeTitle.textColor = [UIColor colorWithHex:@"333333"];
        _identityCodeTitle.font = [UIFont systemFontOfSize:16];
        _identityCodeTitle.text = @"身份证号";
    }
    return _identityCodeTitle;
}
-(UILabel *)identityCodeLab {
    
    if (!_identityCodeLab) {
        _identityCodeLab = [UILabel new];
        _identityCodeLab.backgroundColor = [UIColor whiteColor];
        _identityCodeLab.textColor = [UIColor colorWithHex:@"666666"];
        _identityCodeLab.font = [UIFont systemFontOfSize:16];
        _identityCodeLab.text = @"429***769";
        
    }
    return _identityCodeLab;
}
#pragma mark - 安全提示
- (UILabel *)hintLab {
    
    if (!_hintLab) {
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"*真实姓名和身份证号是作为大奖领取的唯一凭证，提交后不可再次更改"];
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

#pragma mark - 在线客服
- (UILabel *)onlineServiceLab {

    if (!_onlineServiceLab) {
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"身份证信息有误，请联系在线客服"];
        [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attrString.length)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#eb203b"] range:NSMakeRange(attrString.length - 4, 4)];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithString:@"#666666"] range:NSMakeRange(0, attrString.length - 4)];

        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onlineServiceAction)];
        
        _onlineServiceLab = [UILabel new];
        _onlineServiceLab.backgroundColor = [UIColor clearColor];
        _onlineServiceLab.textAlignment = NSTextAlignmentLeft;
        _onlineServiceLab.font = [UIFont systemFontOfSize:14];
        _onlineServiceLab.attributedText = attrString;
        _onlineServiceLab.numberOfLines = 0;
        _onlineServiceLab.userInteractionEnabled = YES;
        [_onlineServiceLab addGestureRecognizer:tapGesture];

    }
    return _onlineServiceLab;
}
-(void)onlineServiceAction {
    
    if (self.serviceBlock) {
        self.serviceBlock();
    }
    
}
@end
