//
//  NSDictionary+Extension.m
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (NSString *)convertToJsonString {
    
    NSData *jsonData = nil;
    NSError *error = nil;
    @try {
        jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                   options:kNilOptions
                                                     error:&error];
    }
    @catch (NSException *exception) {
        return nil;
    }
    
    NSString *str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return str;
}

@end
