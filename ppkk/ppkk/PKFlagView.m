//
//  PKFlagView.m
//  ppkk
//
//  Created by ma c on 16/2/18.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKFlagView.h"
#import "PKFlageTableViewCell.h"
#import "PKFlageListTableViewCell.h"

@interface PKFlagView()<UITableViewDataSource,UITableViewDelegate>


@end


@implementation PKFlagView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[PKFlageTableViewCell class] forCellReuseIdentifier:@"cell"];
        [self registerClass:[PKFlageListTableViewCell class] forCellReuseIdentifier:@"cellTwo"];
    }
    return self;
    
    
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












