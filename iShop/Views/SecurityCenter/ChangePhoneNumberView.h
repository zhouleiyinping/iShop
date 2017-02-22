//
//  ChangePhoneNumberView.h
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  更换手机号码

#import <UIKit/UIKit.h>

@interface ChangePhoneNumberView : UIView<UITextFieldDelegate>
/**
 *  原手机号
 */
@property (nonatomic,strong)UILabel *oldPhoneLab;
/**
 *  原手机号输入框
 */
@property (nonatomic,strong)UITextField *oldPhoneTextfield;
/**
 *  新手机号
 */
@property (nonatomic,strong)UILabel *nowPhoneLab;
/**
 *  新手机号输入框
 */
@property (nonatomic,strong)UITextField *nowPhoneTextfield;
/**
 *  验证码
 */
@property (nonatomic,strong)UILabel *codeLab;
/**
 *  验证码输入框
 */
@property (nonatomic,strong)UITextField *codeTextfield;
/**
 *  提示1
 */
@property (nonatomic,strong)UILabel *reminderLab1;
/**
 *  提示2
 */
@property (nonatomic,strong)UILabel *reminderLab2;
@property (nonatomic,strong)UIView *bgView;

@property (nonatomic,strong)UIButton *submitBtn;
/**
 *  获取验证码按钮
 */
@property (nonatomic, strong) UIButton *getCodeBtn;
@end
