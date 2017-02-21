//
//  AmendPasswordView.h
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  修改密码

#import <UIKit/UIKit.h>

typedef void (^submitActionBlock)(void);

@interface AmendPasswordView : UIView<UITextFieldDelegate>
/**
 *  原始密码输入框
 */
@property (nonatomic, strong) UITextField *oldPasswordTxtfield;
/**
 *  新密码输入框
 */
@property (nonatomic, strong) UITextField *nowPasswordTxtfield;
/**
 *  确认密码输入框
 */
@property (nonatomic, strong) UITextField *affirmPasswordTxtfield;
/**
 *  原始密码
 */
@property (nonatomic, strong) UILabel *oldPasswordLab;
/**
 *  新密码
 */
@property (nonatomic, strong) UILabel *nowPasswordLab;
/**
 *  确认密码
 */
@property (nonatomic, strong) UILabel *affirmPasswordLab;
/**
 *  提交按钮
 */
@property (nonatomic, strong) UIButton *submitBtn;

/**
 *  背景
 */
@property (nonatomic,strong) UIView *bgView;

@property (nonatomic, copy) submitActionBlock submitBlock;


- (NSString *)getOldPassword;
- (NSString *)getNowPassword;

@end
