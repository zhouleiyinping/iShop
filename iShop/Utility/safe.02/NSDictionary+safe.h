//
//  NSDictionary+safe.h
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (safe)

- (id)safeObjectForKey:(id<NSCopying>)aKey;

+ (id)safeDictionaryWithObject:(id)object forKey:(id<NSCopying>)key;


@end
