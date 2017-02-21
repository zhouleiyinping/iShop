//
//  RetrievePasswordView.h
//  iShop
//
//  Created by 周磊 on 2017/2/20.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  找回密码or手机绑定

#import <UIKit/UIKit.h>

typedef void (^serviceActionBlock)(void);
typedef void (^submitActionBlock)(void);

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
 *  提示1
 */
@property (nonatomic, strong) UILabel *hintLab;

/**
 *  在线客服
 */
@property (nonatomic, strong) UIButton *OnlineServiceBtn;

/**
 *  提示2
 */
@property (nonatomic, strong) UILabel *hintLab2;

@property (nonatomic, copy) serviceActionBlock serviceBlock;
@property (nonatomic, copy) submitActionBlock submitBlock;


-(void)loadDataWithType:(ForViewControllerTypes)vcType;

@end
