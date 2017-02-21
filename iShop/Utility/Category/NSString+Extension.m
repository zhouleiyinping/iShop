//
//  NSString+Extension.m
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

// 空内容检测
+ (BOOL)checkContent:(NSString *)message
{
    if (message == nil || [message isEqualToString:@""] == YES) {
        return NO;
    }
    
    NSString *msg = [message stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (msg == nil || [msg isEqualToString:@""] == YES) {
        return NO;
    }
    
    return YES;
}
// 手机号
+ (BOOL)checkTel:(NSString *)mobile
{
    //    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSString *regex = @"^((1[0-9]))\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:mobile];
}

//邮箱
+ (BOOL)checkEmail:(NSString *)email
{
    
    NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:[email lowercaseString]];
}

// 身份证
+ (BOOL)checkIDCardNumber:(NSString *)idCard
{
    
    NSString *IDRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    
    NSPredicate *IDTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IDRegex];
    return [IDTest evaluateWithObject:idCard];
}

//验证身份证
//必须满足以下规则
//1. 长度必须是18位，前17位必须是数字，第十八位可以是数字或X
//2. 前两位必须是以下情形中的一种：11,12,13,14,15,21,22,23,31,32,33,34,35,36,37,41,42,43,44,45,46,50,51,52,53,54,61,62,63,64,65,71,81,82,91
//3. 第7到第14位出生年月日。第7到第10位为出生年份；11到12位表示月份，范围为01-12；13到14位为合法的日期
//4. 第17位表示性别，双数表示女，单数表示男
//5. 第18位为前17位的校验位
//算法如下：
//（1）校验和 = (n1 + n11) * 7 + (n2 + n12) * 9 + (n3 + n13) * 10 + (n4 + n14) * 5 + (n5 + n15) * 8 + (n6 + n16) * 4 + (n7 + n17) * 2 + n8 + n9 * 6 + n10 * 3，其中n数值，表示第几位的数字
//（2）余数 ＝ 校验和 % 11
//（3）如果余数为0，校验位应为1，余数为1到10校验位应为字符串“0X98765432”(不包括分号)的第余数位的值（比如余数等于3，校验位应为9）
//6. 出生年份的前两位必须是19或20
+ (BOOL)verifyIDCardNumber:(NSString *)value
{
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([value length] != 18) {
        return NO;
    }
    
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd, @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:value]) {
        return NO;
    }
    
    int summary = ([value substringWithRange:NSMakeRange(0, 1)].intValue + [value substringWithRange:NSMakeRange(10, 1)].intValue) * 7 + ([value substringWithRange:NSMakeRange(1, 1)].intValue + [value substringWithRange:NSMakeRange(11, 1)].intValue) * 9 + ([value substringWithRange:NSMakeRange(2, 1)].intValue + [value substringWithRange:NSMakeRange(12, 1)].intValue) * 10 + ([value substringWithRange:NSMakeRange(3, 1)].intValue + [value substringWithRange:NSMakeRange(13, 1)].intValue) * 5 + ([value substringWithRange:NSMakeRange(4, 1)].intValue + [value substringWithRange:NSMakeRange(14, 1)].intValue) * 8 + ([value substringWithRange:NSMakeRange(5, 1)].intValue + [value substringWithRange:NSMakeRange(15, 1)].intValue) * 4 + ([value substringWithRange:NSMakeRange(6, 1)].intValue + [value substringWithRange:NSMakeRange(16, 1)].intValue) * 2 + [value substringWithRange:NSMakeRange(7, 1)].intValue * 1 + [value substringWithRange:NSMakeRange(8, 1)].intValue * 6 + [value substringWithRange:NSMakeRange(9, 1)].intValue * 3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder, 1)]; // 判断校验位
    
    return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17, 1)] uppercaseString]];
}

// 去掉超链接
+ (NSString *)removeHyperLinkFromContent:(NSString *)content
{
    NSString *string = [NSString stringWithString:content];
    // 去掉</a>
    string = [string stringByReplacingOccurrencesOfString:@"</a>" withString:@""];
    
    BOOL hasRemove = NO;
    
    while (!hasRemove) {
        NSRange myRange = [string rangeOfString:@"<a href=" options:NSCaseInsensitiveSearch];
        if (myRange.location == NSNotFound) {
            //NSLog(@"未找到超链接的前缀");
            hasRemove = YES;
        }
        else {
            NSRange endRange = [string rangeOfString:@">" options:NSCaseInsensitiveSearch];
            if (endRange.location == NSNotFound) {
                //NSLog(@"未找到超链接的后缀");
                hasRemove = YES;
            }
            else {
                //NSLog(@"已找到超链接");
                if (endRange.location <= myRange.location) {
                    hasRemove = YES;
                }
                else {
                    NSRange newRange = NSMakeRange(myRange.location, endRange.location - myRange.location + 1);
                    string = [string stringByReplacingCharactersInRange:newRange withString:@""];
                }
            }
        }
    }
    
    return string;
}

