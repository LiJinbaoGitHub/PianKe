//
//  PKLandingViewController.m
//  ppkk
//
//  Created by ma c on 16/1/25.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKLandingViewController.h"
#import "PKThirdLandingView.h"
#import "PKEmailLandingView.h"
#import "PKLoginViewController.h"

@interface PKLandingViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) PKThirdLandingView * thirdView;
@property (strong, nonatomic) PKEmailLandingView * emailView;
@property (strong, nonatomic) UIImageView * iconImage; //brand
@property (strong, nonatomic) UIButton * returnBtn; //返回
@property (strong, nonatomic) UIButton * loginBtn; //注册

@end

@implementation PKLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.thirdView];
    [self.view addSubview:self.emailView];
    
    [self.view addSubview:self.iconImage];
    [self.view addSubview:self.returnBtn];
    [self.view addSubview:self.loginBtn];
    
    //调用
    [self addAutoLayout];
}
//自动 布局
- (void)addAutoLayout{
    WS(weakSelf);
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.right.equalTo(weakSelf.view.mas_right);
        make.left.equalTo(weakSelf.view.mas_left);
        make.height.equalTo(@135);
    }];
    [_emailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.thirdView.mas_top).offset(-50);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(@170);
    }];
    //注册
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 20));
        make.top.equalTo(weakSelf.view.mas_top).offset(40);
        make.right.equalTo(weakSelf.view.mas_right).offset(-20);
    }];
    //返回
    [_returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 20));
        make.left.equalTo(weakSelf.view.mas_left).offset(20);
        make.top.equalTo(weakSelf.view.mas_top).offset(40);
    }];
    //image
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.centerY.equalTo(weakSelf.view.mas_centerY).offset(-150);
    }];
}

//属性
//第三方登录 下部
- (PKThirdLandingView *)thirdView{
    if(!_thirdView){
        _thirdView = [[PKThirdLandingView alloc]init];
    }
    return _thirdView;
}
//登录信息 中间部分
- (PKEmailLandingView *)emailView{
    if(!_emailView){
        _emailView  = [[PKEmailLandingView alloc]init];
        _emailView.emailField.delegate = self;
        _emailView.paseWordField.delegate = self;
//        [_emailView.emailField becomeFirstResponder];
//        [_emailView.paseWordField becomeFirstResponder];

    }
    return _emailView;
}
// logo 上部
- (UIImageView *)iconImage{
    if(!_iconImage){
        _iconImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"片刻LOGO"]];
    }
    return _iconImage;
}
- (UIButton *)returnBtn{
    if(!_returnBtn){
        _returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_returnBtn addTarget:self action:@selector(returnViewMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnBtn;
}
- (UIButton *)loginBtn{
    if(!_loginBtn){
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(pushViewLoginController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(textField == _emailView.emailField){
        WS(weakSelf);
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect =weakSelf.view.bounds;
            rect.origin.y = 30;
            weakSelf.view.bounds = rect;
        }];
    }
    else if (textField == _emailView.paseWordField){
        WS(weakSelf);
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect =weakSelf.view.bounds;
            rect.origin.y = 100;
            weakSelf.view.bounds = rect;
        }];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_emailView.emailField resignFirstResponder]; //取消第一响应者
    [_emailView.paseWordField resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_emailView.emailField resignFirstResponder]; //取消第一响应者
    [_emailView.paseWordField resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    
}
#pragma mark - 点击触发事件
//返回到左菜单栏 （响应事件）
- (void)returnViewMethod{
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 跳转到注册界面（响应事件）
- (void)pushViewLoginController{
    PKLoginViewController * loginView = [[PKLoginViewController alloc]init];
    [self presentViewController:loginView animated:YES completion:nil];
}
@end











