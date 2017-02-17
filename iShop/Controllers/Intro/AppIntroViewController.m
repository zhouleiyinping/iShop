//
//  AppIntroViewController.m
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AppIntroViewController.h"
#import "AppIntroView.h"

@interface AppIntroViewController ()<
IntroViewDelegate>

@property (nonatomic, strong) AppIntroView *introView;

@end

@implementation AppIntroViewController


- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.introView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];

}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
}

#pragma mark - IntroViewDelegate
- (void)introOver {
    
    [[AppRootManager shareManager] gotoMainView];

}


- (AppIntroView*)introView {
    
    if (!_introView) {
        NSArray *images = @[@"splash_1.jpg", @"splash_2.png", @"splash_3.png",@"splash_4.png"];
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        _introView = [[AppIntroView alloc] initWithFrame:screenRect];
        _introView.delegate = self;
        [_introView setGuideImages:images];
    }
    return _introView;
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
