//
//  PKLoginView.m
//  ppkk
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKLoginView.h"
#import "Masonry.h"

@interface PKLoginView ()<UITextFieldDelegate>

@property (strong, nonatomic) UILabel * lineLabel1;
@property (strong, nonatomic) UILabel * lineLabel2;
@property (strong, nonatomic) UILabel * lineLabel3;
@property (strong, nonatomic) UILabel * delegateLabel;
@property (strong, nonatomic) UILabel * nickNameLable;
@property (strong, nonatomic) UILabel * emailNameLable;
@property (strong, nonatomic) UILabel * passwordLable;

@end

@implementation PKLoginView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        //self.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.nickNameField];
        [self addSubview:self.emailField];
        [self addSubview:self.passwordField];
        [self addSubview:self.delegateBtn];
        [self addSubview:self.manBtn];
        [self addSubview:self.womanBtn];
        [self addSubview:self.finishBtn];
        
        [self addSubview:self.lineLabel1];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.lineLabel3];
        [self addSubview:self.delegateLabel];
        [self addSubview:self.nickNameLable];
        [self addSubview:self.emailNameLable];
        [self addSubview:self.passwordLable];
        //
        [self autoLayout];
    }
    return self;
}


//约束
- (void)autoLayout{
    WS(weakSelf);
    [_manBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.top.equalTo(weakSelf.mas_top);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-60);
    }];
    [_womanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.top.equalTo(weakSelf.mas_top);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(60);
    }];
    [_nickNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
        make.left.equalTo(weakSelf.mas_left).offset(50);
        make.top.equalTo(weakSelf.manBtn.mas_bottom).offset(80);
    }];
    [_lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.equalTo(weakSelf.mas_left).offset(50);
        make.right.equalTo(weakSelf.mas_right).offset(-50);
        make.top.equalTo(weakSelf.nickNameLable.mas_bottom).offset(10);
    }];
    [_emailNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
        make.left.equalTo(weakSelf.mas_left).offset(50);
        make.top.equalTo(weakSelf.lineLabel1.mas_bottom).offset(30);
    }];
    [_lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.equalTo(weakSelf.mas_left).offset(50);
        make.right.equalTo(weakSelf.mas_right).offset(-50);
        make.top.equalTo(weakSelf.emailNameLable.mas_bottom).offset(10);
    }];
    [_passwordLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
        make.left.equalTo(weakSelf.mas_left).offset(50);
        make.top.equalTo(weakSelf.lineLabel2.mas_bottom).offset(30);
    }];
    [_lineLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@0.5);
        make.left.equalTo(weakSelf.mas_left).offset(50);
        make.right.equalTo(weakSelf.mas_right).offset(-50);
        make.top.equalTo(weakSelf.passwordLable.mas_bottom).offset(10);
    }];
    [_nickNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 30));
        make.left.equalTo(weakSelf.nickNameLable.mas_right);
        make.bottom.equalTo(weakSelf.lineLabel1.mas_top).offset(-5);
    }];
    [_emailField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 30));
        make.left.equalTo(weakSelf.emailNameLable.mas_right);
        make.bottom.equalTo(weakSelf.lineLabel2).offset(-5);
    }];
    [_passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 30));
        make.left.equalTo(weakSelf.passwordLable.mas_right);
        make.bottom.equalTo(weakSelf.lineLabel3).offset(-5);
    }];
    [_finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(280, 60));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.lineLabel3).offset(38);
    }];
    [_delegateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@22);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-30);
        make.top.equalTo(weakSelf.finishBtn.mas_bottom).offset(60);
    }];
    [_delegateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 22));
        make.left.equalTo(weakSelf.delegateLabel.mas_right);
        make.centerY.equalTo(weakSelf.delegateLabel.mas_centerY);
    }];

}


