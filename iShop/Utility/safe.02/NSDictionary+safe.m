//
//  NSDictionary+safe.m
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "NSDictionary+safe.h"

@implementation NSDictionary (safe)

+ (void)load {
    
    NSArray *classArr = @[ @"__NSDictionary0", @"__NSDictionaryM", @"__NSCFDictionary" ];
    [classArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *classString = (NSString *) obj;
        [RTSwizzle exchangeMethodByClass:NSClassFromString(classString) origSel:@selector(objectForKeyedSubscript:) altSel:@selector(safeObjectForKeyedSubscript:)];
    }];
}
//以数组下标的形式来访问相应键的值，若没有key则返回空
- (id)safeObjectForKeyedSubscript:(id<NSCopying>)key {
    if (key == nil) {
        
        NSAssert(NO, @"key can't be nil");
        return nil;
        
    }  else {
        return [self safeObjectForKeyedSubscript:key];
    }
}
//根据key删除value ，若没有key则返回空
- (id)safeObjectForKey:(id<NSCopying>)aKey {
    if (!aKey) {
        NSAssert(NO, @"key can't be nil");
        return nil;
        
    } else  {
        return [self safeObjectForKey:aKey];
    }
}
//创建字典,若object和object有一项为空，则初始化一个字典
+ (id)safeDictionaryWithObject:(id)object forKey:(id<NSCopying>)key {
    
    if (object == nil || key == nil) {
        
        NSAssert(NO, @"can't be nil");
        return [self dictionary];
        
    }  else {
        return [self safeDictionaryWithObject:object forKey:key];
    }
}



@end
