//
//  UpLoadPicModel.h
//  iShop
//
//  Created by 周磊 on 2017/2/17.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpLoadPicModel : NSObject

/**
 *  上传的图片的名字
 */
@property (nonatomic, copy) NSString *picName;

/**
 *  上传的图片
 */
@property (nonatomic, strong) UIImage *pic;


@end