//属性
- (UIButton *)manBtn{
    if(!_manBtn){
        _manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"男"] forState:UIControlStateNormal];
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"男_sel"] forState:
         UIControlStateSelected];
        _manBtn.selected = NO;
        [_manBtn addTarget:self action:@selector(changeSexBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        _manBtn.tag = 100;
    }
    return _manBtn;
}
- (UIButton *)womanBtn{
    if(!_womanBtn){
        _womanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"女"] forState:UIControlStateNormal];
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"女_sel"] forState:
         UIControlStateSelected];
        _womanBtn.selected = NO;
        [_womanBtn addTarget:self action:@selector(changeSexBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        _womanBtn.tag = 101;

    }
    return _womanBtn;
}
- (UIButton *)finishBtn{
    if(!_finishBtn){
        _finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_finishBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _finishBtn.backgroundColor =  RGB(119, 182, 69);
        _finishBtn.titleLabel.font = [UIFont systemFontOfSize:20.0];
    }
    return _finishBtn;
}
- (UIButton *)delegateBtn{
    if(!_delegateBtn){
        _delegateBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_delegateBtn setTitle:@"片刻协议" forState:(UIControlStateNormal)];
        _delegateBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_delegateBtn setTitleColor:RGB(119, 182, 69) forState:(UIControlStateNormal)];
    }
    return _delegateBtn;
}
- (UITextField *)nickNameField{
    if(!_nickNameField){
        _nickNameField = [[UITextField alloc]init];
        _nickNameField.borderStyle = UITextBorderStyleNone;
        _nickNameField.placeholder = @"请输入昵称";
    }
    return _nickNameField;
}
- (UITextField *)emailField{
    if(!_emailField){
        _emailField = [[UITextField alloc]init];
        _emailField.borderStyle = UITextBorderStyleNone;
        _emailField.placeholder = @"请输入邮箱";
    }
    return _emailField;
}
- (UITextField *)passwordField{
    if(!_passwordField){
        _passwordField = [[UITextField alloc]init];
        _passwordField.borderStyle = UITextBorderStyleNone;
        _passwordField.placeholder = @"请输入密码";
        _passwordField.secureTextEntry = YES;

    }
    return _passwordField;
}
//***
- (UILabel *)lineLabel1{
    if(!_lineLabel1){
        _lineLabel1 = [[UILabel alloc]init];
        [_lineLabel1 setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _lineLabel1;
}
- (UILabel *)lineLabel2{
    if(!_lineLabel2){
        _lineLabel2 = [[UILabel alloc]init];
        [_lineLabel2 setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _lineLabel2;
}
- (UILabel *)lineLabel3{
    if(!_lineLabel3){
        _lineLabel3 = [[UILabel alloc]init];
        [_lineLabel3 setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _lineLabel3;
}
- (UILabel *)delegateLabel{
    if(!_delegateLabel){
        _delegateLabel = [[UILabel alloc]init];
        _delegateLabel.text = @"点击“完成”按钮，代表您已阅读同意";
        _delegateLabel.textAlignment = NSTextAlignmentLeft;
        _delegateLabel.textColor = [UIColor blackColor];
        _delegateLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _delegateLabel;
}
- (UILabel *)nickNameLable{
    if(!_nickNameLable){
        _nickNameLable = [[UILabel alloc]init];
        _nickNameLable.text = @"昵称:";
        _nickNameLable.textColor = [UIColor blackColor];
        _nickNameLable.font = [UIFont systemFontOfSize:16.0];
    }
    return _nickNameLable;
}
- (UILabel *)emailNameLable{
    if(!_emailNameLable){
        _emailNameLable = [[UILabel alloc]init];
        _emailNameLable.text = @"邮箱:";
        _emailNameLable.textColor = [UIColor blackColor];
        _emailNameLable.font = [UIFont systemFontOfSize:16.0];
    }
    return _emailNameLable;
}
- (UILabel *)passwordLable{
    if(!_passwordLable){
        _passwordLable = [[UILabel alloc]init];
        _passwordLable.text = @"密码:";
        _passwordLable.textColor = [UIColor blackColor];
        _passwordLable.font = [UIFont systemFontOfSize:16.0];

    }
    return _passwordLable;
}
///
- (void)changeSexBtnMethod:(UIButton *)sender{
    if(self.manBtn.selected == NO && self.womanBtn.selected == NO){
        sender.selected = YES;
    }else if(sender.tag == 100){
        sender.selected = YES;
        self.womanBtn.selected = NO;
        
    }else if(sender.tag == 101){
        sender.selected = YES;
        self.manBtn.selected = NO;
    }
}
@end








