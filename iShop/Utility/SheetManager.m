//
//  SheetManager.m
//  iShop
//
//  Created by 周磊 on 2017/2/19.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "SheetManager.h"

@implementation SheetManager


+ (void)sheetWithTitle:(NSString *)title
          buttonTitles:(NSArray<NSString *> *)buttonTitles
         buttonHandler:(MMPopupItemHandler)handler
       completeHandler:(MMPopupCompletionBlock)completeHandler
{
    [[self class] sheetWithTitle:title buttonTitles:buttonTitles hightLightTitle:nil disabledTitle:nil buttonHandler:handler completeHandler:completeHandler];
}

+ (void)sheetWithTitle:(NSString *)title
          buttonTitles:(NSArray<NSString *> *)buttonTitles
       hightLightTitle:(NSString *)hightLightTitle
         buttonHandler:(MMPopupItemHandler)handler
       completeHandler:(MMPopupCompletionBlock)completeHandler
{
    [[self class] sheetWithTitle:title buttonTitles:buttonTitles hightLightTitle:hightLightTitle disabledTitle:nil buttonHandler:handler completeHandler:completeHandler];
}

+ (void)sheetWithTitle:(NSString *)title
          buttonTitles:(NSArray<NSString *> *)buttonTitles
       hightLightTitle:(NSString *)hightLightTitle
         disabledTitle:(NSString *)disabledTitle
         buttonHandler:(MMPopupItemHandler)handler
       completeHandler:(MMPopupCompletionBlock)completeHandler
{
    NSAssert(buttonTitles && buttonTitles.count,
             @"SheetManager Error Message: buttonTitles参数不可为空!");
    
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
    
    [[[MMSheetView alloc] initWithTitle:title items:items] showWithBlock:completeHandler];
}



@end
