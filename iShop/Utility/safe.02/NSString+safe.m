//
//  NSString+safe.m
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "NSString+safe.h"

@implementation NSString (safe)


+ (void)load {
    
    [RTSwizzle exchangeMethodByClass:[self class] origSel:@selector(substringFromIndex:) altSel:@selector(safeSubstringFromIndex:)];
    [RTSwizzle exchangeMethodByClass:[self class] origSel:@selector(substringToIndex:) altSel:@selector(safeSubstringToIndex:)];
    [RTSwizzle exchangeMethodByClass:[self class] origSel:@selector(substringWithRange:) altSel:@selector(safeSubstringWithRange:)];
    [RTSwizzle exchangeMethodByClass:[self class] origSel:@selector(rangeOfString:) altSel:@selector(safeRangeOfString:)];
    [RTSwizzle exchangeMethodByClass:[self class] origSel:@selector(rangeOfString:options:) altSel:@selector(safeRangeOfString:options:)];
    [RTSwizzle exchangeMethodByClass:[self class] origSel:@selector(stringByAppendingString:) altSel:@selector(safeStringByAppendingString:)];
    [RTSwizzle exchangeMethodByClass:[self class] origSel:@selector(initWithString:) altSel:@selector(safeInitWithString:)];
    [RTSwizzle exchangeMethodByClass:[self class] origSel:@selector(stringWithString:) altSel:@selector(safeStringWithString:)];
}

/**
 *  以指定位置开始（包括指定位置的字符），并包括之后的全部字符
 *
 *  @param from 指定位置
 *
 *  @return 之后的全部字符
 */
- (NSString *)safeSubstringFromIndex:(NSUInteger)from {
    
    if (from > self.length) {
        NSAssert(NO, @"index beyond");
        return nil;
    } else {
        return [self safeSubstringFromIndex:from];
    }
}
/**
 *  从字符串的开头一直截取到指定的位置，但不包括该位置的字符
 *
 *  @param to 指定的位置
 *
 *  @return 字符串
 */
- (NSString *)safeSubstringToIndex:(NSUInteger)to {
    
    if (to > self.length) {
        NSAssert(NO, @"index beyond");
        return nil;
    } else {
        return [self safeSubstringToIndex:to];
    }
}
/**
 *  按照所给出的位置，长度，任意地从字符串中截取子串
 *
 *  @param range 位置，长度
 *
 *  @return 字符串
 */
- (NSString *)safeSubstringWithRange:(NSRange)range {
    
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location+length > self.length) {
        NSAssert(NO, @"index beyond");
        return nil;
    } else {
        return [self safeSubstringWithRange:range];
    }
}
/**
 *  查找字符串某处是否包含其它字符串
 *
 *  @param aString 字符串
 *
 *  @return 位置
 */
- (NSRange)safeRangeOfString:(NSString *)aString {
    
    if (aString == nil) {
        NSAssert(NO, @"string can't be nil");
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self safeRangeOfString:aString];
    }
}
/**
 *  以某些限制条件搜索字符串One是否存在于字符串Two
 */
- (NSRange)safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask {
    
    if (aString == nil) {
        NSAssert(NO, @"string can't be nil");
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self safeRangeOfString:aString options:mask];
    }
}
/**
 *  添加字符串
 */
- (NSString *)safeStringByAppendingString:(NSString *)aString {
    
    if (aString == nil) {
        NSAssert(NO, @"string can't be nil");
        return [self safeStringByAppendingString:@""];
    } else {
        return [self safeStringByAppendingString:aString];
    }
}
/**
 *  指定字符串初始化NSSting 对象
 */
- (id)safeInitWithString:(NSString *)aString {
    
    if (aString == nil) {
        NSAssert(NO, @"string can't be nil");
        return [self safeInitWithString:@""];
    } else {
        return [self safeInitWithString:aString];
    }
}
/**
 *  初始化string对象
 */
+ (id)safeStringWithString:(NSString *)string {
    
    if (string == nil) {
        NSAssert(NO, @"string can't be nil");
        return [self safeStringWithString:@""];
    } else {
        return [self safeStringWithString:string];
    }
}


@end
