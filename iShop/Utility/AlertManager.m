//
//  AlertManager.m
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "AlertManager.h"

@implementation AlertManager

/**
 *  基础弹窗初始化方法
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
               mmItems:(NSArray<MMPopupItem *> *)mmItems
          attachedView:(UIView *)attachedView
{
    MMAlertView *alertView = [[MMAlertView alloc] initWithTitle:title ?: @"温馨提示" detail:message items:mmItems];
    alertView.attachedView = attachedView;
    [alertView show];
}

/**
 *  带高亮、禁用按钮的初始化方法
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
          buttonTitles:(NSArray<NSString *> *)buttonTitles
       hightLightTitle:(NSString *)hightLightTitle
         disabledTitle:(NSString *)disabledTitle
          attachedView:(UIView *)attachedView
               handler:(MMPopupItemHandler)handler
{
    NSAssert(message && message.length,
             @"AlertManager Error Message: message参数不可为空!");
    
    NSAssert(attachedView,
             @"AlertManager Error Message: attachedView参数不可为空!");
    
    if (!buttonTitles) {
        buttonTitles = @[ @"取消", @"确定" ];
    }
    
    NSMutableArray *items = [NSMutableArray array];
    
    for (NSString *objStr in buttonTitles) {
        if (hightLightTitle && hightLightTitle.length && [objStr isEqualToString:hightLightTitle]) {
            // 需要高亮的按钮
            MMPopupItem *item = MMItemMake(objStr, MMItemTypeHighlight, handler);
            [items addObject:item];
        }
        else if (disabledTitle && disabledTitle.length && [objStr isEqualToString:disabledTitle]) {
            // 需要禁用的按钮
            MMPopupItem *item = MMItemMake(objStr, MMItemTypeDisabled, handler);
            [items addObject:item];
        }
        else {
            // 普通按钮
            MMPopupItem *item = MMItemMake(objStr, MMItemTypeNormal, handler);
            [items addObject:item];
        }
    }
    
    [[self class] alertWithTitle:title message:message mmItems:items attachedView:attachedView];
}

/**
 *  带高亮按钮的弹窗
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
          buttonTitles:(NSArray<NSString *> *)buttonTitles
       hightLightTitle:(NSString *)hightLightTitle
          attachedView:(UIView *)attachedView
               handler:(MMPopupItemHandler)handler
{
    [[self class] alertWithTitle:title message:message buttonTitles:buttonTitles hightLightTitle:hightLightTitle disabledTitle:nil attachedView:attachedView handler:handler];
}

/**
 *  普通风格(不高亮按钮)的弹窗
 */
+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
          buttonTitles:(NSArray<NSString *> *)buttonTitles
          attachedView:(UIView *)attachedView
               handler:(MMPopupItemHandler)handler
{
    [[self class] alertWithTitle:title message:message buttonTitles:buttonTitles hightLightTitle:nil attachedView:attachedView handler:handler];
}

/**
 *  便捷警告弹窗
 */
+ (void)alertWithConfirmTitle:(NSString *)title
                      message:(NSString *)message
              completionBlock:(MMPopupCompletionBlock)completeBlock
{
    NSAssert(message && message.length,
             @"AlertManager Error Message: message参数不可为空!");
    
    [[[MMAlertView alloc] initWithConfirmTitle:title ?: @"温馨提示" detail:message] showWithBlock:completeBlock];
}

/**
 *  根据警告性类型提示用户网络连接状况
 */
+ (void)alertWithWarnType:(AlertWarnType)warnType
{
    switch (warnType) {
        case AlertWarnTypeNoNetWork:
            [[self class] alertWithConfirmTitle:nil message:@"请检查您的网络连接哦!" completionBlock:nil];
            break;
        case AlertWarnTypeNetWorkException:
            [[self class] alertWithConfirmTitle:nil message:@"网络连接异常，请稍后重试哦!" completionBlock:nil];
            break;
        case AlertWarnTypeServerException:
            [[self class] alertWithConfirmTitle:nil message:@"服务器异常，请稍后重试哦!" completionBlock:nil];
            break;
        default:
            break;
    }
}



@end
