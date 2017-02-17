//
//  UIColor+Tool.h
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Tool)

/**
 *	@brief	获取颜色对象
 *
 *	@param 	string 	颜色描述字符串，带“＃”开头
 *
 *	@return	颜色对象
 */
+ (UIColor *)colorWithString:(NSString *)string;

/**
 *	@brief	获取颜色对象
 *
 *	@param 	 r G B A
 *
 *	@return	颜色对象
 */
+ (UIColor *)colorWithR:(float)r G:(float)g B:(float)b A:(float)a;

+ (UIColor *)colorWithHex:(NSString *)hex;

@end
