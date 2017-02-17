//
//  RTSwizzle.h
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  利用runtime拦截系统自带的方法调用（Swizzle 黑魔法),交换两个方法的实现,防止崩溃

#import <Foundation/Foundation.h>

@interface RTSwizzle : NSObject

+ (BOOL)overrideMethodByClass:(Class)aClass origSel:(SEL)origSel altSel:(SEL)altSel;
+ (BOOL)overrideClassMethodByClass:(Class)aClass origClassSel:(SEL)origClassSel altClassSel:(SEL)altClassSel;

+ (BOOL)exchangeMethodByClass:(Class)aClass origSel:(SEL)origSel altSel:(SEL)altSel;
+ (BOOL)exchangeClassMethodByClass:(Class)aClass origClassSel:(SEL)origClassSel altClassSel:(SEL)altClassSel;

@end
