//
//  NSString+Extension.h
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

// 检验内容是否为空
+ (BOOL)checkContent:(NSString *)message;


// 检测手机号
+ (BOOL)checkTel:(NSString *)mobile;

// 检测邮箱
+ (BOOL)checkEmail:(NSString *)email;

// 检测身份证
+ (BOOL)checkIDCardNumber:(NSString *)idCard;

// 校验身份证号码 是否合法
+ (BOOL)verifyIDCardNumber:(NSString *)value;

// 去掉内容中的超链接
+ (NSString *)removeHyperLinkFromContent:(NSString *)content;

// 去掉内容中的字体标签
+ (NSString *)removeFontTagFromContent:(NSString *)content;

- (BOOL)myContainsString:(NSString *)other;

// 检查字符串是否为全英文字符
+ (BOOL)isCharacterString:(NSString *)string;

// 检查字符串是否为全数字字符
+ (BOOL)isPureIntString:(NSString *)string;

// 检查字符串是否为全符号字符
+ (BOOL)isStringOfString:(NSString *)string;

// 计算字符串高度
- (float)heightWithFont:(UIFont *)font andWidth:(float)width;
- (float)calculateHeightWithFont:(UIFont *)font andWidth:(float)width; // 已无地方调用

// 计算多行文本高度
- (CGFloat)calculateMultilineHeightWithFont:(UIFont *)font andWidth:(float)width;

// 把JSON格式的字符串转换成字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
