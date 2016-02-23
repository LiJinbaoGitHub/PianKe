//
//  PKFragmentViewController.m
//  ppkk
//
//  Created by ma c on 16/1/24.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKFragmentViewController.h"
#import "PKFragmentModel.h"
#import "PKFragmentTable.h"
#import "NSArray+PKFragmentCellHeight.h"
#import "MJRefresh.h"

@interface PKFragmentViewController ()

@property (strong, nonatomic) PKFragmentModel * fragmentModel;
@property (strong, nonatomic) PKFragmentTable * fragmentTable;
@property (assign, nonatomic) NSInteger start;
@property (strong, nonatomic) NSMutableArray * height;

@end

@implementation PKFragmentViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self.view addSubview:self.fragmentTable];
    [self addAutoLayout];
    [self reloadFragmentTableDate:0];
    
    [self addNavLeftBackBtnMeun];
    //自定义VIEW
    UIView* topView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, VIEW_WIDTH, 44)];
    [topView setBackgroundColor:RGB(255 , 255, 255)];
    [self.view addSubview:topView];
    //菜单按钮
    UIImage* backImage = [UIImage imageNamed:@"菜单"];
    CGRect backframe = CGRectMake(0,0,45,45);
    UIButton* backButton= [[UIButton alloc] initWithFrame:backframe];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    
    [backButton addTarget:self action:@selector(doClickBackAction) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backButton];
    
    //可变数组初始化
    self.height = [NSMutableArray array];
}
//自动布局
- (void)addAutoLayout{
    WS(weakSelf);
    [_fragmentTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf.view).width.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
//属性 初始化
- (PKFragmentTable *)fragmentTable{
    if(!_fragmentTable){
        _fragmentTable = [[PKFragmentTable alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        WS(weakSelf);
        //上拉 加载block 回调方法
        self.start = 10;
        _fragmentTable.NewDateBlock = ^(){
            [weakSelf reloadFragmentTableDate:0];
        };
        //下拉 加载block 回调方法
        _fragmentTable.MoreDateBlock = ^(){
            [weakSelf reloadFragmentTableDate:weakSelf.start];
            weakSelf.start += 10;
        };
    }
    return _fragmentTable;
}

//加载 碎片表格数据
- (void)reloadFragmentTableDate:(NSInteger)start{
    //制作请求参数
    NSDictionary * requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                  @"client":@"1",
                                  @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                  @"limit":@"10",
                                  @"start":[NSString stringWithFormat:@"%li",start],
                                  @"version":@"3.0.6"
                                  };
    WS(weakSelf);
    //开始网络请求
    [self POSTHttpRequest:@"http://api2.pianke.me/timeline/list" dic:requestDic successBlock:^(id JSON) {
        NSDictionary * returnDic = JSON;
        if([returnDic[@"result"] integerValue] == 1){
            
            if (start == 0) {
                [weakSelf.fragmentTable.FragmentMedelArray removeAllObjects];
                [weakSelf.height removeAllObjects];
            };

            //将得到的模型转换成model
            weakSelf.fragmentModel = [[PKFragmentModel alloc] initWithDictionary:returnDic];
            NSArray * heightArray = [NSArray contentCellHeight:weakSelf.fragmentModel.data.list];
            
            [weakSelf.height addObjectsFromArray:heightArray];
            
            //用来存储数据的的数组
            for (id obj in weakSelf.fragmentModel.data.list) {
                [weakSelf.fragmentTable.FragmentMedelArray addObject:obj];
            }
            // 给 tableViewCell的高度数组 赋值
            weakSelf.fragmentTable.FragmentCellHeihtArray = weakSelf.height;;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.fragmentTable reloadData];
            });
        }
        //结束刷新请求
        [weakSelf.fragmentTable.mj_header endRefreshing];
        [weakSelf.fragmentTable.mj_footer endRefreshing];
        
        
    } errorBlock:^(NSError *error) {
        NSLog(@"----error:%@",error);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (void)doClickBackAction{
    
    [self.sideMenuViewController presentLeftMenuViewController];
    
}


@end
