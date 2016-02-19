//
//  PKTableView.h
//  ppkk
//
//  Created by ma c on 16/1/22.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PKLefTableViewDidSelectRow <NSObject>

- (void)selectWitchRow:(NSInteger)row;

@end

@interface PKTableView : UITableView

@property (weak, nonatomic) id<PKLefTableViewDidSelectRow> RowDelegate;

@end
