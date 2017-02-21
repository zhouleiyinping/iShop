//
//  AppDelegate.h
//  iShop
//
//  Created by 周磊 on 2017/2/15.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDVTabBarController.h"
#import "LCPanNavigationController.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) RDVTabBarController *tabBarController;

@property (nonatomic, strong) LCPanNavigationController *navVC;


@end

