//
//  PKLeftMenuViewController.m
//  ppkk
//
//  Created by ma c on 16/1/22.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKLeftMenuViewController.h"
#import "PKLeftHeadView.h"
#import "PKTableView.h"
#import "PKMusicView.h"
#import "PKHomeViewController.h"
#import "ZJPNavigationController.h"
#import "PKRadioViewController.h"
#import "PKReadViewController.h"
#import "PKCommunityViewController.h"
#import "PKFragmentViewController.h"
#import "PKGoodProductsViewController.h"
#import "PKSettingViewController.h"
#import "PKLandingViewController.h"

@interface PKLeftMenuViewController ()<PKLefTableViewDidSelectRow>

@property (strong, nonatomic) PKLeftHeadView * headView;
@property (strong, nonatomic) PKTableView * tabelView;
@property (strong, nonatomic) PKMusicView * musicView;

@end

@implementation PKLeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //上中下 三块 view 的约束
    self.view.backgroundColor = RGB(51, 51, 51);
    WS(weakSelf);
    
    [self.view addSubview:self.headView];
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
        make.height.equalTo(@190);
    }];
    
    [self.view addSubview:self.tabelView];
    [_tabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.headView.mas_bottom);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-60);
    }];
    
    [self.view addSubview:self.musicView];
    [_musicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.height.equalTo(@60);
    }];
    
    
}
/**左侧上中下三块视图 懒加载  */
- (PKLeftHeadView *)headView{
    if(!_headView){
        _headView = [[PKLeftHeadView alloc]init];
        [_headView.iconImageBtn addTarget:self action:@selector(pushToLandView) forControlEvents:UIControlEventTouchUpInside];
        [_headView.userNameBtn addTarget:self action:@selector(pushToLandView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}
- (PKTableView *)tabelView{
    if(!_tabelView){
        _tabelView = [[PKTableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _tabelView.RowDelegate = self;
    }
    return _tabelView;
}
- (PKMusicView *)musicView{
    if(!_musicView){
        _musicView  = [[PKMusicView alloc]init];
    }
    return _musicView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -PKLefTableViewDidSelectRow
//执行航跳转代理方法
- (void)selectWitchRow:(NSInteger)row{
    switch (row) {
        case 0:
        {
            PKHomeViewController * homeView = [[PKHomeViewController alloc]init];

            ZJPNavigationController * homeNav = [[ZJPNavigationController alloc]initWithRootViewController:homeView];
            [self.sideMenuViewController setContentViewController:homeNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 1:
        {
            PKRadioViewController * radioView = [[PKRadioViewController alloc]init];
            radioView.title = @"电台";
            ZJPNavigationController * radioNav = [[ZJPNavigationController alloc]initWithRootViewController:radioView];
            [self.sideMenuViewController setContentViewController:radioNav
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
           case 2:
        {
            PKReadViewController * readView = [[PKReadViewController alloc]init];
            readView.title = @"阅读";
            ZJPNavigationController * readNav = [[ZJPNavigationController alloc]initWithRootViewController:readView];
            [self.sideMenuViewController setContentViewController:readNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            
        }
            break;
            case 3:
        {
            PKCommunityViewController * communityView = [[PKCommunityViewController alloc]init];
            communityView.title = @"社区";
            ZJPNavigationController * communityNav = [[ZJPNavigationController alloc]initWithRootViewController:communityView];
            [self.sideMenuViewController setContentViewController:communityNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            
        }
            break;
            case 4:
        {
            PKFragmentViewController * fragmentView = [[PKFragmentViewController alloc]init];
            fragmentView.title = @"碎片";
            ZJPNavigationController * fragmentNav = [[ZJPNavigationController alloc]initWithRootViewController:fragmentView];
            [self.sideMenuViewController setContentViewController:fragmentNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
            case 5:
        {
            PKGoodProductsViewController * goodProduct = [[PKGoodProductsViewController alloc]init];
            goodProduct.title = @"良品";
            ZJPNavigationController * goodNav = [[ZJPNavigationController alloc]initWithRootViewController:goodProduct];
            [self.sideMenuViewController setContentViewController:goodNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
            case 6:
        {
            PKSettingViewController * settingView = [[PKSettingViewController alloc]init];
            settingView.title = @"设置";
            ZJPNavigationController * setNav = [[ZJPNavigationController alloc]initWithRootViewController:settingView];
            [self.sideMenuViewController setContentViewController:setNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
            
        default:
            break;
    }
}
//跳转到登录界面
- (void)pushToLandView{
    PKLandingViewController * landView = [[PKLandingViewController alloc]init];
    [self presentViewController:landView animated:YES completion:nil];
}
@end
