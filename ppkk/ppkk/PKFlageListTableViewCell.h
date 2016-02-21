//
//  PKFlageListTableViewCell.h
//  ppkk
//
//  Created by ma c on 16/2/18.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKFlagListModel.h"

@interface PKFlageListTableViewCell : UITableViewCell
@property (strong, nonatomic)               List *counterList;
@property (strong, nonatomic)               NSDictionary *heightDic;
@property (strong, nonatomic)               NSDictionary *dataDic;//不用model用字典进行赋值时用的数据

@end
