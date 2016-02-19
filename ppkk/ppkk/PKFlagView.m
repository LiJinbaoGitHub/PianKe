//
//  PKFlagView.m
//  ppkk
//
//  Created by ma c on 16/2/18.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKFlagView.h"
#import "PKFlageTableViewCell.h"     // 轮播视图
#import "PKFlageListTableViewCell.h" // 列表数据视图
#import "MJRefresh.h"
#import "PKFlagListModel.h"

@interface PKFlagView()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)          PKFlagListModel * flagListModel;
@end


@implementation PKFlagView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[PKFlageTableViewCell class] forCellReuseIdentifier:@"cell"];
        [self registerClass:[PKFlageListTableViewCell class] forCellReuseIdentifier:@"cellTwo"];
        
        [self reloadFragmentTabelData:0];
        
        WS(weakSelf);
        //上拉加载的block回调方法
        self.MoreDataBlock = ^(){
            // 隐藏当前的上拉刷新控件
            [weakSelf reloadFragmentTabelData:0];
        };
        //下拉加载的block回调方法
        self.NewDataBlock = ^(){
            [weakSelf reloadFragmentTabelData:10];
        };

    }
    return self;
    
}
//网络请求数据
- (void)reloadFragmentTabelData:(NSInteger)start{
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }
    return 12;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 180;
    }
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* identifier = @"cell";
    if (indexPath.section == 0) {
        identifier = @"cell";
    }
    
    if (indexPath.section == 1) {
        identifier = @"cellTwo";
    }

    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];

    
    
    return cell;
}
@end












