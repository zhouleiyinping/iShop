//
//  StringUtility.h
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtility : NSObject



/**
 *  是否第一次加载新版本客户端
 *
 *  @return 是否第一次加载新版本客户端
 */
+ (BOOL)isAppFirstDownloadByDevice;

/**
 *  清除字符串中的html 代码
 */
+ (NSString *)filterHTML:(NSString *)html;

/**
 *  汉字转化拼音
 */
+ (NSString *)stringTransformToPinYin:(NSString *)hanzi;

/**
 *  返回label的size
 *
 *  @param input 内容
 *  @param font  字体
 *  @param width 宽度
 *
 *  @return size
 */
+ (CGSize )getStringSize:(NSString *)input font:(UIFont *)font width:(CGFloat)width;

/**
 *  获取运营商
 *
 *  @return 运营商
 */
+(NSString *)getDeviceOperator;

/**
 获取设备IDFA/IDFV
 */
+ (NSString *)getDeviceIdentifier;
/**
 *  获取系统时间
 *
 *  @return 获取系统时间(精确到毫秒)
 */
+ (long long)generateTimeIntervalWithTimeZone;

/**
 *  首次加载首页
 *
 *  @return if yes reload guide view , if not
 */
+ (BOOL)isLoadGuideView;

@end
