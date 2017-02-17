//
//  RTSwizzle.m
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "RTSwizzle.h"
#import <objc/runtime.h>

@implementation RTSwizzle

+ (BOOL)overrideMethodByClass:(Class)aClass origSel:(SEL)origSel altSel:(SEL)altSel {
    
    Method origMethod =class_getInstanceMethod(aClass, origSel);
    if (!origMethod) {
        return NO;
    }
    
    Method altMethod =class_getInstanceMethod(aClass, altSel);
    if (!altMethod) {
        return NO;
    }
    
    class_addMethod(aClass,
                    origSel,
                    class_getMethodImplementation(aClass, origSel),
                    method_getTypeEncoding(origMethod));
    
    method_setImplementation(class_getInstanceMethod(aClass, origSel), class_getMethodImplementation(aClass, altSel));
    
    return YES;
}

+ (BOOL)overrideClassMethodByClass:(Class)aClass origClassSel:(SEL)origClassSel altClassSel:(SEL)altClassSel {
    
    return [self overrideMethodByClass:object_getClass((id)aClass) origSel:origClassSel altSel:altClassSel];
}

+ (BOOL)exchangeMethodByClass:(Class)aClass origSel:(SEL)origSel altSel:(SEL)altSel {
    
    Method origMethod =class_getInstanceMethod(aClass, origSel);
    if (!origMethod) {
        return NO;
    }
    
    Method altMethod =class_getInstanceMethod(aClass, altSel);
    if (!altMethod) {
        return NO;
    }
    
    class_addMethod(aClass,
                    origSel,
                    class_getMethodImplementation(aClass, origSel),
                    method_getTypeEncoding(origMethod));
    class_addMethod(aClass,
                    altSel,
                    class_getMethodImplementation(aClass, altSel),
                    method_getTypeEncoding(altMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(aClass, origSel),class_getInstanceMethod(aClass, altSel));
    
    return YES;
}

+ (BOOL)exchangeClassMethodByClass:(Class)aClass origClassSel:(SEL)origClassSel altClassSel:(SEL)altClassSel {
    
    return [self exchangeMethodByClass:object_getClass((id)aClass) origSel:origClassSel altSel:altClassSel];
}


@end
