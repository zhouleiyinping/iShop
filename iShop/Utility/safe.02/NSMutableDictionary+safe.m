//
//  NSMutableDictionary+safe.m
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "NSMutableDictionary+safe.h"

@implementation NSMutableDictionary (safe)

+ (void)load {
    
    NSArray *classArr = @[ @"__NSDictionaryM", @"__NSCFDictionary" ];
    [classArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *classString = (NSString *)obj;
        [RTSwizzle exchangeMethodByClass:NSClassFromString(classString) origSel:@selector(setObject:forKey:) altSel:@selector(safeSetObject:forKey:)];
    }];
}

- (void)safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey {
    
    if (aObj && aKey) {
        [self safeSetObject:aObj forKey:aKey];
    } else {
        
        NSAssert(NO, @"key or value can't be nil");
        return;
        
    }
}

- (void)setSafeObject:(id)object forKey:(id<NSCopying>)aKey {
    
    if (object) {
        [self setObject:object forKey:aKey];
    }
}
@end
