//
//  NSNumber+safe.m
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "NSNumber+safe.h"

@implementation NSNumber (safe)

+ (void)load {
    
    [RTSwizzle exchangeMethodByClass:[self class] origSel:@selector(isEqualToNumber:) altSel:@selector(safeIsEqualToNumber:)];
    [RTSwizzle exchangeMethodByClass:[self class] origSel:@selector(compare:) altSel:@selector(safeCompare:)];
}

/**
 *  判断两个NSNumber类型的对象是否相等
 *
 *  @param number NSNumber类型的对象
 *
 *  @return 是否相等
 */
- (BOOL)safeIsEqualToNumber:(NSNumber *)number {
    
    if (number == nil) {
        NSAssert(NO, @"number can't be nil");
        return NO;
    }
    else {
        return [self safeIsEqualToNumber:number];
    }
}
/**
 *  比较两个NSNumbe的大小，结果有三种<1>小<2>相等<3>大
 *
 *  @param otherNumber NSNumber类型的对象
 *
 *  @return 结果
 */
- (NSComparisonResult)safeCompare:(NSNumber *)otherNumber {
    
    if (otherNumber == nil) {
        NSAssert(NO, @"number can't be nil");
        return NSOrderedDescending;
    }
    else {
        return [self safeCompare:otherNumber];
    }
}


@end
