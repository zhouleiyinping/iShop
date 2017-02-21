//
//  AlertManager.h
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  项目全局Alert弹窗

#import <Foundation/Foundation.h>
#import "MMAlertView.h"

/**
 *  警告性选择
 */
typedef NS_ENUM(NSUInteger, AlertWarnType) {
    /**
     *  无网络提示
     */
    AlertWarnTypeNoNetWork,
    /**
     *  网络异常提示
     */
    AlertWarnTypeNetWorkException,
    /**
     *  服务器异常提示
     */
    AlertWarnTypeServerException
};

@interface AlertManager : NSObject

/**
 *  全局便捷警告Alert弹窗方法
 *  @param title         标题(如果不传默认显示"温馨提示")
 *  @param message       提示用户文字(不可为空，否则触发NSAssert Crash)
 *  @param completeBlock 弹窗回调
 */
+ (void)alertWithConfirmTitle:(NSString *)title
                      message:(NSString *)message
              completionBlock:(MMPopupCompletionBlock)completeBlock;


/**
 *  全局Alert弹窗方法(无高亮按钮)
 *  @param title        标题(如果不传默认显示"温馨提示")
 *  @param message      提示用户文字(不可为空，否则触发NSAssert Crash)
 *  @param buttonTitles 按钮标题数组(如果不传默认为"取消", "确定")
 *  @param attachedView 依附View(不可为空，否则触发NSAssert Crash)
 *  @param handler      按钮回调
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
          buttonTitles:(NSArray<NSString *> *)buttonTitles
          attachedView:(UIView *)attachedView
               handler:(MMPopupItemHandler)handler;

/**
 *  全局Alert弹窗方法(有高亮按钮)
 *  @param title           标题(如果不传默认显示"温馨提示")
 *  @param message         提示用户文字(不可为空，否则触发NSAssert Crash)
 *  @param buttonTitles    按钮标题数组(如果不传默认为"取消", "确定")
 *  @param hightLightTitle 需要高亮的按钮(仅支持高亮一个，尽量只高亮"删除"之类的警告性按钮)
 *  @param attachedView    依附View(不可为空，否则触发NSAssert Crash)
 *  @param handler         按钮回调
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
          buttonTitles:(NSArray<NSString *> *)buttonTitles
       hightLightTitle:(NSString *)hightLightTitle
          attachedView:(UIView *)attachedView
               handler:(MMPopupItemHandler)handler;

/**
 *  全局Alert弹窗方法(有高亮、禁用按钮)
 *  @param title           标题(如果不传默认显示"温馨提示")
 *  @param message         提示用户文字(不可为空，否则触发NSAssert Crash)
 *  @param buttonTitles    按钮标题数组(如果不传默认为"取消", "确定")
 *  @param hightLightTitle 需要高亮的按钮(仅支持高亮一个，尽量只高亮"删除"之类的警告性按钮)
 *  @param disabledTitle   需要禁用的按钮(仅支持禁用一个，根据业务需要选择此项)
 *  @param attachedView    依附View(不可为空，否则触发NSAssert Crash)
 *  @param handler         按钮回调
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
          buttonTitles:(NSArray<NSString *> *)buttonTitles
       hightLightTitle:(NSString *)hightLightTitle
         disabledTitle:(NSString *)disabledTitle
          attachedView:(UIView *)attachedView
               handler:(MMPopupItemHandler)handler;


/**
 *  根据警告性类型提示用户网络连接状况
 *  @param warnType 类型
 */
+ (void)alertWithWarnType:(AlertWarnType)warnType;

@end
