//
//  SheetManager.h
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  项目全局Sheet弹窗

#import <Foundation/Foundation.h>

@interface SheetManager : NSObject

/**
 *  全局Sheet弹窗方法(无高亮无禁用按钮)
 *  @param title           标题
 *  @param buttonTitles    按钮标题数组(不可为空，否则触发NSAssert Crash)
 *  @param handler         按钮回调
 *  @param completeHandler 弹窗回调
 */
+ (void)sheetWithTitle:(NSString *)title
          buttonTitles:(NSArray<NSString *> *)buttonTitles
         buttonHandler:(MMPopupItemHandler)handler
       completeHandler:(MMPopupCompletionBlock)completeHandler;

/**
 *  全局Sheet弹窗方法(有高亮无禁用按钮)
 *  @param title           标题
 *  @param buttonTitles    按钮标题数组(不可为空，否则触发NSAssert Crash)
 *  @param hightLightTitle 需要高亮的按钮(仅支持高亮一个，尽量只高亮"删除"之类的警告性按钮)
 *  @param handler         按钮回调
 *  @param completeHandler 弹窗回调
 */
+ (void)sheetWithTitle:(NSString *)title
          buttonTitles:(NSArray<NSString *> *)buttonTitles
       hightLightTitle:(NSString *)hightLightTitle
         buttonHandler:(MMPopupItemHandler)handler
       completeHandler:(MMPopupCompletionBlock)completeHandler;

/**
 *  全局Sheet弹窗方法(有高亮有禁用按钮)
 *  @param title           标题
 *  @param buttonTitles    按钮标题数组(不可为空，否则触发NSAssert Crash)
 *  @param hightLightTitle 需要高亮的按钮(仅支持高亮一个，尽量只高亮"删除"之类的警告性按钮)
 *  @param disabledTitle   需要禁用的按钮(仅支持禁用一个，根据业务需要选择此项)
 *  @param handler         按钮回调
 *  @param completeHandler 弹窗回调
 */
+ (void)sheetWithTitle:(NSString *)title
          buttonTitles:(NSArray<NSString *> *)buttonTitles
       hightLightTitle:(NSString *)hightLightTitle
         disabledTitle:(NSString *)disabledTitle
         buttonHandler:(MMPopupItemHandler)handler
       completeHandler:(MMPopupCompletionBlock)completeHandler;


@end
