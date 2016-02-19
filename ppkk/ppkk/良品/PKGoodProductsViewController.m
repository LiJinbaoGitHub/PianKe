//
//  PKGoodProductsViewController.m
//  ppkk
//
//  Created by ma c on 16/1/24.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKGoodProductsViewController.h"
#import "PKGoodProductTableCell.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"
#import "PKGoodProductInfoViewController.h"


@interface PKGoodProductsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView * goodProductTable;
@property (strong, nonatomic) NSArray * goodProduct;

@end

@implementation PKGoodProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavLeftBackBtnMeun];
    
    self.goodProductTable = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.goodProductTable.delegate = self;
    self.goodProductTable.dataSource = self;
    self.goodProductTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.goodProductTable];
    
    [self addRefreshController];
    [self reloadGoodProductData:0];
}
#pragma mark - 表格数据代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _goodProduct.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellID = @"cellID";
    PKGoodProductTableCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[PKGoodProductTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary * dataDic = _goodProduct[indexPath.row];
    [cell.contentImage downloadImage:dataDic[@"coverimg"]];
    cell.contentLable.text = dataDic[@"title"];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PKGoodProductInfoViewController * info = [[PKGoodProductInfoViewController alloc]init];
    
}

#pragma mark -  刷新
- (void)addRefreshController{
    //上拉刷新
    MJChiBaoZiHeader * header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadNewData)];
    
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    //马上进入刷新状态
    self.goodProductTable.mj_header = header;
    
    //下拉刷新
    MJChiBaoZiFooter2 * footer =[MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(reloadMoreData)];
    footer.stateLabel.hidden = YES;
    
    self.goodProductTable.mj_footer.automaticallyChangeAlpha = YES;
    self.goodProductTable.mj_footer = footer;
}

#pragma mark - 网络请求数据
- (void)reloadGoodProductData:(NSInteger)start{
    //制作请求参数
    NSDictionary * requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                  @"client":@"1",
                                  @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                  @"limit":@"10",
                                  @"start":[NSString stringWithFormat:@"%li",start],
                                  @"version":@"3.0.6"
                                  
                                  };
    WS(weakSelf);
    [self POSTHttpRequest:@"http://api2.pianke.me/pub/shop" dic:requestDic successBlock:^(id JSON) {
        NSDictionary * returnDic = JSON;
        if([returnDic[@"result"] integerValue] == 1){
            weakSelf.goodProduct = [returnDic[@"data"] valueForKey:@"list"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.goodProductTable reloadData];
            });
        }
        
    } errorBlock:^(NSError *error) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

//获得更多数据
- (void)reloadMoreData{
    [self reloadGoodProductData:10];
}
//重新加载数据
- (void)reloadNewData{
    [self reloadGoodProductData:0];
}

@end
