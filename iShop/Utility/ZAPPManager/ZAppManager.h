//
//  ZAppManager.h
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZAManager [ZAppManager defaultManager]

@interface ZAppManager : NSObject

/**
 *  单例
 *  @return 单例
 */
+ (ZAppManager *)defaultManager;

#pragma mark - 构建视图相关
/**
 *  初始化界面
 */
- (void)initializationInterface;

#pragma mark - 业务相关

/**
 *  配置URL缓存
 */
- (void)setURLCache;



@end
