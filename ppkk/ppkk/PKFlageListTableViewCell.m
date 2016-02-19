//
//  PKFlageListTableViewCell.m
//  ppkk
//
//  Created by ma c on 16/2/18.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKFlageListTableViewCell.h"

@implementation PKFlageListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.uName];
        
    }
    return self;
    
}

- (UILabel *)uName {
    if (!_uName) {
        _uName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 80)];
        _uName.font = [UIFont systemFontOfSize:16];
        [_uName setTextColor:[UIColor yellowColor]];
    }
    return _uName;
}
- (void)addConstraints {


    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
