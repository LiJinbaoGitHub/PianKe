//
//  PKEmailLandingView.m
//  ppkk
//
//  Created by ma c on 16/1/25.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKEmailLandingView.h"
#import "Masonry.h"

@implementation PKEmailLandingView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.line1Label];
        [self addSubview:self.line2Label];
        
        [self addSubview:self.emailLabel];
        [self addSubview:self.paseWordLabel];
        
        [self addSubview:self.emailField];
        [self addSubview:self.paseWordField];
        
        [self addSubview:self.landingBtn];
    }
    return self;
}

- (void)layoutSubviews{
    WS(weakSelf);
    [_emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(45, 20));
        make.top.equalTo(weakSelf.mas_top).offset(20);
        make.left.equalTo(weakSelf.mas_left).offset(55);
    }];
    [_paseWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(45, 20));
        make.top.equalTo(weakSelf.emailLabel.mas_bottom).offset(60);
        make.centerX.equalTo(weakSelf.emailLabel.mas_centerX);
    }];
    [_line1Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.top.equalTo(weakSelf.emailLabel.mas_bottom).offset(8);
        make.left.equalTo(weakSelf.mas_left).offset(50);
        make.right.equalTo(weakSelf.mas_right).offset(-50);
    }];
    [_line2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.top.equalTo(weakSelf.paseWordLabel.mas_bottom).offset(8);
        make.left.equalTo(weakSelf.mas_left).offset(50);
        make.right.equalTo(weakSelf.mas_right).offset(-50);
    }];
    [_emailField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(270, 25));
        make.left.equalTo(weakSelf.emailLabel.mas_right);
        make.bottom.equalTo(weakSelf.line1Label.mas_top).offset(-5);
    }];
    [_paseWordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(270, 25));
        make.left.equalTo(weakSelf.paseWordLabel.mas_right);
        make.bottom.equalTo(weakSelf.line2Label.mas_top).offset(-5);
    }];
    [_landingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 40));
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.top.equalTo(weakSelf.line2Label.mas_bottom).offset(25);
    }];
}

//属性
- (UILabel *)line1Label{
    if(!_line1Label){
        _line1Label = [[UILabel alloc]init];
        [_line1Label setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _line1Label;
}
- (UILabel *)line2Label{
    if(!_line2Label){
        _line2Label = [[UILabel alloc]init];
        [_line2Label setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _line2Label;
}
- (UILabel *)emailLabel{
    if(!_emailLabel){
        _emailLabel = [[UILabel alloc]init];
        _emailLabel.text = @"邮箱:";
        _emailLabel.textColor = [UIColor blackColor];
        _emailLabel.textAlignment = NSTextAlignmentLeft;
        _emailLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _emailLabel;
}
- (UILabel *)paseWordLabel{
    if(!_paseWordLabel){
        _paseWordLabel = [[UILabel alloc]init];
        _paseWordLabel.text = @"密码:";
        _paseWordLabel.textColor = [UIColor blackColor];
        _paseWordLabel.textAlignment = NSTextAlignmentLeft;
        _paseWordLabel.font = [UIFont systemFontOfSize:15.0];

    }
    return _paseWordLabel;
}
- (UITextField *)emailField{
    if(!_emailField){
        _emailField = [[UITextField alloc]init];
        _emailField.borderStyle = UITextBorderStyleNone;
        _emailField.placeholder = @"请输入邮箱";
        _emailField.delegate = self;
    }
    return _emailField;
}
- (UITextField *)paseWordField{
    if(!_paseWordField){
        _paseWordField = [[UITextField alloc]init];
        _paseWordField.borderStyle = UITextBorderStyleNone;
        _paseWordField.placeholder = @"请输入密码";
        _paseWordField.delegate = self;
        _paseWordField.secureTextEntry = YES; //以密码形式可见
    }
    return _paseWordField;
}
- (UIButton *)landingBtn{
    if(!_landingBtn){
        _landingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_landingBtn setTitle:@"登陆" forState:UIControlStateNormal];
        _landingBtn.backgroundColor = RGB(119, 182, 69);
    }
    return _landingBtn;
}

@end






