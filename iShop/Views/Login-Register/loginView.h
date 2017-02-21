//
//  loginView.h
//  iShop
//
//  Created by 周磊 on 2017/2/20.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  登录

#import <UIKit/UIKit.h>

typedef void (^forgetPasswordActionBlock)(void);
typedef void (^loginActionBlock)(void);

@interface loginView : UIView<UITextFieldDelegate>

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
@property (nonatomic, strong) UIButton *showCodeBtn;
/**
 *  登录按钮
 */
@property (nonatomic, strong) UIButton *loginBtn;
/**
 *  忘记密码
 */
@property (nonatomic, strong) UIButton *forgetBtn;
/**
 *  记住密码
 */
@property (nonatomic, strong) UIButton *rememberBtn;
/**
 *  用户名
 */
@property (nonatomic, strong) UILabel *userNameLab;
/**
 *  密码
 */
@property (nonatomic, strong) UILabel *passwordLab;
/**
 *  安全提示
 */
@property (nonatomic, strong) UILabel *hintLab;
/**
 *  忘记密码回调
 */
@property (nonatomic, copy) forgetPasswordActionBlock forgetPasswordBlock;
/**
 *  登录回调
 */
@property (nonatomic, copy) loginActionBlock loginBlock;

- (NSString *)getInputUserName;
- (NSString *)getInputPassword;

@end
