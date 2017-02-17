//
//  NSArray+safe.m
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "NSArray+safe.h"

@implementation NSArray (safe)

+ (void)load {
    NSArray *classArr = @[@"__NSArrayM",@"__NSCFArray",@"__NSArrayI",@"__NSArray0"];
    [classArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *classString = (NSString *)obj;
        
        [RTSwizzle exchangeMethodByClass:NSClassFromString(classString) origSel:@selector(objectAtIndexedSubscript:) altSel:@selector(safeObjectAtIndexedSubscript:)];
    }];
}
/**
 *  返回指定下标的一个对象,若指定下标大于数组数量则返回nil
 *
 *  @param index 指定下标
 *
 *  @return 返回指定下标的一个对象
 */
- (id)safeObjectAtIndexedSubscript:(NSUInteger)index {
    
    if (index >= self.count) {
        NSAssert(NO, @"index beyond");
        return nil;
    }
    else {
        return [self safeObjectAtIndexedSubscript:index];
    }
}
/**
 *  获取数组下标对应的元素对象,若超出索引则返回nil
 *
 *  @param index 指定下标
 *
 *  @return 数组下标对应的元素对象
 */
- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        NSAssert(NO, @"index beyond");
        return nil;
    }
    else {
        return [self safeObjectAtIndex:index];
    }
}
/**
 *  返回指定范围（起始索引、长度）的子数组,若超过了边界,就获取从loction开始所有的item
 *
 *  @param range 指定范围（起始索引、长度）
 *
 *  @return 指定范围的子数组
 */
- (NSArray *)safeSubarrayWithRange:(NSRange)range {
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location + length > self.count) {
        NSAssert(NO, @"index beyond");
        length = (self.count - location);
        return [self safeSubarrayWithRange:NSMakeRange(location, length)];
        
    }
    else {
        return [self safeSubarrayWithRange:range];
    }
}
/**
 *  判断对象是否存在数组中,如果存在返回对象所在的下标
 *
 *  @param anObject 对象
 *
 *  @return 返回对象所在的下标
 */
- (NSUInteger)safeIndexOfObject:(id)anObject {
    if (anObject == nil) {
        
        NSAssert(NO, @"index beyond");
        return NSNotFound;
    }
    else {
        return [self safeIndexOfObject:anObject];
    }
}

@end
