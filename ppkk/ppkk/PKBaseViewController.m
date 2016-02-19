//
//  PKBaseViewController.m
//  ppkk
//
//  Created by ma c on 16/1/22.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKBaseViewController.h"

@interface PKBaseViewController ()

@end

@implementation PKBaseViewController

- (void)viewWillAppear:(BOOL)animated{
    //状态栏
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    UIView * statuesBarBack = [[UIView alloc]initWithFrame:CGRectMake(0, -20, VIEW_WIDTH, 40)];
    statuesBarBack.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statuesBarBack];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)GETHttpRequest:(NSString *)url dic:(NSDictionary *)dic successBlock:(HttpSuccessBlock)RequestSuccess errorBlock:(HttpErrorBlock)RequestError{
    WS(WeakSelf);
    //显示等待动画
    [JPRefreshView showJPRefreshFromView:self.view];
    
    [ZJPBaseHttpTool getWithPath:url params:dic success:^(id JSON) {
        if(RequestSuccess){
            RequestSuccess(JSON);
        }
        //移除等待动画
        [JPRefreshView removeJPRefreshFromView:WeakSelf.view];
    } failure:^(NSError *error) {
        if(RequestError){
            RequestError(error);
        }
        [JPRefreshView removeJPRefreshFromView:WeakSelf.view];
    }];
}
- (void)POSTHttpRequest:(NSString *)url dic:(NSDictionary *)dic successBlock:(HttpSuccessBlock)RequestSuccess errorBlock:(HttpErrorBlock)RequestError{
    WS(weakSelf);
    //显示等待动画
    [JPRefreshView showJPRefreshFromView:self.view];
    
    [ZJPBaseHttpTool postWithPath:url params:dic success:^(id JSON) {
        if(RequestSuccess){
            RequestSuccess(JSON);
        }
        // 移除等待动画
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    } failure:^(NSError *error) {
        if(RequestError){
            RequestError(error);
        }
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    }];
    
}

- (void)addBackItemBtn{
    //自定义导航栏按钮
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc]initWithNormalIcon:@"" highlightedIcon:@"" target:self action:@selector(backView)];
    self.navigationItem.leftBarButtonItem = backItem;
}
- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
//
- (void)addNavLeftBackBtnMeun{
    UIImage* backImage = [UIImage imageNamed:@"菜单"];
    CGRect backframe = CGRectMake(0,0,54,55);
    UIButton* backButton= [[UIButton alloc] initWithFrame:backframe];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(doClickBackAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)doClickBackAction{
    
    [self.sideMenuViewController presentLeftMenuViewController];
    
}


@end
