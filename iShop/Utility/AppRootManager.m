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

- (void)gotoMainView
{
    ViewController *vc = [[ViewController alloc]init];
    [self.window setRootViewController:vc];
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
