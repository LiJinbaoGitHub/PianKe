//
//  PKHomeViewController.m
//  ppkk
//
//  Created by ma c on 16/1/22.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKHomeViewController.h"
#import "PKLeftMenuViewController.h"
#import "ZJPNavigationController.h"
#import "RESideMenu.h"
#import "PKFlagView.h"
#import "PKLightningView.h"
#import "PKDebrisView.h"

@interface PKHomeViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic) UIView* topView;
@property (strong,nonatomic) UIScrollView* scrollView;
@property (strong,nonatomic) UIButton* flagButton;
@property (strong,nonatomic) UIButton* lightningButton;
@property (strong,nonatomic) UIButton* debrisButton;
@property (strong,nonatomic) PKFlagView* flageTableView;
@end

@implementation PKHomeViewController{
    UIView * flagView;
    UIView * lightningView;
    UIView * debrisView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:YES];
   
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //自定义VIEW 替代self.navigation
    UIView* topView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, VIEW_WIDTH, 44)];
    [topView setBackgroundColor:RGB(255 , 255, 255)];
    [self.view addSubview:topView];
    
    //菜单按钮
    UIImage* backImage = [UIImage imageNamed:@"菜单"];
    CGRect backframe = CGRectMake(0,0,45,45);
    UIButton* backButton= [[UIButton alloc] initWithFrame:backframe];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(doClickBackAction) forControlEvents:UIControlEventTouchUpInside];
    
    //flag按钮(中间)
    CGRect flag= CGRectMake(250, 0, 40, 40);
    UIButton * flagButton = [[UIButton alloc]initWithFrame:flag];
    [flagButton setImage:[UIImage imageNamed:@"nav旗1"] forState:UIControlStateNormal];
    [flagButton setImage:[UIImage imageNamed:@"nav旗1_sel"] forState:UIControlStateSelected];
    flagButton.selected = YES;//默认选中按钮
    [flagButton addTarget:self action:@selector(addChildVC:) forControlEvents:UIControlEventTouchUpInside];
    
    //雷电按钮（前面）
    CGRect lightning= CGRectMake(200, 0, 40, 40);
    UIButton * lightningButton = [[UIButton alloc]initWithFrame:lightning];
    [lightningButton setImage:[UIImage imageNamed:@"nav雷电"] forState:UIControlStateNormal];
    [lightningButton setImage:[UIImage imageNamed:@"nav雷电_sel"] forState:UIControlStateSelected];
    [lightningButton addTarget:self action:@selector(addChildVC:) forControlEvents:UIControlEventTouchUpInside];
    
    //碎片按钮（后面）
    CGRect debris= CGRectMake(300, 0, 40, 40);
    UIButton * debrisButton = [[UIButton alloc]initWithFrame:debris];
    [debrisButton setImage:[UIImage imageNamed:@"nav碎片"] forState:UIControlStateNormal];
    [debrisButton setImage:[UIImage imageNamed:@"nav碎片_sel"] forState:UIControlStateSelected];
    [debrisButton addTarget:self action:@selector(addChildVC:) forControlEvents:UIControlEventTouchUpInside];
    
    [topView addSubview:backButton];
    [topView addSubview:flagButton];
    [topView addSubview:lightningButton];
    [topView addSubview:debrisButton];
    
    //界面 scorellView滚动视图
    UIScrollView * mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64)];
    mainScrollView.pagingEnabled = YES;
    [mainScrollView setBounces:NO];
    
    //创建视图
    lightningView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64)];
    flagView = [[UIView alloc]initWithFrame:CGRectMake(VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT-64)];
    debrisView = [[UIView alloc]initWithFrame:CGRectMake(VIEW_WIDTH*2, 0, VIEW_WIDTH, VIEW_HEIGHT-64)];
    
    mainScrollView.contentSize = CGSizeMake(VIEW_WIDTH*3, VIEW_HEIGHT-64);
    
    flagView.backgroundColor = [UIColor whiteColor];
    debrisView.backgroundColor =  [UIColor whiteColor];
    lightningView.backgroundColor = [UIColor whiteColor];
    
    
    [mainScrollView addSubview:flagView];
    [mainScrollView addSubview:lightningView];
    [mainScrollView addSubview:debrisView];
    mainScrollView.bounces = NO;
    mainScrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    mainScrollView.delegate = self;
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:mainScrollView];

    self.topView = topView;
    self.scrollView = mainScrollView;
    self.flagButton = flagButton;
    self.lightningButton = lightningButton;
    self.debrisButton = debrisButton;
    [self.view bringSubviewToFront:self.topView];
    [flagView addSubview:self.flageTableView];
    
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

}

- (void)doClickBackAction{
    
    [self.sideMenuViewController presentLeftMenuViewController];
    
}

/// nav button
- (void)addChildVC:(UIButton*)sender{
    
    sender.selected = YES;
    
    for (UIView* view in [self.topView subviews]) {
        if ([view isKindOfClass:[UIButton class]]&& (view != sender)) {
        
            UIButton* btn = (UIButton*)view;
            btn.selected = NO;
        
        }
    }
    
    if ([sender.currentImage isEqual:[UIImage imageNamed:@"nav旗1"]] ) {
        
        [self.scrollView setContentOffset:CGPointMake(VIEW_WIDTH, 0) animated:YES];
        
    }
    
    if ([sender.currentImage isEqual:[UIImage imageNamed:@"nav雷电"]] ) {
        
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        
    }
    
    if ([sender.currentImage isEqual:[UIImage imageNamed:@"nav碎片"]] ) {
        
        [self.scrollView setContentOffset:CGPointMake(VIEW_WIDTH*2, 0) animated:YES];
        
    }

    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (self.scrollView.contentOffset.x ==0) {
        
        [self addChildVC:self.lightningButton];
    }
    if (self.scrollView.contentOffset.x ==VIEW_WIDTH) {
        
        [self addChildVC:self.flagButton];
    }
    
    if (self.scrollView.contentOffset.x ==VIEW_WIDTH*2) {
        
        [self addChildVC:self.debrisButton];
    }

    
}
- (PKFlagView *)flageTableView{
    if (!_flageTableView) {
        _flageTableView = [[PKFlagView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-64) style:UITableViewStyleGrouped];
        self.flageTableView.bounces = NO;
    }
    return _flageTableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
