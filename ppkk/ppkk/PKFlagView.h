//
//  PKFlagView.h
//  ppkk
//
//  Created by ma c on 16/2/18.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PKFlagListModel;

typedef void(^loadNewDataBlock)();//加载新数据
typedef void(^loadMoreDataBlock)();//加载更多数据

@interface PKFlagView : UITableView

@property (strong, nonatomic)           NSMutableArray *flageModel;//碎片数据
@property (strong, nonatomic)           NSArray *cellHeightArray;//高度数组
@property (copy, nonatomic)             loadNewDataBlock NewDataBlock;
@property (copy, nonatomic)             loadMoreDataBlock MoreDataBlock;
@property (strong, nonatomic)           PKFlagListModel * flagListModel;
@property (strong,nonatomic)            NSArray* scrollArray; //存放轮播图片数组
@end
