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
        
        [self addSubview:self.label];
        
    }
    return self;
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 80)];
        [_label setText:@"sjhdfsjhfjdskhf"];
        _label.font = [UIFont systemFontOfSize:16];
        [_label setTextColor:[UIColor yellowColor]];
    }
    return _label;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
