//
//  PKFlageTableViewCell.m
//  ppkk
//
//  Created by ma c on 16/2/18.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKFlageTableViewCell.h"
#import "SDCycleScrollView.h"
@interface PKFlageTableViewCell ()
@property (strong,nonatomic) SDCycleScrollView* scrollView;
@end
@implementation PKFlageTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        //调用轮播
        [self creatScrollView];
        
    }
    return self;
}

///创建轮播
- (void)creatScrollView{


    SDCycleScrollView* scrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 180)];
    scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    
    self.scrollView = scrollView;
    [self addSubview:scrollView];
}

- (void)setScroImageWithArray:(NSArray*)array{
    self.scrollView.imageURLStringsGroup = array;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
