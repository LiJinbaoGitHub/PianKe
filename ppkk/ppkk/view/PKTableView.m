//
//  PKTableView.m
//  ppkk
//
//  Created by ma c on 16/1/22.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKTableView.h"
#import "PKTableViewCell.h"

@interface PKTableView ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray * imageArray;
@property (strong, nonatomic) NSArray * titleArray;

@end

@implementation PKTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if(self){
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.imageArray = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品",@"设置"];
        self.titleArray = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品",@"设置"];
        //注册
        [self registerClass:[PKTableViewCell class] forCellReuseIdentifier:@"cellID"];
        self.separatorStyle = NO;
        self.backgroundColor = RGB(51, 51, 51);
        
        }
    return self;
}
#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID = @"cellID";
    PKTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    //表格 图片和标题
    cell.iconImage.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    cell.titleLable.text = _titleArray[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55.0;
}
//点击cell时触发
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_RowDelegate performSelector:@selector(selectWitchRow:)]) {
        [_RowDelegate selectWitchRow:indexPath.row];
    }
    
}
@end
