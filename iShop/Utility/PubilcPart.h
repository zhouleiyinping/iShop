//
//  PubilcPart.h
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#ifndef PubilcPart_h
#define PubilcPart_h

/**
 更换登录密码、提款密码、手机号
 */
typedef enum : NSUInteger {
    /**
     *  手机绑定
     */
    PhoneBinding,
    /**
     *  登录密码
     */
    Loginpassword,
    /**
     *  提款密码
     */
    DrawMoneyPassword
} SafeViewControllerTypes;


/**
 哪个控制器加载的手机号验证<找回密码和手机绑定>
 */
typedef enum : NSUInteger {
    /**
     *  手机绑定
     */
    PhoneBindingVC,
    /**
     *  找回密码
     */
    RetrievePasswordVC
    
} ForViewControllerTypes;


#endif /* PubilcPart_h */
