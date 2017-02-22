//
//  IdentityBindingViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "IdentityBindingViewController.h"

@interface IdentityBindingViewController ()

@end

@implementation IdentityBindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"身份绑定";
    
    switch (self.bindingType) {
        case IsBinding: {//已绑定
            
            [self.view addSubview:self.idIsBindingView];
            [self.idIsBindingView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(self.view).offset(0);
                make.top.equalTo(self.view).offset(64);
            }];
            
        }
            
            break;
            
        default:{//未绑定
            
            [self.view addSubview:self.idBindingView];
            [self.idBindingView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(self.view).offset(0);
                make.top.equalTo(self.view).offset(64);
            }];
            
        }
            break;
    }
    
}


-(IdentityBindingView *)idBindingView {
    
    if (!_idBindingView) {
        _idBindingView = [[IdentityBindingView alloc]init];
        
        [_idBindingView setBindingBlock:^{
            NSLog(@"---点击了立即提交按钮--");
        }];
    }
    
    return _idBindingView;
}
-(IdentityIsBindingView *)idIsBindingView {
    
    if (!_idIsBindingView) {
        _idIsBindingView = [[IdentityIsBindingView alloc]init];
        [_idIsBindingView setServiceBlock:^{
            NSLog(@"---点击了在线客服--");
        }];
    }
    
    return _idIsBindingView;
}

@end
