//
//  AFHTTPUtility.h
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    RTNetworkNil  = 0,
    RTNetwork2G3G = 1,
    RTNetworkWIFI = 2,
    RTNetwork2G   = 3,
    RTNetwork3G   = 4,
    RTNetwork4G   = 5,
    RTNetworkLTE  = 6,
} RTNetworkType;


@interface AFHTTPUtility : NSObject

/**
 *  判断是否有网络连接
 *
 *  @return bool
 */
+ (BOOL)connectedToNetwork;

/**
 *  判断网络的具体类型
 *  例如2G 3G LTE 4G wifi ...
 *
 *  @return RTNetworkType
 */
+ (RTNetworkType)MBNetworkAllType;

/**
 *  判断网络类型 不做具体区分
 *  只包括 2G/3G wifi nil .
 *
 *  @return RTNetworkType
 */
+ (RTNetworkType)MBNetworkType;

/** 实时监测当前网络状态变化 */
+ (void)startNetworkMonitor;

#pragma mark ============== 最终的请求url ==============
/** 获取最终拼接URL */
+ (NSString *)getRequestUrlWithMethod:(NSString *)method;

// 接口所需的公共参数
+ (NSDictionary *)getRequestAllDict:(NSDictionary *)otherDict;

@end
