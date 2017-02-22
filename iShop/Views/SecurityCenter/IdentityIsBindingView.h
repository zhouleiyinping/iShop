//
//  IdentityIsBindingView.h
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  身份绑定->已绑定

#import <UIKit/UIKit.h>

typedef void (^ServiceActionBlock)(void);


@interface IdentityIsBindingView : UIView

/**
 *  背景
 */
@property (nonatomic,strong) UIView *bgView;
/**
 *  安全提示
 */
@property (nonatomic, strong) UILabel *hintLab;

/**
 *  用户名->
 */
@property (nonatomic,strong)UILabel *userNameTitle;
/**
 *  真实姓名->
 */
@property (nonatomic, strong) UILabel *realNameTitle;
/**
 *  身份证号->
 */
@property (nonatomic, strong) UILabel *identityCodeTitle;

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
 *  在线客服
 */
@property (nonatomic, strong) UILabel *onlineServiceLab;

@property (nonatomic, copy) ServiceActionBlock serviceBlock;


@end
