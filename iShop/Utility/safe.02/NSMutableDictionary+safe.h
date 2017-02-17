//
//  NSMutableDictionary+safe.h
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (safe)

- (void)safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;

- (void)setSafeObject:(id)object forKey:(id<NSCopying>)aKey;

@end
