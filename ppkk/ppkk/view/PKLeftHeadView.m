//
//  PKLeftHeadView.m
//  ppkk
//
//  Created by ma c on 16/1/22.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKLeftHeadView.h"
#import "Masonry.h"

@implementation PKLeftHeadView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.backGroundImage];//背景图
        [self addSubview:self.iconImageBtn];
        [self addSubview:self.userNameBtn];
        [self addSubview:self.downLoadBtn];
        [self addSubview:self.collectBtn];
        [self addSubview:self.messageBtn];
        [self addSubview:self.writeBtn];
        [self addSubview:self.searchBtn];
        [self addAutoLayout];
    }
    return self;
}

//自动布局
- (void)addAutoLayout{
    WS(weakSelf);
    [_iconImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.top.equalTo(weakSelf.mas_top).offset(40);
        make.left.equalTo(weakSelf.mas_left).offset(20);
    }];
    [_userNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@20);
        make.left.equalTo(_iconImageBtn.mas_right).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-60);
        make.centerY.equalTo(_iconImageBtn.mas_centerY);
    }];
    CGFloat width = (VIEW_WIDTH-125.0)/5.0;
    [_downLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.top.equalTo(_iconImageBtn.mas_bottom).offset(25);
    }];
    [_collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.equalTo(_downLoadBtn.mas_right).offset(width);
        make.centerY.equalTo(_downLoadBtn.mas_centerY);
    }];
    [_messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.equalTo(_collectBtn.mas_right).offset(width);
        make.centerY.equalTo(_downLoadBtn.mas_centerY);
    }];
    [_writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.equalTo(_messageBtn.mas_right).offset(width);
        make.centerY.equalTo(_downLoadBtn.mas_centerY);
    }];
    
    [_searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.downLoadBtn.mas_bottom).offset(15);
        make.left.equalTo(weakSelf.mas_left).offset(25);
        make.right.equalTo(weakSelf.mas_right).offset(-25);
        make.height.equalTo(@30);
    }];
    
    [_backGroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).width.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

//控件懒加载
//背景图片
- (UIImageView *)backGroundImage{
    if(!_backGroundImage){
        _backGroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"侧边头部背景"]];
    }
    return _backGroundImage;
}
//iconImageBtn
- (UIButton *)iconImageBtn{
    if(!_iconImageBtn){
        _iconImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_iconImageBtn setImage:[UIImage imageNamed:@"头像"] forState:UIControlStateNormal];
        _iconImageBtn.layer.cornerRadius = 25.0; //切割角度
        _iconImageBtn.layer.masksToBounds = YES;
    }
    return _iconImageBtn;
}
//userNameBtn
- (UIButton *)userNameBtn{
    if(!_userNameBtn){
        _userNameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_userNameBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_userNameBtn setTitle:@"登陆|注册" forState:UIControlStateNormal];
        _userNameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//内容水平对齐方式 左
    }
    return _userNameBtn;
}
//downLoadBtn
- (UIButton *)downLoadBtn{
    if(!_downLoadBtn){
        _downLoadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downLoadBtn setImage:[UIImage imageNamed:@"下载"] forState:UIControlStateNormal];
    }
    return _downLoadBtn;
}
//collectionBtn
- (UIButton *)collectBtn{
    if(!_collectBtn){
        _collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectBtn setImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
    }
    return _collectBtn;
}
//messageBtn
- (UIButton *)messageBtn{
    if(!_messageBtn){
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageBtn setImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
    }
    return _messageBtn;
}
//writeBtn
- (UIButton *)writeBtn{
    if(!_writeBtn){
        _writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_writeBtn setImage:[UIImage imageNamed:@"写评论"] forState:UIControlStateNormal];
    }
    return _writeBtn;
}
//searchBtn
- (UIButton *)searchBtn{
    if(!_searchBtn){
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateNormal];
    }
    return _searchBtn;
}
@end






