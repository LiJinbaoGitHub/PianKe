//
//  PKFragmentTable.h
//  ppkk
//
//  Created by ma c on 16/1/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^loadNewDateBlock)(); //上拉加载新数据
typedef void(^loadMoreDateBlock)(); // 下拉加载更多数据

@interface PKFragmentTable : UITableView

@property (copy, nonatomic) loadNewDateBlock NewDateBlock;
@property (copy, nonatomic) loadMoreDateBlock MoreDateBlock;
@property (strong, nonatomic) NSArray * FragmentMedelArray; // 碎片数据
@property (strong, nonatomic) NSArray * FragmentCellHeihtArray; // 碎片高度数据

@end
