//
//  AppRootManager.m
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AppRootManager.h"
#import "AppDelegate.h"
#import "AppIntroViewController.h"
#import "ViewController.h"
#import "ZAppManager.h"

@interface AppRootManager ()

@property (nonatomic, strong) UIWindow *window;

@end

@implementation AppRootManager

static AppRootManager *shareManager = nil;


+ (AppRootManager *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[AppRootManager alloc] init];
    });
    return shareManager;
}

- (id)init {
    self = [super init];
    if (self) {
        _window = [self mainWindow];
    }
    return self;
}

- (void)gotoIntroView {
    
    if ([StringUtility isLoadGuideView]) {
        
        AppIntroViewController *introController = [[AppIntroViewController alloc] init];
        self.window.rootViewController = introController;
    }
    else {
        [self gotoMainView];
    }
}

- (void)gotoMainView {
    
    
    //  *配置URL缓存
    [ZAManager setURLCache];
    
    //  *构建App架构
    [ZAManager initializationInterface];
    
    //  *3DTouch配置
    if (iOS(9)) {

    }
}


- (UIWindow *)mainWindow {
    
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app.delegate respondsToSelector:@selector(window)]) {
        return [app.delegate window];
    } else {
        return [app keyWindow];
    }
}

@end
