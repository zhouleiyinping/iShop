//
//  PromptlyChangeViewController.h
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  立即更换包括手机号、密码、提现密码

#import "BaseViewController.h"
#import "BindingPublicView.h"

@interface PromptlyChangeViewController : BaseViewController

@property (nonatomic, assign) SafeViewControllerTypes safeVCType;

@property (nonatomic,strong)BindingPublicView *bindingPublicView;

@end
