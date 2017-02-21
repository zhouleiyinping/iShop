//
//  AFHTTPUtility.m
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AFHTTPUtility.h"
#import <netinet/in.h>

@implementation AFHTTPUtility

+ (BOOL) connectedToNetwork {
    
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) {
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && !needsConnection)? YES : NO;
}

+ (RTNetworkType)MBNetworkAllType{
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    RTNetworkType statusCode = RTNetworkNil;
    
    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKey:@"statusBar"] valueForKey:@"foregroundView"]subviews];
    NSNumber *dataNetworkItemView = nil;
    
    if (subviews) {
        for (id subview in subviews) {
            if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
                dataNetworkItemView = subview;
                break;
            }
        }
    }
    
    if (!dataNetworkItemView) {
        return statusCode;
    }
    
    /**
     *  flag 是用来判断网络连接的
     *  暂时不要删除注释
     */
    if (status != NotReachable) {
        switch ([[dataNetworkItemView valueForKey:@"dataNetworkType"] integerValue]) {
            case 0:
                //No wifi or cellular
                statusCode = RTNetworkNil;
                break;
            case 1:
                //2G
                statusCode = RTNetwork2G;
                break;
            case 2:
                //3G
                statusCode = RTNetwork3G;
                break;
            case 3:
                //4G
                statusCode = RTNetwork4G;
                break;
            case 4:
                //LTE
                statusCode = RTNetworkLTE;
                break;
            case 5:
                //Wifi
                statusCode = RTNetworkWIFI;
                break;
            default:
                break;
        }
    }
    
    [reachability stopNotifier];
    
    NSString *l_str_networkName = nil;
    switch (statusCode) {
        case RTNetworkNil:
            l_str_networkName = @"RTNetworkNil";
            break;
        case RTNetwork2G:
            l_str_networkName = @"RTNetwork2G";
            break;
        case RTNetwork3G:
            l_str_networkName = @"RTNetwork3G";
            break;
        case RTNetwork4G:
            l_str_networkName = @"RTNetwork4G";
            break;
        case RTNetworkLTE:
            l_str_networkName = @"RTNetworkLTE";
            break;
        case RTNetworkWIFI:
            l_str_networkName = @"RTNetworkWIFI";
            break;
            
        default:
            break;
    }
    
    return statusCode;
}

+ (RTNetworkType)MBNetworkType {
    
    RTNetworkType statusCode = RTNetworkNil;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            // 没有网络连接
            statusCode = RTNetworkNil;
            break;
        case ReachableViaWWAN:
            // 使用3G2G网络
            statusCode = RTNetwork2G3G;
            break;
        case ReachableViaWiFi:
            // 使用WiFi网络
            statusCode = RTNetworkWIFI;
            break;
    }
    return statusCode;
}

#pragma mark - 实时监测当前网络状态变化
+ (void)startNetworkMonitor {
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 若网络有变化，则会回调当前方法
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                // 未知状态
                NSLog(@"当前网络状态：未知状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                // 无网络
                NSLog(@"当前网络状态：无网络");
                // 当检测到无网络时,发送通知并弹出hud提示; 其它状态不提示;
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NoNetwork" object:nil];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                // 手机网络
                NSLog(@"当前网络状态：手机网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                // WiFi
                NSLog(@"当前网络状态：WiFi");
                break;
            default:
                break;
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}



#pragma mark - 接口公共参数
// 接口所需的公共参数
+ (NSDictionary *)getRequestAllDict:(NSDictionary *)otherDict {
    // 加入其他参数
    NSMutableDictionary *l_dict = [NSMutableDictionary dictionary];
    
    if (otherDict != nil) {
        for (NSString *l_key in [otherDict allKeys]) {
            [l_dict setObject:[otherDict objectForKey:l_key] forKey:l_key];
        }
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:l_dict];
    
    //加入其它参数，如用户信息
//    YWUserData *user = [YWActionUtility user];
//    [dict setSafeObject:strOrEmpty(user_defaults_get_string(@"ktoken")) forKey:@"token"];
//    [dict setSafeObject:user.mecUserId  forKey:@"userid"];
//    [dict setSafeObject:user.mid  forKey:@"username"];
//    [dict setSafeObject:kYWChannels forKey:@"channelName"];
//    [dict setObject:@(APP_Version_Code) forKey:@"versionCode"];
//    [dict setObject:KCurrentVersion forKey:@"versionName"];
//    [dict setSafeObject:NUMBER_INT(2)  forKey:@"encryptversion"];
//    [dict setSafeObject:[YWStringUtility getAdfaId]  forKey:@"idfa"];
    
    return dict;
}


@end
