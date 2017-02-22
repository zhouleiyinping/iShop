//
//  AddBankCodeView.h
//  iShop
//
//  Created by 周磊 on 2017/2/22.
//  Copyright © 2017年 zhuohan. All rights reserved.
//  添加银行卡

#import <UIKit/UIKit.h>

@interface AddBankCodeView : UIView<UITextFieldDelegate>
@property (nonatomic,strong)UILabel *userNameLab;
@property (nonatomic,strong)UITextField *userNameTextField;
@property (nonatomic,strong)UILabel *bankCodeLab;
@property (nonatomic,strong)UITextField *bankCodeTextField;
@property (nonatomic,strong)UIButton *acquiescentBtn;
@property (nonatomic,strong)UIButton *submitBtn;
@property (nonatomic,strong)UILabel *reminder1;
@property (nonatomic,strong)UILabel *reminder2;
@property (nonatomic,strong)UILabel *reminder3;
@property (nonatomic,strong)UILabel *depositBankTitle;
@property (nonatomic,strong)UILabel *depositBankLab;
@property (nonatomic,strong)UIImageView *arrowImage;
@property (nonatomic,strong)UIView *bgView;
@end
