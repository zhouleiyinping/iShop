//
//  SecurityCenterTabCell.m
//  iShop
//
//  Created by 周磊 on 2017/2/21.
//  Copyright © 2017年 zhuohan. All rights reserved.
//

#import "SecurityCenterTabCell.h"

@interface SecurityCenterTabCell()


@end

@implementation SecurityCenterTabCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initViewForCell];
    }
    
    return self;
}

-(void)initViewForCell {
    
    [self addSubview:self.titleLab];
    [self addSubview:self.explainLab];
    [self addSubview:self.arrowsImageView];

    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.centerY.equalTo(self.mas_centerY).offset(0);
    }];
    [self.explainLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-30);
        make.centerY.equalTo(self.mas_centerY).offset(0);
    }];
    
    [self.arrowsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-20);
        make.centerY.equalTo(self.mas_centerY).offset(0);
    }];
    
}

-(UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = [UIFont systemFontOfSize:16];
        _titleLab.textColor = [UIColor colorWithHex:@"333333"];
        _titleLab.text = @"身份绑定";
    }
    
    return _titleLab;
}
-(UILabel *)explainLab {
    if (!_explainLab) {
        _explainLab = [[UILabel alloc]init];
        _explainLab.font = [UIFont systemFontOfSize:14];
        _explainLab.textColor = [UIColor colorWithHex:@"666666"];
        _explainLab.text = @"已绑定";

    }
    return _explainLab;
}
-(UIImageView *)arrowsImageView {
    
    if (!_arrowsImageView) {
        _arrowsImageView = [[UIImageView alloc]init];
        _arrowsImageView.image = [UIImage imageNamed:@"arrow_right"];
    }
    return _arrowsImageView;
}
@end
