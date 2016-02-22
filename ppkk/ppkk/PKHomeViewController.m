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
#import "RESideMenu.h"       // 侧边栏
#import "PKFlagView.h"      // 旗帜table
#import "PKLightningView.h" // 闪电
#import "PKDebrisView.h"    // 碎片
#import "MJRefresh.h"
#import "PKFlagListModel.h"
#import "NSArray+PKFlageCellHeight.h"


@interface PKHomeViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic)  UIView* topView;
@property (strong, nonatomic)  UIScrollView* scrollView;
@property (strong, nonatomic)  UIButton* flagButton;
@property (strong, nonatomic)  UIButton* lightningButton;
@property (strong, nonatomic)  UIButton* debrisButton;
@property (strong, nonatomic)  PKFlagView* flageTableView; // table
@property (assign,nonatomic)   NSInteger start;
@property (strong,nonatomic)   NSMutableArray* height;



@end

@implementation PKHomeViewController{
    UIView * flagView;
    UIView * lightningView;
    UIView * debrisView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flageTableView.flageModel = [NSMutableArray array];
    self.height = [NSMutableArray array];
    WS(weakSelf);
    
    self.start = 10;
    self.flageTableView.NewDataBlock = ^(){
        
        [weakSelf reloadFragmentTabelData:0];
    };
    self.flageTableView.MoreDataBlock = ^(){
      
        [weakSelf reloadFragmentTabelData:weakSelf.start];
        weakSelf.start+=10;
    };
    
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
    
    [self reloadFragmentTabelData:0];
    
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}
///网络请求数据
- (void)reloadFragmentTabelData:(NSInteger)start{
    
    WS(weakSelf);
    
        //制作请求参数
    NSDictionary *requestDic =@{
                                @"auth":@"",
                                @"client":@"1",
                                @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                @"limit":@"10",
                                @"start":[NSString stringWithFormat:@"%li",start],
                                @"version":@"3.0.6"
                                };
    //开始网络请求
    [self POSTHttpRequest:@"http://api2.pianke.me/pub/today" dic:requestDic successBlock:^(id JSON) {
        NSLog(@"%@",JSON);
        NSDictionary *returnDic = JSON;
        if ([returnDic[@"result"]integerValue] == 1) {
            
            if (start == 0) {
                
                [weakSelf.flageTableView.flageModel removeAllObjects];
                [weakSelf.height removeAllObjects];
                
            };

            //将得到的模型转换成model
            
            weakSelf.flageTableView.flagListModel = [[PKFlagListModel alloc]initWithDictionary:returnDic];
            
            
            
            NSArray *heightArray = [NSArray countCellHeight:weakSelf.flageTableView.flagListModel.data.list];
            [self.height addObjectsFromArray:heightArray];
            
            //tableview用来存储数据的数组
//            self.flageTableView.flageModel = self.flageTableView.flagListModel.data.list;
            
            [self.flageTableView.flageModel addObjectsFromArray:self.flageTableView.flagListModel.data.list];
            
            //轮播图片数据
            self.flageTableView.scrollArray = [returnDic[@"data"] valueForKey:@"carousel"];
            
            //给tableviewcell高度的数组赋值
            weakSelf.flageTableView.cellHeightArray = self.height;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.flageTableView reloadData];
            });
            
        }
        //结束刷新状态
        [weakSelf.flageTableView.mj_footer endRefreshing];
        [weakSelf.flageTableView.mj_header endRefreshing];
        
    } errorBlock:^(NSError *error) {
        
    }];
    
    
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
        _flageTableView = [[PKFlagView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT) style:UITableViewStyleGrouped];
       
    }
    return _flageTableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//网络请求部分

@end
