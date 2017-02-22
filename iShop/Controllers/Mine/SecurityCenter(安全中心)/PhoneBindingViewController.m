//
//  PhoneBindingViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "PhoneBindingViewController.h"
#import "ChangePhoneNumberViewController.h"

@interface PhoneBindingViewController ()

@end

@implementation PhoneBindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"手机绑定";

    [self.view addSubview:self.phoneBindingView];
    [self.phoneBindingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.bottom.equalTo(self.view).offset(0);
    }];
}

-(RetrievePasswordView *)phoneBindingView {
    
    if (!_phoneBindingView) {
        _phoneBindingView = [[RetrievePasswordView alloc]init];
        
        [_phoneBindingView loadDataWithType:PhoneBindingVC];
        
        [_phoneBindingView setSubmitBlock:^{
            NSLog(@"--点击了立即提交--");
        }];
        
    }
    return _phoneBindingView;
}

@end
