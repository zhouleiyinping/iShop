//
//  ChangePhoneNumberViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "ChangePhoneNumberViewController.h"

@interface ChangePhoneNumberViewController ()

@end

@implementation ChangePhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleLabel.text = @"更换手机号";

    [self.view addSubview:self.changePhoneNumberView];
    [self.changePhoneNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(64);
    }];
}

-(ChangePhoneNumberView *)changePhoneNumberView {
    
    if (!_changePhoneNumberView) {
        _changePhoneNumberView = [[ChangePhoneNumberView alloc]init];
    }
    return _changePhoneNumberView;
}

@end
