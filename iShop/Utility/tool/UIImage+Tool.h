//
//  UIImage+Tool.h
//  iShop
//
//  Created by 周磊 on 2017/2/16.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tool)

/**
 *  通过颜色创建image
 *
 *  @param aColor 颜色
 *
 *  @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor;

/**
 *  通过颜色创建image
 */
+ (UIImage*)imageWithColor:(UIColor *)aColor size:(CGSize)size;

//设置图片透明度
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;

/**
 *  等比例缩放
 *
 *  @param size 大小
 *
 *  @return image
 */
-(UIImage*)scaleToSize:(CGSize)size;

/**
 *	按照尺寸缩放图片
 */
- (UIImage *)shrinkImageForSize:(CGSize)aSize;

/**
 *	功能:存储图片到doc目录
 *
 *	@param imageName :图片名称
 *	@param aQuality  :压缩比率
 */
- (NSString *)saveImageWithName:(NSString *)imageName
          forCompressionQuality:(CGFloat )aQuality;

/**
 *  修补图片方向
 *
 */
- (UIImage *)fixOrientation;

@end
