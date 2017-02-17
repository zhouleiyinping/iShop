//
//  NSMutableArray+safe.m
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "NSMutableArray+safe.h"

@implementation NSMutableArray (safe)

+ (void)load {
    
    NSArray *classArr = @[@"__NSArrayM",@"__NSCFArray"];
    [classArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *classString = (NSString *)obj;
        
        [RTSwizzle overrideMethodByClass:NSClassFromString(classString) origSel:@selector(setObject:atIndexedSubscript:) altSel:@selector(safeSetObject:atIndexedSubscript:)];
    }];
}
//通过数组下标来读写相应元素
- (void)safeSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    
    if (obj == nil) {
        return ;
    }
    
    if (self.count < idx) {
        NSAssert(NO, @"no");
        return ;
    }
    
    if (idx == self.count) {
        [self addObject:obj];
    } else {
        [self replaceObjectAtIndex:idx withObject:obj];
    }
}
//追加一个元素
- (void)safeAddObject:(id)object {
    
    if (object == nil) {
        NSAssert(NO, @"value can't be nil");
        return;
    } else {
        [self safeAddObject:object];
    }
}
//在指定索引处插入一个元素，原来的元素后移
- (void)safeInsertObject:(id)object atIndex:(NSUInteger)index {
    
    if (object == nil) {
        NSAssert(NO, @"value can't be nil");
        return;
    } else if (index > self.count) {
        NSAssert(NO, @"index beyond");
        return;
    } else {
        [self safeInsertObject:object atIndex:index];
    }
}
//指定索引集合处插入一个数组元素
- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs {
    
    NSUInteger firstIndex = indexs.firstIndex;
    if (indexs == nil) {
        NSAssert(NO, @"indexs can't be nil");
        return;
    } else if (indexs.count!=objects.count || firstIndex>objects.count) {
        NSAssert(NO, @"index beyond");
        return;
    } else {
        [self safeInsertObjects:objects atIndexes:indexs];
    }
}
//删除对应索引位置的元素
- (void)safeRemoveObjectAtIndex:(NSUInteger)index {
    
    if (index >= self.count) {
        NSAssert(NO, @"index beyond");
        return;
    } else {
        [self safeRemoveObjectAtIndex:index];
    }
}
//删除对应索引范围的元素
- (void)safeRemoveObjectsInRange:(NSRange)range {
    
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location + length > self.count) {
        NSAssert(NO, @"index beyond");
        return;
    } else {
        [self safeRemoveObjectsInRange:range];
    }
}


@end
