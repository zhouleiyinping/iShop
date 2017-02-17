//
//  AFHTTPUtility.m
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AFHTTPUtility.h"

@implementation AFHTTPUtility

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