// 去掉<font color=red>xxoo</font>
+ (NSString *)removeFontTagFromContent:(NSString *)content
{
    NSString *string = [NSString stringWithString:content];
    // 去掉</font>
    string = [string stringByReplacingOccurrencesOfString:@"</font>" withString:@""];
    
    BOOL hasRemove = NO;
    
    while (!hasRemove) {
        NSRange myRange = [string rangeOfString:@"<font" options:NSCaseInsensitiveSearch];
        if (myRange.location == NSNotFound) {
            //NSLog(@"未找到font的前缀");
            hasRemove = YES;
        }
        else {
            NSRange endRange = [string rangeOfString:@">" options:NSCaseInsensitiveSearch];
            if (endRange.location == NSNotFound) {
                //NSLog(@"未找到font的后缀");
                hasRemove = YES;
            }
            else {
                //NSLog(@"已找到font标签");
                if (endRange.location <= myRange.location) {
                    hasRemove = YES;
                }
                else {
                    NSRange newRange = NSMakeRange(myRange.location, endRange.location - myRange.location + 1);
                    string = [string stringByReplacingCharactersInRange:newRange withString:@""];
                }
            }
        }
    }
    
    return string;
}

- (BOOL)myContainsString:(NSString *)other
{
    NSRange range = [self rangeOfString:other];
    return range.length != 0;
}

#pragma mark - 计算字符串高度

- (float)heightWithFont:(UIFont *)font andWidth:(float)width
{
    float height = 0;
    float theHeight = 0;
    NSArray *array = [self componentsSeparatedByString:@"\n"];
    for (NSString *str in array) {
        if (str == nil || [str isEqualToString:@""] == YES) {
            CGSize size = textSizeWithFont(@"test", font);
            theHeight = size.height;
            height += theHeight;
            continue;
        }
        CGSize size = textSizeWithFont(str, font);
        theHeight = size.height;
        int count = size.width / width;
        height += theHeight * (count + 1);
    }
    height = height - theHeight;
    return height;
}

- (float)calculateHeightWithFont:(UIFont *)font andWidth:(float)width
{
    // 判断是否存在换行符
    NSRange range = [self rangeOfString:@"\n"];
    if (range.location == NSNotFound) {
        // 不存在
        CGSize size = textSizeWithFont(self, font);
        int rowNum = size.width / width;
        return (rowNum + 1) * size.height;
    }
    else {
        // 存在
        float height = 0;
        float theHeight = 0;
        NSArray *array = [self componentsSeparatedByString:@"\n"];
        for (NSString *str in array) {
            if (str == nil || [str isEqualToString:@""] == YES) {
                CGSize size = textSizeWithFont(@"test", font);
                theHeight = size.height;
                height += theHeight;
                continue;
            }
            CGSize size = textSizeWithFont(str, font);
            theHeight = size.height;
            int count = size.width / width;
            height += theHeight * (count + 1);
        }
        return height;
    }
}

- (CGFloat)calculateMultilineHeightWithFont:(UIFont *)font andWidth:(float)width
{
    // 判断是否存在换行符
    NSRange range = [self rangeOfString:@"\n"];
    if (range.location == NSNotFound) {
        // 不存在
        CGSize size = multilineTextSize(self, font, CGSizeMake(width, 1000.f));
        return size.height;
        
        //        NSInteger rowNum = size.width / width;
        //        return (rowNum+1) * size.height;
    }
    else {
        // 存在
        float height = 0;
        float theHeight = 0;
        NSArray *array = [self componentsSeparatedByString:@"\n"];
        for (NSString *str in array) {
            if (str == nil || [str isEqualToString:@""] == YES) {
                CGSize size = multilineTextSize(@"test", font, CGSizeMake(width, 1000.f));
                theHeight = size.height;
                height += theHeight;
                continue;
            }
            CGSize size = multilineTextSize(str, font, CGSizeMake(width, 1000.f));
            theHeight = size.height;
            int count = size.width / width;
            height += theHeight * (count + 1);
        }
        return height;
    }
}

+ (NSString *)showOddsMethod:(CGFloat)odds
{
    NSString *strShow = @"0.0";
    if (odds >= 100.0f) {
        strShow = [NSString stringWithFormat:@"%.0f", odds];
    }
    else {
        strShow = [NSString stringWithFormat:@"%.2f", odds];
    }
    return strShow;
}

/*
 * @brief 把JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString != nil && jsonString.length > 0) {
        // 去掉制表符...<标准的json解析是不允许有这几个制表符的>
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
        
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if (error != nil) {
            NSLog(@"json解析失败：%@", error);
            return nil;
        }
        
        return dic;
    }
    
    return nil;
}

#pragma mark - 检查字符串数字英文组合

+ (BOOL)isCharacterString:(NSString *)string
{
    NSString *chracterRegex = @"^[A-Za-z]+$";
    NSPredicate *characterTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", chracterRegex];
    
    return [characterTest evaluateWithObject:string];
}

+ (BOOL)isPureIntString:(NSString *)string
{
    NSString *numRegex = @"^\\d+$";
    NSPredicate *amountTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRegex];
    
    return [amountTest evaluateWithObject:string];
}

+ (BOOL)isStringOfString:(NSString *)string
{
    NSString *stringRegex = @"[^0-9a-zA-Z]*";
    NSPredicate *characterTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    
    return [characterTest evaluateWithObject:string];
}


@end
