//
//  IdentityBindingViewController.h
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  身份绑定

/**
 身份是否绑定
 */
typedef enum : NSUInteger {
    /**
     *  未绑定
     */
    Unbounded,
    /**
     *  已绑定
     */
    IsBinding
} IdentityIsBindingType;

#import "BaseViewController.h"
#import "IdentityBindingView.h"
#import "IdentityIsBindingView.h"

@interface IdentityBindingViewController : BaseViewController

@property (nonatomic, assign) IdentityIsBindingType bindingType;
@property (nonatomic,strong)IdentityBindingView *idBindingView;

@property (nonatomic,strong)IdentityIsBindingView *idIsBindingView;

@end
