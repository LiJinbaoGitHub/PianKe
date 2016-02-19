//
//  PKMusicView.m
//  ppkk
//
//  Created by ma c on 16/1/22.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKMusicView.h"
#import "Masonry.h"

@implementation PKMusicView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.backBtn];
        [self addSubview:self.musicImage];
        [self addSubview:self.musicName];
        [self addSubview:self.musicFrom];
        [self addSubview:self.startBtn];
    }
    return self;
}
//添加约束
- (void)layoutSubviews{
    WS(weakSelf);
    [_musicImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.right.mas_equalTo(weakSelf.mas_right).offset(-30);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).width.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [_musicName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@16);
        make.left.equalTo(weakSelf.musicImage.mas_right).offset(10);
        make.right.equalTo(weakSelf.startBtn.mas_left).offset(-20);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(-8);
    }];
    [_musicFrom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@16);
        make.left.equalTo(weakSelf.musicImage.mas_right).offset(10);
        make.right.equalTo(weakSelf.startBtn.mas_left).offset(-20);
        make.centerY.equalTo(weakSelf.mas_centerY).offset(8);
    }];
}


//***属性初始化
- (UIImageView *)musicImage{
    if(!_musicImage){
        _musicImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"音乐"]];
    }
    return _musicImage;
}
- (UILabel *)musicName{
    if(!_musicName){
        _musicName = [[UILabel alloc]init];
        _musicName.textColor = [UIColor whiteColor];
        _musicName.textAlignment = NSTextAlignmentCenter;
        _musicName.text = @"屯里的人";
        _musicName.font = [UIFont systemFontOfSize:15.0];
    }
    return _musicName;
}
- (UILabel *)musicFrom{
    if(!_musicFrom){
        _musicFrom = [[UILabel alloc]init];
        _musicFrom.textColor = [UIColor whiteColor];
        _musicFrom.textAlignment = NSTextAlignmentCenter;
        _musicFrom.text = @"刘德华专辑";
        _musicFrom.font = [UIFont systemFontOfSize:10.0];
    }
    return _musicFrom;
}
- (UIButton *)startBtn{
    if(!_startBtn){
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _startBtn.selected = NO;
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"播放"] forState:UIControlStateNormal];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:UIControlStateSelected];
    }
    return _startBtn;
}
- (UIButton *)backBtn{
    if(!_backBtn){
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.backgroundColor = RGB(100, 100, 100);
    }
    return _backBtn;
}
@end








