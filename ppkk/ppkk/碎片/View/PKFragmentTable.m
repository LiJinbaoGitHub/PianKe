//
//  PKFragmentTable.m
//  ppkk
//
//  Created by ma c on 16/1/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKFragmentTable.h"
#import "PKFragmentTableViewCell.h"
#import "MJRefresh.h"
#import "MJDIYHeader.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter2.h"


@interface PKFragmentTable ()<UITableViewDataSource, UITableViewDelegate>

@end
@implementation PKFragmentTable

- (NSMutableArray *)FragmentMedelArray {

    if (_FragmentMedelArray == nil) {
        _FragmentMedelArray = [NSMutableArray array];
    }
    return _FragmentMedelArray;

}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        self.delegate = self;
        self.dataSource = self;
        //
        [self addRefreshController];
        self.separatorStyle = UITableViewCellAccessoryNone;
        
    }
    return self;
}
#pragma mark - add refrash controller method
- (void)addRefreshController{
    // 上拉 设置回调 一旦进入刷新状态 就调用target 的 action (loadNewDate)
    MJChiBaoZiHeader * header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];
    
    //隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    //隐藏状态
    header.stateLabel.hidden = YES;
    
    //马上进入刷新状态
    self.mj_header = header;
    
    //下拉刷新
    MJChiBaoZiFooter2 * footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDate)];
    footer.stateLabel.hidden = YES;
    footer.automaticallyChangeAlpha = YES;
    self.mj_footer = footer;
}
//上拉刷新
- (void)loadNewDate{
    
//    if(!_NewDateBlock){
        _NewDateBlock();
//    }
}
//下拉刷新
- (void)loadMoreDate{
   
    
//    if(!_MoreDateBlock){
        _MoreDateBlock();
//    }
}
#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //根据高度数组中元素的数量 来确定 tableView 显示的cell的数量
    return _FragmentCellHeihtArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = [[_FragmentCellHeihtArray[indexPath.row] valueForKey:@"cellHeight"] floatValue];
    
    return height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cell";
    PKFragmentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[PKFragmentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //传给cell的高度模型
    cell.heightDic = _FragmentCellHeihtArray[indexPath.row];
    //传给cell的内容模型
    cell.counterList = _FragmentMedelArray[indexPath.row];
    
    return cell;
}
@end










