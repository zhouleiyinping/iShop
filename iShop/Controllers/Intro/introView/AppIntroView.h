//
//  AppIntroView.h
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IntroViewDelegate <NSObject>

- (void)introOver;

@end

@interface AppIntroView : UIView

@property (nonatomic, weak) id <IntroViewDelegate> delegate;
@property (nonatomic, assign) BOOL showPageControl;
@property (nonatomic, assign) CGFloat pageControlHeight;

- (void)setGuideImages:(NSArray*)images;

@end
