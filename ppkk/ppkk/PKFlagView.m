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
#import "PKBaseViewController.h"
#import "NSArray+PKFlageCellHeight.h"
#import "MJDIYHeader.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"

@interface PKFlagView()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)          PKBaseViewController * baseViewCon;
@property (assign, nonatomic)          NSInteger pageNumber;
@end


@implementation PKFlagView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        //添加mj刷新
        [self addRefreshControl];
        
        
        //表格复用
        [self registerClass:[PKFlageTableViewCell class] forCellReuseIdentifier:@"cell"];
        [self registerClass:[PKFlageListTableViewCell class] forCellReuseIdentifier:@"cellTwo"];

    }
    return self;
    
}
#pragma mark - add Refresh Control method

- (void)addRefreshControl {
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    // 马上进入刷新状态
    self.mj_header = header;
    //设置上拉加载的动画
    MJChiBaoZiFooter2 *footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    footer.stateLabel.hidden = YES;
    self.mj_footer.automaticallyChangeAlpha = YES;
    self.mj_footer = footer;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }

    return self.flageModel.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 180;
    }
    CGFloat height = [[_cellHeightArray[indexPath.row] valueForKey:@"cellHeight"] floatValue];
    return height;
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

//    if (_cellHeightArray) {
//        if ([cell isKindOfClass:[PKFlageListTableViewCell class]]) {
//            //传给cell的高度字典
//            [((PKFlageListTableViewCell *)cell) setHeightDic:(NSDictionary *)_cellHeightArray[indexPath.row]];
//            //传给cell的内容模型
//            ((PKFlageListTableViewCell *)cell).counterList = _flageModel[indexPath.row];
//        }
//    }
    //传轮播图片给，PKFlageTableViewCell，中的array
    if (indexPath.section == 0) {
        NSMutableArray* array = [NSMutableArray array];
        for (NSDictionary* dic in self.scrollArray) {
            NSString* strImg = dic[@"img"];
            [array addObject:strImg];
        }
        [((PKFlageTableViewCell*)cell) setScroImageWithArray:array];
        
    }
    if (indexPath.section == 1) {
        [((PKFlageListTableViewCell *)cell) setHeightDic:(NSDictionary *)_cellHeightArray[indexPath.row]];
        //传给cell的内容模型
        ((PKFlageListTableViewCell *)cell).counterList = self.flageModel[indexPath.row];
    }
    return cell;
}

//下拉刷新全部数据
- (void)loadMoreData{
    if (_MoreDataBlock) {
        _MoreDataBlock();
    }
}
//上拉加载更多数据
- (void)loadNewData{
    if (_NewDataBlock) {
        _NewDataBlock();
    }
}

@end












