//
//  RetrievePasswordView.h
//  iShop
//
//  Created by 周磊 on 2017/2/20.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  找回密码

#import <UIKit/UIKit.h>

@interface RetrievePasswordView : UIView<UITextFieldDelegate>

/**
 *  手机号输入框
 */
@property (nonatomic, strong) UITextField *phoneTxtfield;
/**
 *  验证码输入框
 */
@property (nonatomic, strong) UITextField *codeTxtfield;
/**
 *  手机号
 */
@property (nonatomic, strong) UILabel *phoneLab;
/**
 *  验证码
 */
@property (nonatomic, strong) UILabel *codeLab;
/**
 *  登录按钮
 */
@property (nonatomic, strong) UIButton *loginBtn;
/**
 *  获取验证码按钮
 */
@property (nonatomic, strong) UIButton *getCodeBtn;
/**
 *  提示
 */
@property (nonatomic, strong) UILabel *hintLab;

@end
