//
//  AppIntroView.m
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AppIntroView.h"

@interface AppIntroView ()

@property (nonatomic, strong) UIScrollView *middleView;
@property (nonatomic, strong) StyledPageControl *pageControl;
@property (nonatomic, strong) UIButton *overButton;
@property (nonatomic, strong) UIButton *skipButton;

@end

@implementation AppIntroView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    
    [self addSubview:self.middleView];
    [self addSubview:self.pageControl];
    [self addSubview:self.overButton];
    [self addSubview:self.skipButton];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(40);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).with.offset(-ScreenHeight/20);
    }];
    [self.skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(44);
        make.top.equalTo(self.mas_top).with.offset(ScreenHeight/30-5);
        make.right.equalTo(self.mas_right).with.offset(-0);
    }];
    [self.overButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).with.offset(-85);
    }];
}

- (void)setGuideImages:(NSArray *)images {
    
    for (int i = 0; i < images.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.userInteractionEnabled = YES;
        imageView.image = [UIImage imageNamed:images[i]];
        imageView.frame = CGRectMake(self.bounds.size.width * i, 0.f, self.bounds.size.width, self.bounds.size.height);
        [self.middleView addSubview:imageView];
        
        if (i == images.count - 1) {
            UITapGestureRecognizer *tapGuseture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(overAction)];
            imageView.userInteractionEnabled = YES;
            [imageView addGestureRecognizer:tapGuseture];
        }
    }
    
    self.middleView.contentSize = CGSizeMake(self.bounds.size.width * images.count, self.bounds.size.height);
    self.pageControl.numberOfPages = (int)images.count;
    self.pageControl.currentPage = 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSUInteger newIndex = floor(scrollView.contentOffset.x / scrollView.frame.size.width);
    
    self.pageControl.currentPage = (int)newIndex;
    
    if (self.pageControl.numberOfPages - 1 == newIndex) {
        self.overButton.hidden = NO;
    } else {
        self.overButton.hidden = YES;
    }
    
}

- (void)overAction {
    
    if ([self.delegate respondsToSelector:@selector(introOver)]) {
        [self.delegate introOver];
    }
    
    [UIView animateWithDuration:.8f
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.alpha = 0;
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}


- (UIScrollView *)middleView {
    
    if (!_middleView) {
        _middleView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _middleView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _middleView.backgroundColor = [UIColor clearColor];
        _middleView.pagingEnabled = YES;
        _middleView.showsHorizontalScrollIndicator = NO;
    }
    
    return _middleView;
}

- (StyledPageControl *)pageControl {
    
    if (!_pageControl) {
        _pageControl = [[StyledPageControl alloc] initWithFrame:CGRectZero];
        _pageControl.enabled = NO;
        _pageControl.pageControlStyle = PageControlStyleDefault;
        _pageControl.coreNormalColor = [UIColor whiteColor];
        _pageControl.coreSelectedColor = [UIColor darkGrayColor];
        _pageControl.diameter = 8;
        _pageControl.hidden = YES;
    }
    
    return _pageControl;
}

- (UIButton *)overButton {
    
    if (!_overButton) {
        _overButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_overButton addTarget:self action:@selector(overAction) forControlEvents:UIControlEventTouchUpInside];
        _overButton.hidden = YES;
    }
    
    return _overButton;
}

- (UIButton*)skipButton {
    if (!_skipButton) {
        _skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_skipButton addTarget:self action:@selector(overAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _skipButton;
}


@end
