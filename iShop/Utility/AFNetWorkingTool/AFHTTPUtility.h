//
//  AFHTTPUtility.h
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFHTTPUtility : NSObject
// 接口所需的公共参数
+ (NSDictionary *)getRequestAllDict:(NSDictionary *)otherDict;

@end
