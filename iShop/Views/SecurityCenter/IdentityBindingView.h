//
//  IdentityBindingView.h
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//   身份绑定->未绑定

#import <UIKit/UIKit.h>

typedef void (^bindingActionBlock)(void);


@interface IdentityBindingView : UIView<UITextFieldDelegate>

/**
 *  背景
 */
@property (nonatomic,strong) UIView *bgView;
/**
 *  安全提示
 */
@property (nonatomic, strong) UILabel *hintLab;

/**
 *  用户名
 */
@property (nonatomic,strong)UILabel *userNameLab;
/**
 *  真实姓名
 */
@property (nonatomic, strong) UILabel *realNameLab;
/**
 *  身份证号
 */
@property (nonatomic, strong) UILabel *identityCodeLab;
/**
 *  用户名
 */
@property (nonatomic, strong) UILabel *userName;
/**
 *  真实姓名
 */
@property (nonatomic, strong) UITextField *realNameTxtfield;
/**
 *  身份证号输入框
 */
@property (nonatomic, strong) UITextField *identityCodeTxtfield;
/**
 *  绑定回调
 */
@property (nonatomic, copy) bindingActionBlock bindingBlock;
/**
 *  绑定按钮
 */
@property (nonatomic, strong) UIButton *bindingBtn;
@end
