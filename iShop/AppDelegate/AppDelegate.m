//
//  AppDelegate.m
//  iShop
//
//  Created by 周磊 on 2017/2/15.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()<RDVTabBarControllerDelegate>

@end

@implementation AppDelegate

//应用程序启动
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //  *监听网络状态
    [AFHTTPUtility startNetworkMonitor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTipForNoNetwork) name:@"NoNetwork" object:nil];
    
    /**延长启动图片显示时间 */
//    [NSThread sleepForTimeInterval:2];
    
    // 设置IQKeyboardManager
    [[IQKeyboardManager sharedManager] setEnable:YES];
    // 点击背景收起键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    

    //  *构建App架构
    [self loadRootVC];
        
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)loadRootVC {
    
    [[AppRootManager shareManager] gotoIntroView];
    
}

#pragma mark - NSNotification
- (void)showTipForNoNetwork {
    
    [AlertManager alertWithWarnType:AlertWarnTypeNoNetWork];
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
