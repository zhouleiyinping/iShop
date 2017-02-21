//
//  AmendPasswordViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AmendPasswordViewController.h"
#import "AmendPasswordView.h"

@interface AmendPasswordViewController ()

@property (nonatomic,strong)AmendPasswordView *amendPasswordView;
@end

@implementation AmendPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.safeVCType) {
        self.safeVCType = Loginpassword;
    }
    switch (self.safeVCType) {
        case Loginpassword:
            self.titleLabel.text = @"修改登录密码";
            break;
        case DrawMoneyPassword:
            self.titleLabel.text = @"修改提现密码";
            break;
        default:
            break;
    }
    
    [self.view addSubview:self.amendPasswordView];
    [self.amendPasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.mas_equalTo(self.view).offset(0);
        make.top.mas_equalTo(self.view).offset(64);
    }];
    
}


-(AmendPasswordView *)amendPasswordView {
    
    if (!_amendPasswordView) {
        _amendPasswordView = [[AmendPasswordView alloc]init];
        __WEAKSELF
        [_amendPasswordView setSubmitBlock:^{
            switch (wself.safeVCType) {
                case Loginpassword:{
                    NSLog(@"----点击了立即提交--修改登录密码--");

                }
                    break;
                case DrawMoneyPassword:{
                    NSLog(@"----点击了立即提交--修改提现密码--");

                }
                    break;
                default:
                    break;
            }
            
        }];
    }
    return _amendPasswordView;
}



@end
