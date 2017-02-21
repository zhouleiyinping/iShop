//
//  ZAppManager.m
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "ZAppManager.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "ActivityViewController.h"
#import "RDVTabBarItem.h"

@interface ZAppManager () <RDVTabBarControllerDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation ZAppManager

+ (ZAppManager *)defaultManager {
    
    static ZAppManager *defaultManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultManager = [[ZAppManager alloc] init];
    });
    return defaultManager;
}

- (id)init {
    
    self = [super init];
    if (self) {
        _window = [self mainWindow];
    }
    return self;
}

#pragma mark 构建视图相关
/**
 * 初始化界面
 */
- (void)initializationInterface {
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    MineViewController *mineVC = [[MineViewController alloc] init];
    ActivityViewController *activityVC = [[ActivityViewController alloc] init];

    
    self.appDelegate.tabBarController = [[RDVTabBarController alloc] init];
    self.appDelegate.tabBarController.delegate = self;

    [self.appDelegate.tabBarController setViewControllers:@[homeVC, activityVC, mineVC]];
    
    // 背景图片
    UIImage *imgBg = [kGetImage(@"tabbarBg") resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    
    UIImage *finishedImage = imgBg;
    UIImage *unfinishedImage = imgBg;
    
    // icon
    NSArray *tabBarItemImages = @[ @"yw_home_normal_new",
                                   @"yw_category_normal_new",
                                   @"yw_account_normal_new"];
    
    NSArray *tabBarItemSelectedImages = @[ @"yw_home_selected_new",
                                           @"yw_category_selected_new",
                                           @"yw_account_selected_new"];
    
    // title
    NSArray *tabBarItemTitles = @[@"主页", @"活动", @"我的"];
    
    NSInteger tabItemsCount = self.appDelegate.tabBarController.tabBar.items.count;

    for (int i = 0; i < tabItemsCount; i++) {
        
        RDVTabBarItem *item = self.appDelegate.tabBarController.tabBar.items[i];
        
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];

        NSString *nameUnselected = [tabBarItemImages objectAtIndex:i];
        NSString *nameselected = [tabBarItemSelectedImages objectAtIndex:i];
        UIImage *imgUnselected = kGetImage(nameUnselected);
        UIImage *imgSelected = kGetImage(nameselected);
        [item setFinishedSelectedImage:imgSelected withFinishedUnselectedImage:imgUnselected];
        
        [item setTitle:[tabBarItemTitles objectAtIndex:i]];
        
        item.selectedTitleAttributes = @{
                                         NSFontAttributeName: [UIFont boldSystemFontOfSize:12],
                                         NSForegroundColorAttributeName:RGBColor(252, 103, 105),
                                         };
        item.unselectedTitleAttributes = @{
                                           NSFontAttributeName: [UIFont boldSystemFontOfSize:12],
                                           NSForegroundColorAttributeName:[UIColor grayColor],
                                           };
    }
    
    self.appDelegate.navVC = [[LCPanNavigationController alloc] initWithRootViewController:self.appDelegate.tabBarController];
    self.window.rootViewController = self.appDelegate.navVC;
    
    /** 配置全局Alert/Sheet弹窗风格 */
    [self setAlertSheetStyle];
    
}


/**
 *  配置URL缓存
 */
- (void)setURLCache {
    
    int cacheSizeMemory = 4 * 1024 * 1024; // 4MB
    int cacheSizeDisk = 32 * 1024 * 1024;  // 32MB
    NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:cacheSizeMemory
                                                            diskCapacity:cacheSizeDisk
                                                                diskPath:@"nsurlcache"];
    [NSURLCache setSharedURLCache:sharedCache];
}


/**
 *  配置全局Alert、Sheet弹窗风格
 */
- (void)setAlertSheetStyle {
    
    [[MMPopupWindow sharedWindow] cacheWindow]; 
    [MMPopupWindow sharedWindow].touchWildToHide = YES;
    
    MMAlertViewConfig *alertConfig = [MMAlertViewConfig globalConfig];
    MMSheetViewConfig *sheetConfig = [MMSheetViewConfig globalConfig];
    
    alertConfig.itemNormalColor = YWDefaultLightTextBlueColor;
    sheetConfig.itemNormalColor = YWDefaultLightTextBlueColor;
}

#pragma mark - Getters
- (UIWindow *)mainWindow {
    
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app.delegate respondsToSelector:@selector(window)]) {
        return [app.delegate window];
    }
    else {
        return [app keyWindow];
    }
}

- (AppDelegate *)appDelegate {
    
    UIApplication *app = [UIApplication sharedApplication];
    return (AppDelegate *) app.delegate;
}

@end
