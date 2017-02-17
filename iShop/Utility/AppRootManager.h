//
//  AppRootManager.h
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  

#import <Foundation/Foundation.h>

@interface AppRootManager : NSObject

+ (AppRootManager *)shareManager;

- (void)gotoIntroView;

- (void)gotoMainView;
@end
