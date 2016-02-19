//
//  PKFragmentTableViewCell.h
//  ppkk
//
//  Created by ma c on 16/1/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKFragmentModel.h"

@interface PKFragmentTableViewCell : UITableViewCell

@property (strong, nonatomic) PKFragmentList * counterList;
@property (strong, nonatomic) NSDictionary * heightDic;
@property (strong, nonatomic) NSDictionary * dataDic; ////不用model用字典进行赋值时用的数据

@end
