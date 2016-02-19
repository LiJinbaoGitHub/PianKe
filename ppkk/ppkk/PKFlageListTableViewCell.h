//
//  PKFlageListTableViewCell.h
//  ppkk
//
//  Created by ma c on 16/2/18.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKFlageListTableViewCell : UITableViewCell
/** 用户名 */
@property (strong, nonatomic) UILabel *uName;
/**大标题*/
@property (strong, nonatomic) UILabel* title;
/** 图片 */
@property (strong, nonatomic) UIImageView *imgView;
/** 正文 */
@property (strong, nonatomic) UILabel *text;

@end
