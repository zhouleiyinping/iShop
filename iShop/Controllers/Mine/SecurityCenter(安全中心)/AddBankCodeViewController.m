//
//  AddBankCodeViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AddBankCodeViewController.h"

@interface AddBankCodeViewController ()

@end

@implementation AddBankCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = @"银行卡";
    
    [self.view addSubview:self.addBankCodeView];
    [self.addBankCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(64);
    }];
}

-(AddBankCodeView *)addBankCodeView {
    if (!_addBankCodeView) {
        _addBankCodeView = [[AddBankCodeView alloc]init];
    }
    return _addBankCodeView;
}

@end
