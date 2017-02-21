//
//  SecurityCenterTabCell.h
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecurityCenterTabCell : UITableViewCell
/**
 *  标题
 */
@property (nonatomic,strong) UILabel *titleLab;
/**
 *  说明
 */
@property (nonatomic,strong) UILabel *explainLab;
/**
 *  箭头
 */
@property (nonatomic,strong) UIImageView *arrowsImageView;

@end
