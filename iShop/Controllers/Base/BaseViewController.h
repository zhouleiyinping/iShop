//
//  BaseViewController.h
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum  {
    BasePushType,     //直接压栈
    BasePresentType   //
}BaseLoadType;

@interface BaseViewController : UIViewController

/**
 *  导航栏标题
 */
@property (nonatomic, strong) UILabel  *titleLabel;
/**
 *  返回按钮
 */
@property (nonatomic, strong) UIButton *backButton;
/**
 *  自定义导航栏
 */
@property (nonatomic, strong) UIView   *navView;

/** 视图控制器加载类型 */
@property (nonatomic, assign) BaseLoadType loadType;
/**
 *  隐藏导航栏
 *
 *  @param hidden YESorNO
 */
- (void)hideNavigationBar:(BOOL)hidden;

@end
