//
//  PKTableViewCell.m
//  ppkk
//
//  Created by ma c on 16/1/22.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKTableViewCell.h"
#import "Masonry.h"

@implementation PKTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor = RGB(51, 51, 51);
        [self addSubview:self.iconImage];
        [self addSubview:self.titleLable];
        [self addLayoutInCell];
    }
    return self;
}
//自动布局
- (void)addLayoutInCell{
    WS(weakSelf);
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(20);
    }];
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(30);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
}

//iconImage titleLabel 懒加载
- (UIImageView *)iconImage{
    if(!_iconImage){
        _iconImage = [[UIImageView alloc]init];
    }
    return _iconImage;
}
- (UILabel *)titleLable{
    if(!_titleLable){
        _titleLable = [[UILabel alloc]init];
        _titleLable.textColor = [UIColor whiteColor];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        _titleLable.font = [UIFont systemFontOfSize:14];
    }
    return _titleLable;
}





- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
