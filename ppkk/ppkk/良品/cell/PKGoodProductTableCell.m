//
//  PKGoodProductTableCell.m
//  ppkk
//
//  Created by ma c on 16/2/1.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKGoodProductTableCell.h"

@implementation PKGoodProductTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
     
        self.contentImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, VIEW_WIDTH - 40, 140)];
        [self addSubview:self.contentImage];
        
        self.contentLable = [[UILabel alloc]initWithFrame:CGRectMake(20,160 , VIEW_WIDTH - 100, 60)];
        self.contentLable.tintColor = [UIColor blackColor];
        self.contentLable.font = [UIFont systemFontOfSize:13.0];
        self.contentLable.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.contentLable];
        
        self.buyLable = [[UILabel alloc]initWithFrame:CGRectMake(VIEW_WIDTH - 80, 174, 60, 25)];
        self.buyLable.backgroundColor = RGB(119, 182, 69);
        self.buyLable.font = [UIFont systemFontOfSize:13.0];
        self.buyLable.text = @"立即购买";
        self.buyLable.layer.masksToBounds = YES;
        self.buyLable.layer.cornerRadius = 12.5;
        self.buyLable.textAlignment = NSTextAlignmentCenter;
        self.buyLable.textColor = [UIColor whiteColor];
        [self addSubview:self.buyLable];
        
        self.lineLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 219, VIEW_WIDTH, 0.5)];
        self.lineLable.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.lineLable];

    }
    return self;
}
@end
