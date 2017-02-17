//
//  AppDelegate.m
//  iShop
//
//  Created by 周磊 on 2017/2/15.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序启动
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self loadRootVC];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)loadRootVC {
    
    [[AppRootManager shareManager] gotoIntroView];

    
}


//应用从活动状态进入到非活动状态,在此期间，应用程序不接收消息或事件
- (void)applicationWillResignActive:(UIApplication *)application {
    
    
}

//应用进入到后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    
}

//应用程序从后台回到前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    
}

//应用进入前台并处于活动状态
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    
}

//应用程序将要退出
- (void)applicationWillTerminate:(UIApplication *)application {
    
    
}


@end
