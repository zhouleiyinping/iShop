//
//  NSMutableString+safe.m
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "NSMutableString+safe.h"

@implementation NSMutableString (safe)

+ (void)load {
    
        [RTSwizzle exchangeMethodByClass:NSClassFromString(@"__NSCFString") origSel:@selector(insertString:atIndex:) altSel:@selector(safeInsertString:atIndex:)];
        [RTSwizzle exchangeMethodByClass:NSClassFromString(@"__NSCFString") origSel:@selector(appendString:) altSel:@selector(safeAppendString:)];
        [RTSwizzle exchangeMethodByClass:NSClassFromString(@"__NSCFString") origSel:@selector(setString:) altSel:@selector(safeSetString:)];
        [RTSwizzle exchangeMethodByClass:NSClassFromString(@"__NSCFString") origSel:@selector(replaceOccurrencesOfString:withString:options:range:) altSel:@selector(safeReplaceOccurrencesOfString:withString:options:range:)];
}
//字符串的插入操作
- (void)safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc
{
    if (aString == nil) {
        NSAssert(NO, @"string can't be nil");
        return;
    } else if (loc > self.length) {
        NSAssert(NO, @"index beyond");
        return;
    } else {
        [self safeInsertString:aString atIndex:loc];
    }
}
//字符串拼接
- (void)safeAppendString:(NSString *)aString
{
    if (aString == nil) {
        NSAssert(NO, @"string can't be nil");
        return;
    } else {
        [self safeAppendString:aString];
    }
}

- (void)safeSetString:(NSString *)aString
{
    if (aString == nil) {
        NSAssert(NO, @"string can't be nil");
        return;
    } else {
        [self safeSetString:aString];
    }
}

/**
 将字符串中的参数进行替换

 @param target 目标替换值
 @param replacement 替换成为的值
 @param options 类型为默认：NSLiteralSearch
 @param searchRange 替换的范围
 */
- (NSUInteger)safeReplaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
    NSUInteger location = searchRange.location;
    NSUInteger length = searchRange.length;
    
    if (target == nil || replacement == nil) {
        NSAssert(NO, @"can't be nil");
        return 0;
    } else if (location + length > self.length) {
        NSAssert(NO, @"index beyond");
        return 0;
    } else {
        return [self safeReplaceOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
}


@end
