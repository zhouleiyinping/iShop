//
//  BindingPublicView.h
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  公共使用的更换手机号或密码view

#import <UIKit/UIKit.h>

typedef void (^bindingPublicActionBlock)(void);


@interface BindingPublicView : UIView

/**
 *  更换按钮
 */
@property (nonatomic, strong) UIButton *changeBtn;
/**
 *  背景
 */
@property (nonatomic,strong) UIView *bgView;
/**
 *  安全提示
 */
@property (nonatomic, strong) UILabel *hintLab;

/**
 *  手机号或密码
 */
@property (nonatomic,strong)UILabel *phoneOrPassword;
/**
 *  已绑定
 */
@property (nonatomic, strong) UILabel *bindingLab;
/**
 *  标题
 */
@property (nonatomic, strong) UILabel *titleLab;


@property (nonatomic, copy) bindingPublicActionBlock bindingPublicBlock;

-(void)setTitleOrBindingWith:(SafeViewControllerTypes)safeVCType;

@end
