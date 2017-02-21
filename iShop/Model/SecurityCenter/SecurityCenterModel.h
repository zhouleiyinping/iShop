//
//  SecurityCenterModel.h
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  安全中心相关Model

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    /**
     *  身份绑定
     */
    IdentityBindingType,
    /**
     *  手机绑定
     */
    PhoneBindingType,
    /**
     *  登录密码
     */
    LoginpasswordType,
    /**
     *  银行卡
     */
    BankCardType,
    /**
     *  提款密码
     */
    DrawMoneyPasswordType
} SafeCenterTypes;

@interface SecurityCenterModel : NSObject
@property (nonatomic,copy)NSString *titleStr;
@property (nonatomic,copy)NSString *explainStr;
@property (nonatomic, assign) SafeCenterTypes safeCentertype;
@end
