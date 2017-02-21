//
//  PromptlyChangeViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "PromptlyChangeViewController.h"
#import "AmendPasswordViewController.h"
#import "PhoneBindingViewController.h"

@interface PromptlyChangeViewController ()

@end

@implementation PromptlyChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.bindingPublicView];
    [self.bindingPublicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.mas_equalTo(self.view).offset(0);
        make.top.mas_equalTo(self.view).offset(64);
    }];

    switch (self.safeVCType) {
        case PhoneBinding://手机绑定
            self.titleLabel.text = @"手机绑定";
            break;
            
        case Loginpassword://登录密码
            self.titleLabel.text = @"登录密码";

            break;
            
        default://提款密码
            self.titleLabel.text = @"提款密码";

            break;
    }
}

-(BindingPublicView *)bindingPublicView {
    
    if (!_bindingPublicView) {
        _bindingPublicView = [[BindingPublicView alloc]init];
        [_bindingPublicView setTitleOrBindingWith:self.safeVCType];
        
        __WEAKSELF
        [_bindingPublicView setBindingPublicBlock:^{
            switch (wself.safeVCType) {
                case PhoneBinding:{//手机绑定
                    
                    PhoneBindingViewController *phoneBindingVC = [[PhoneBindingViewController alloc]init];
                    [wself.navigationController pushViewController:phoneBindingVC animated:YES];
                }
                    break;
                    
                case Loginpassword:{//登录密码
                    
                    AmendPasswordViewController *amendPasswordVC = [[AmendPasswordViewController alloc]init];
                    amendPasswordVC.safeVCType = Loginpassword;
                    [wself.navigationController pushViewController:amendPasswordVC animated:YES];
                }
                    break;
                    
                default:{//提款密码
                    
                    AmendPasswordViewController *amendPasswordVC = [[AmendPasswordViewController alloc]init];
                    amendPasswordVC.safeVCType = DrawMoneyPassword;
                    [wself.navigationController pushViewController:amendPasswordVC animated:YES];
                }
                    break;
            }
        }];
        
    }
    
    return _bindingPublicView;
}

@end
