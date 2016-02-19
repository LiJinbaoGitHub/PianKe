//
//  PKLoginViewController.m
//  ppkk
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKLoginViewController.h"
#import "PKLoginView.h"
#import "Masonry.h"
#import "NSString+Helper.h"

@interface PKLoginViewController ()<UITextFieldDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>

@property (strong, nonatomic) PKLoginView * loginView;
@property (strong, nonatomic) UIButton * returnBtn;
@property (strong, nonatomic) UIButton * iconImageBtn;
@property (copy, nonatomic)   NSString * imageFiled;

@end

@implementation PKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.loginView];
    [self.view addSubview:self.returnBtn];
    [self.view addSubview:self.iconImageBtn];
    [self autoLayout];
}
//布局
- (void)autoLayout{
    WS(weakSelf);
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(420);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-40);
    }];
    [_returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 20));
        make.left.equalTo(weakSelf.view.mas_left).offset(20);
        make.top.equalTo(weakSelf.view.mas_top).offset(40);
    }];
    [_iconImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 90));
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.centerY.equalTo(weakSelf.view.mas_centerY).offset(-200);
    }];
}
//属性
- (PKLoginView *)loginView{
    if(!_loginView){
        _loginView = [[PKLoginView alloc]init];
        _loginView.nickNameField.delegate = self;
        _loginView.emailField.delegate = self;
        _loginView.passwordField.delegate = self;
        [_loginView.finishBtn addTarget:self action:@selector(loginHttpRequest) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginView;
}
- (UIButton *)returnBtn{
    if(!_returnBtn){
        _returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_returnBtn addTarget:self action:@selector(popToUpView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _returnBtn;
}
- (UIButton *)iconImageBtn{
    if(!_iconImageBtn){
        _iconImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_iconImageBtn setImage:[UIImage imageNamed:@"上传头像"] forState:UIControlStateNormal];
        [_iconImageBtn addTarget:self action:@selector(imageBtnMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconImageBtn;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//点击返回、上传头像键 触发
- (void)popToUpView{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 调用相机相册 UIImagePickerControllerDelegate
//判断是从 相机还是从相册 获取 图片
- (void)imageBtnMethod{
    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册中获取", nil];
    sheet.destructiveButtonIndex = -1;  //设置那一个显示红色文字提示
    [sheet showInView:self.view];
}
//actionSheet代理方法 每一个点击buttonIndex 事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        //相机拍照
        UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }else if (buttonIndex == 1){
        //相册选择
        UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }
}
//UIImagePickerController代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取图片
    UIImage * editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    //获取沙盒目录
    NSString * homePath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    
    //将图片名字拼到路径后面
    NSString * imageViews =[homePath stringByAppendingFormat:@"/%d.png",arc4random_uniform(1000000)];
    
    //将图片写入沙盒
    [UIImageJPEGRepresentation(editedImage, 1.0f) writeToFile:imageViews atomically:YES];
    
    //将图片路径保存下来 上传时会用到
    self.imageFiled = imageViews;
    
    //更新imageBTN的图片
    [_iconImageBtn setImage:editedImage forState:UIControlStateNormal];
    
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
}


//点击注册页面 完成 按钮-进行网络请求
- (void)loginHttpRequest{
    [self disMissKeyboard];
    if([_loginView.nickNameField.text isEmptyString]){
        [self.view makeToast:@"用户名不能为空" duration:0.5 position:@"center"];     
    }
    //判断密码是否为空，isEmptyString方法是NSString + helper中的
    else if ([_loginView.passwordField.text isEmptyString]){
        [self.view makeToast:@"密码不能为空" duration:1 position:@"center"];
    }
    //判断邮箱是否为空，isEmptyString方法是NSString + helper中的
    else if ([_loginView.emailField.text isEmptyString]){
        [self.view makeToast:@"邮箱不能为空" duration:1 position:@"center"];
    }
    else if ([_iconImageBtn.currentImage isEqual:[UIImage imageNamed:@"上传头像"]]){
        [self.view makeToast:@"头像不能为空" duration:1 position:@"center"];
    }
    else{
        //开始进行网络请求 上传头像到服务器
        WS(weakSelf);
        [ZJPBaseHttpTool postImagePath:@"http://api2.pianke.me/user/reg" params:[self makeloginRequestDic] image:_imageFiled success:^(id JSON) {
            NSDictionary * returnDic = JSON;
            //判断是否成功，如果result为 1 ，注册成功，result为0，查看返回字典中data字段中msg的错误原因
            if([returnDic[@"result"] integerValue] == 1){
            //判断是否成功，如果result为 1 ，注册成功，result为0，查看返回字典中data字段中msg的错误原因
                [weakSelf.view makeToast:@"注册成功" duration:1 position:@"center"];
            }else{
                [weakSelf.view makeToast:[returnDic[@"data"] valueForKey:@"msg"] duration:1.0 position:@"center"];
            }
            [JPRefreshView removeJPRefreshFromView:weakSelf.view];
        } failure:^(NSError *error) {
            NSLog(@"%@", error);
            [weakSelf.view makeToast:@"注册失败" duration:1.0 position:@"center"];
        }];
        
    }

}
//制作琴该参数
- (NSDictionary *)makeloginRequestDic{
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":_loginView.emailField.text,
                          @"gender":@"1",  //性别 男
                          @"passwd":_loginView.passwordField.text,
                          @"uname":_loginView.nickNameField.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          @"iconfile":_imageFiled};
    return dic;
}

#pragma mark - 键盘上移
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    WS(weakSelf);
    if(textField == _loginView.nickNameField){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 50;
            weakSelf.view.bounds = rect;
        }];
    }else if(textField == _loginView.emailField){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.view.bounds;
            rect.origin.y = 100;
            self.view.bounds = rect;
        }];
    }else if (textField == _loginView.passwordField){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = self.view.bounds;
            rect.origin.y = 150;
            self.view.bounds = rect;
        }];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self disMissKeyboard];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self disMissKeyboard];
}
//隐藏键盘的方法
- (void)disMissKeyboard{
    [_loginView.emailField resignFirstResponder];
    [_loginView.passwordField resignFirstResponder];
    [_loginView.nickNameField resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
}
@end








