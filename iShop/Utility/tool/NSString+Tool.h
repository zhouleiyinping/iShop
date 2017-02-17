//
//  NSString+Tool.h
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tool)

/**
 *  校验邮箱格式
 *
 *  @param email 需要校验的邮箱
 *
 *  @return 返回结果
 */
+(BOOL) isEmail:(NSString *)email;
/**
 *  校验手机号格式
 *
 *  @param mobile 手机号
 *
 *  @return 结果
 */
+(BOOL) isPhoneNum:(NSString *)mobile;
/**
 *  校验车牌号
 *
 *  @param carNo 车牌号
 *
 *  @return 结果
 */
+(BOOL) isValidateCarNo:(NSString*)carNo;
/**
 *  校验身份证号
 *
 *  @param idCardNo 身份证号
 *
 *  @return 结果
 */
+(BOOL) isValidateIDCardNo:(NSString *)idCardNo;

//获取当前的时间，转成字符串 格式默认为 yyyy-MM-dd
+ (NSString *)stringWithNowDate;
+ (NSString *)stringWithDate:(NSDate *)date formater:(NSString *)formater;
//获取当前时间
+ (NSString *)getCurrentTime;
/**
 *  判断字符串是否为空
 */
+ (BOOL)isBlank:(NSString *)str;

/**
 根据指定的字体，和宽度计算字符串的高度
 @param input 字符串
 @param font  使用的字体
 @param width 宽度
 */
+ (CGFloat)getStringHight:(NSString *)input font:(UIFont *)font width:(CGFloat)width;

@end
