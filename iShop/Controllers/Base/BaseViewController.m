//
//  BaseViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     *  隐藏系统导航栏
     */
    [kAppDelegate.navVC setNavigationBarHidden:YES animated:YES];
    
    /**
     *  设置状态栏的颜色
     */
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];

    
    self.view.backgroundColor = [UIColor colorWithHex:@"#f5f5f5"];

    [self.view addSubview:self.navView];
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view).offset(0);
        make.height.offset(64);
    }];
        
}


-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}


-(UIView *)navView {
    
    if (_navView == nil) {
        
        _navView = [[UIView alloc]init];
        _navView.backgroundColor = [UIColor colorWithHex:@"#eb203b"];
        [_navView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_navView.mas_centerX).offset(0);
            make.centerY.equalTo(_navView.mas_centerY).offset(10);
        }];
        [_navView addSubview:self.backButton];
        [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_navView.mas_left).offset(5);
            make.centerY.equalTo(_navView.mas_centerY).offset(10);
            make.width.height.offset(44);
        }];
    }
    
    return _navView;
}
-(UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor colorWithHex:@"#f5f5f5"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UIButton *)backButton {
    
    if (!_backButton) {
        _backButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:kGetImage(@"yw_nav_button_arrow") forState:UIControlStateNormal];
        [_backButton setImage:kGetImage(@"yw_nav_button_arrow") forState:UIControlStateHighlighted];
        [_backButton setExclusiveTouch:YES];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [_backButton setTitle:@"" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor colorWithHex:@"#333333"] forState:UIControlStateNormal];
        _backButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_backButton addTarget:self action:@selector(onButtonActionBack:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (void)onButtonActionBack:(id)senderv{
    
    if (BasePresentType == self.loadType) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)hideNavigationBar:(BOOL)hidden {
    
    self.navView.hidden = hidden;

    
}
@end
