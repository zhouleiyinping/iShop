//
//  registerView.h
//  iShop
//
//  Created by 周磊 on 2017/2/20.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  注册

#import <UIKit/UIKit.h>

typedef void (^registerActionBlock)(void);

@interface registerView : UIView<UITextFieldDelegate>

/**
 *  用户名输入框
 */
@property (nonatomic, strong) UITextField *userNameTxtfield;
/**
 *  密码输入框
 */
@property (nonatomic, strong) UITextField *passwordTxtfield;
/**
 *  显示or影藏密码
 */
@property (nonatomic, strong) UIButton *showCodeBtn1;
/**
 *  显示or影藏密码
 */
@property (nonatomic, strong) UIButton *showCodeBtn2;

/**
 *  登录按钮
 */
@property (nonatomic, strong) UIButton *registerBtn;

/**
 *  确认密码输入框
 */
@property (nonatomic, strong) UITextField *affirmPasswordTxtfield;
/**
 *  用户名
 */
@property (nonatomic, strong) UILabel *userNameLab;
/**
 *  密码
 */
@property (nonatomic, strong) UILabel *passwordLab;
/**
 *  确认密码
 */
@property (nonatomic, strong) UILabel *affirmPasswordLab;
/**
 *  安全提示
 */
@property (nonatomic, strong) UILabel *hintLab;

/**
 *  阅读条款
 */
@property (nonatomic, strong) UIButton *readClauseBtn;
/**
 *  注册回调
 */
@property (nonatomic, copy) registerActionBlock registerBlock;

- (NSString *)getInputUserName;
- (NSString *)getInputPassword;
@end
