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
    scrollView.imageURLStringsGroup = @[@"http:\/\/pkicdn.image.alimmdn.com\/timeline\/tagimgs\/8a6108c0f182dd01a6a11a938cefcceb.jpg",@"http:\/\/pkicdn.image.alimmdn.com\/timeline\/tagimgs\/7cc39c1c44162000c3769eadfa04d24a.jpg",@"http:\/\/pkicdn.image.alimmdn.com\/timeline\/tagimgs\/338d6a352103b5ab384ef020e80c8bb2.png",@"http:\/\/pkicdn.image.alimmdn.com\/timeline\/tagimgs\/fe4a12c94d06d5948b8d67583373e82f.jpg",@"http:\/\/pkicdn.image.alimmdn.com\/timeline\/tagimgs\/c1d222dc16c7fb9b0f3963942f42d97c.jpg",@"http:\/\/pkicdn.image.alimmdn.com\/timeline\/tagimgs\/883f5efcf151a5215ff56fc882d26098.png",@"http:\/\/pkicdn.image.alimmdn.com\/timeline\/tagimgs\/e8d7d016e8a36b782b0ece5b1e732026.jpg"];
    
    [self addSubview:scrollView];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
