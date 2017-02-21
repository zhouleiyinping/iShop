//
//  UIDevice+Extension.h
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Extension)


/**
 *  宏系统版本进行比较
 *
 *  @param v Version, like @"8.0"
 *
 *  @return Return a BOOL
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


/**
 *  获取设备平台字符串
 *
 *  @return 返回设备平台字符串
 */
+ (NSString *)devicePlatform;


/**
 *  获取设备名称
 *
 *  @return 设备名称
 */
+ (NSString *)devicePlatformString;

/**
 *  检查当前的设备是iPad
 *
 *  @return Return YES if it's an iPad, NO if not
 */
+ (BOOL)isiPad;

/**
 *  检查当前的设备是iPhone
 *
 *  @return Return YES if it's an iPhone, NO if not
 */
+ (BOOL)isiPhone;

/**
 *  检查当前的设备是iPod
 *
 *  @return Return YES if it's an iPod, NO if not
 */
+ (BOOL)isiPod;

/**
 *  检查当前设备是否为模拟器
 *
 *  @return 结果BOOL
 */
+ (BOOL)isSimulator;

/**
 *  检查当前的设备是否为Retina屏
 *
 *  @return Return YES if it has a Retina display, NO if not
 */
+ (BOOL)isRetina;

/**
 *  检查当前的设备有Retina高清显示
 *
 *  @return Return YES if it has a Retina HD display, NO if not
 */
+ (BOOL)isRetinaHD;

/**
 *  can photos
 *
 *  @return Return YES if can ,NO if not
 */
+ (BOOL)isCanCarmera;
/**
 *  检查当前的设备是否可以发送消息
 *
 *  @return Return YES if can ,NO if not
 */
+ (BOOL)isCanSMS;


/**
 *  判断设备是否安装sim卡
 
 @return Returen YES if can,NO if not
 */
+ (BOOL)isSIMInstalled;

/**
 *  获取ios系统版本
 *
 *  @return 结果
 */
+ (NSString *)iOSVersion;

/**
 *  返回当前设备的CPU频率
 *
 *  @return 返回当前设备的CPU频率
 */
+ (NSUInteger)cpuFrequency;

/**
 *  获取当前设备总线频率
 *
 *  @return 返回当前设备总线频率
 */
+ (NSUInteger)busFrequency;

/**
 *  获取当前设备内存大小
 *
 *  @return 返回当前设备内存大小
 */
+ (NSUInteger)ramSize;

/**
 *  获取当前设备的CPU数量
 *
 *  @return 返回当前设备的CPU数量
 */
+ (NSUInteger)cpuNumber;

/**
 *  获取当前设备总内存
 *
 *  @return 返回当前设备总内存
 */
+ (NSUInteger)totalMemory;

/**
 *   获取前设备用户内存
 *
 *  @return 返回当前设备用户内存
 */
+ (NSUInteger)userMemory;

/**
 *  获取当前设备总磁盘空间
 *
 *  @return 返回当前设备总磁盘空间
 */
+ (NSNumber *)totalDiskSpace;

/**
 *  获取当前设备空闲磁盘空间
 *
 *  @return 返回当前设备空闲磁盘空间
 */
+ (NSNumber *)freeDiskSpace;

/**
 *  获取当前设备的MAC地址
 *
 *  @return 返回当前设备的MAC地址
 */
+ (NSString *)macAddress;

/**
 *  生成一个惟一的标识符和存储到本地
 *
 */
+ (NSString *)uniqueIdentifier;


@end
