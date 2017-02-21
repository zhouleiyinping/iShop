//
//  StringUtility.m
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "StringUtility.h"
#include <sys/sysctl.h>
#import <UIKit/UIKit.h>
#import <AdSupport/ASIdentifierManager.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <Security/Security.h>

#define LAST_RUN_VERSION_KEY @"lastVersion"


@implementation StringUtility


/**
 *  是否第一次加载新版本客户端
 *
 *  @return 是否第一次加载新版本客户端
 */
+ (BOOL)isAppFirstDownloadByDevice{
    
    NSNumber *l_bool_isAppFirstDownloadByDevice = [[NSUserDefaults standardUserDefaults] objectForKey:@"isAppFirstDownloadByDevice"];
    
    if (l_bool_isAppFirstDownloadByDevice==nil) {
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"isAppFirstDownloadByDevice"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }else{
        
        return [l_bool_isAppFirstDownloadByDevice boolValue];
    }
}

//汉字转拼音
+ (NSString *)stringTransformToPinYin:(NSString *)hanzi {
    
    if ([hanzi length]) {
        NSMutableString *mutable = [[NSMutableString alloc] initWithString:hanzi];
        CFStringTransform((__bridge CFMutableStringRef)mutable, NULL, kCFStringTransformMandarinLatin, NO);
        CFStringTransform((__bridge CFMutableStringRef)mutable, NULL, kCFStringTransformStripDiacritics, NO);
        NSString *pinyin = [mutable stringByReplacingOccurrencesOfString:@" " withString:@""];
        return pinyin;
    }
    return @"";
}
/**
 *  清除字符串中的html 代码
 */
+ (NSString *)filterHTML:(NSString *)html {
    
    NSScanner *scanner = [NSScanner scannerWithString:html];
    NSString *text = nil;
    while([scanner isAtEnd] == NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    return html;
}

+ (CGSize)getStringSize:(NSString *)input font:(UIFont *)font width:(CGFloat)width {
    
    if (input == nil || font == nil || width <= 0) {
        return CGSizeMake(0., 0.);
    }
    
    CGSize size = [input boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size;
}

/**
 *  获取运营商
 *
 *  @return 运营商
 */
+(NSString *)getDeviceOperator{
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    if (carrier != nil) {
        
        NSString *code = [carrier mobileNetworkCode];
        if (code != nil) {
            if ([code isEqualToString:@"00"] || [code isEqualToString:@"02"] || [code isEqualToString:@"07"]) {
                
                return @"China Mobile";
            }else if ([code isEqualToString:@"01"] || [code isEqualToString:@"06"]) {
                
                return @"China Unicom";
            }else if ([code isEqualToString:@"03"] || [code isEqualToString:@"05"]) {
                
                return @"China Telecom";
            }else if ([code isEqualToString:@"20"]) {
                
                return @"China Tietong";
            }
        }
    }
    
    return @"Unknown Network";
}
//获取系统时间
+ (long long)generateTimeIntervalWithTimeZone{
    
    NSDate *date = [NSDate date];
    NSTimeInterval time = [date timeIntervalSince1970]*1000;//毫秒数要乘以1000
    
    return [[NSString stringWithFormat:@"%.f",time] longLongValue];
}

+ (NSString *)getDeviceIdentifier {
    
    if (TARGET_IPHONE_SIMULATOR) {
        return @"2B356577-2BF2-4AF7-8971-0A1D20BF43A9";
    }
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    
    //从钥匙串中获取唯一设备标识
    NSString *deviceIdentifier = [self load:bundleIdentifier];
    if (deviceIdentifier) {
        //如果钥匙串中存在唯一标识，则直接返回
        return deviceIdentifier;
    }
    //获取IDFA
    NSString *IDFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    //判断IDFA是否为空
    BOOL isEmpty = [[IDFA stringByReplacingOccurrencesOfString:@"-" withString:@""] stringByReplacingOccurrencesOfString:@"0" withString:@""].length;
    if (isEmpty) {
        //不为空，将IDFA作为唯一标识
        deviceIdentifier = IDFA;
    }
    else {
        //为空，获取IDFV作为唯一标识
        deviceIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    //保存唯一设备标识
    [self save:bundleIdentifier data:deviceIdentifier];
    //返回唯一标识
    return deviceIdentifier;
}
+ (id)load:(NSString *)service {
    NSString *ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        }
    }
    if (keyData) {
        CFRelease(keyData);
    }
    return ret;
}
+ (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword, (id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock, (id)kSecAttrAccessible,
            nil];
}

//APP首次启动或者更新后首次启动
+ (BOOL)isLoadGuideView
{
    NSString *currentVersion = APPCurrentVersion;
    NSString *lastRunVersion = user_defaults_get_string(LAST_RUN_VERSION_KEY);
    
    if (!lastRunVersion) {
        user_defaults_set_string(LAST_RUN_VERSION_KEY, currentVersion)
        return YES;
    }
    else if (![lastRunVersion isEqualToString:currentVersion]) {
        user_defaults_set_string(LAST_RUN_VERSION_KEY, currentVersion)
        return YES;
    }
    
    return NO;
}
@end
