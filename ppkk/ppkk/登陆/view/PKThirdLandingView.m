//
//  PKThirdLandingView.m
//  ppkk
//
//  Created by ma c on 16/1/25.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKThirdLandingView.h"
#import "Masonry.h"

@implementation PKThirdLandingView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.xinlang];
        [self addSubview:self.douban];
        [self addSubview:self.qq];
        [self addSubview:self.renren];
        [self addSubview:self.xianLabel];
        [self addSubview:self.textLabel];
    }
    return self;
}
//
- (void)layoutSubviews{
    WS(weakSelf);
    CGFloat width = (VIEW_WIDTH - 205)/4;
    [_xinlang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-50);
    }];
    [_renren mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.left.equalTo(weakSelf.xinlang.mas_right).offset(width);
        make.centerY.equalTo(weakSelf.xinlang.mas_centerY);
    }];
    [_douban mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.left.equalTo(weakSelf.renren.mas_right).offset(width);
        make.centerY.equalTo(weakSelf.xinlang.mas_centerY);
    }];
    [_qq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.left.equalTo(weakSelf.douban.mas_right).offset(width);
        make.centerY.equalTo(weakSelf.xinlang.mas_centerY);
    }];
    [_xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1.0);
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.right.equalTo(weakSelf.mas_right).offset(-width);
        make.centerY.equalTo(weakSelf.textLabel.mas_centerY);
    }];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(130, 20));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.mas_top);
    }];
    
}
//
- (UIButton *)xinlang{
    if(!_xinlang){
        _xinlang = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xinlang setImage:[UIImage imageNamed:@"新浪"] forState:UIControlStateNormal];
    }
    return _xinlang;
}
- (UIButton *)douban{
    if(!_douban){
        _douban = [UIButton buttonWithType:UIButtonTypeCustom];
        [_douban setImage:[UIImage imageNamed:@"豆瓣"] forState:UIControlStateNormal];
    }
    return _douban;
}
- (UIButton *)qq{
    if(!_qq){
        _qq = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qq setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
    }
    return _qq;
}
- (UIButton *)renren{
    if(!_renren){
        _renren = [UIButton buttonWithType:UIButtonTypeCustom];
        [_renren setImage:[UIImage imageNamed:@"人人"] forState:UIControlStateNormal];
    }
    return _renren;
}
- (UILabel *)textLabel{
    if(!_textLabel){
        _textLabel = [[UILabel alloc]init];
        _textLabel.text = @"合作伙伴登陆片刻";
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.backgroundColor = [UIColor whiteColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _textLabel;
}
- (UILabel *)xianLabel{
    if(!_xianLabel){
        _xianLabel = [[UILabel alloc]init];
        _xianLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _xianLabel;
}

@end






