//
//  PKFlageListTableViewCell.m
//  ppkk
//
//  Created by ma c on 16/2/18.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKFlageListTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"

@interface PKFlageListTableViewCell ()
@property (strong, nonatomic)           UILabel *userName;//用户名
@property (strong, nonatomic)           UILabel *contentLabelTitle;//内容标题
@property (strong, nonatomic)           UILabel *contentLabelDetails;//内容详细
@property (strong, nonatomic)           UIImageView *contentImage;//大图片
@property (strong, nonatomic)           UIImageView *contentImageTwo;//大图片two
@property (strong, nonatomic)           UIImageView *contentImageThree;//大图片three
@property (strong, nonatomic)           UIButton *likeBtn;//喜欢
@property (strong, nonatomic)           UILabel *LikeLabelNumber;//喜欢数辆
@property (strong, nonatomic)           UILabel *BottomLineLabel;//线
@end

@implementation PKFlageListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview: self.userName];
        [self.contentView addSubview: self.contentImage];
        [self.contentView addSubview: self.contentLabelTitle];
        [self.contentView addSubview: self.contentLabelDetails];
        [self.contentView addSubview: self.likeBtn];
        [self.contentView addSubview: self.LikeLabelNumber];
        [self.contentView addSubview: self.BottomLineLabel];
        [self.contentView addSubview: self.contentImageTwo];
        [self.contentView addSubview: self.contentImageThree];
        self.autoresizingMask = UIViewAutoresizingNone;
        [self addAutoLayout];
    }
    return self;
    
}
//通过set方法在counterList刚被赋值时，通过Model对其他控件进行赋值
- (void)setCounterList:(List *)counterList{
    _counterList = counterList;
    _userName.text = [counterList.name stringByAppendingString:[NSString stringWithFormat:@"·%@",counterList.enname]];
    
    //[_contentImageTwo downloadImage:[_counterList.imglist[1] valueForKey:@"imglist"]];
    
    _contentLabelTitle.text = _counterList.title;
    _contentLabelDetails.text = _counterList.playInfo.shareinfo.text;
    _LikeLabelNumber.text = [NSString stringWithFormat:@"%li",counterList.like];
    
    _contentLabelDetails.attributedText = [self makeText:counterList.content];
    
    CGFloat imageHeight = [_heightDic[@"imageHeight"] floatValue];
    CGFloat textHeight = [_heightDic[@"textHeight"] floatValue];
    CGFloat titleHeight = [_heightDic[@"titleHeight"] floatValue];
    if (imageHeight == 0) {
        
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, 0);
        
        _contentLabelTitle.frame = CGRectMake(20, 70, VIEW_WIDTH-40, titleHeight);
        _contentLabelDetails.frame = CGRectMake(20, titleHeight+80, VIEW_WIDTH-40, textHeight);
        
    }else{
        if(counterList.imglist.count >= 3){
            _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, imageHeight/2);
            _contentImageTwo.frame = CGRectMake(20, imageHeight/2 + 70 + 5, VIEW_WIDTH/2-20-2, imageHeight/2);
            _contentImageThree.frame = CGRectMake( 2+VIEW_WIDTH/2, imageHeight/2 + 70 + 5, VIEW_WIDTH/2 - 20- 2, imageHeight/2);
            
            _contentLabelTitle.frame = CGRectMake(20, imageHeight+80, VIEW_WIDTH-40, titleHeight);
            _contentLabelDetails.frame = CGRectMake(20, imageHeight+titleHeight+80+10, VIEW_WIDTH-40, textHeight);
            //加载网络图片方法（UIImageView+SDWedImage中）
            //Imglist *list = _counterList.imglist[0];
            
            [_contentImage downloadImage:[_counterList.imglist[0] imgurl]];
            [_contentImageTwo downloadImage:[_counterList.imglist[1] imgurl]];
            
            [_contentImageThree downloadImage:[_counterList.imglist[2] imgurl]];
            
        }else if (counterList.imglist.count < 3){
            _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, imageHeight);
            _contentLabelTitle.frame = CGRectMake(20, imageHeight+80, VIEW_WIDTH-40, titleHeight);
            _contentLabelDetails.frame = CGRectMake(20, imageHeight+titleHeight+80+10, VIEW_WIDTH-40, textHeight);
            //加载网络图片方法（UIImageView+SDWedImage中）
            
            [_contentImage downloadImage:_counterList.coverimg];
        }
    }
}
//不用model用字典进行赋值时用的数据
- (void)setDataDic:(NSDictionary *)dataDic{
    _dataDic = dataDic;
    _userName.text = [dataDic[@"name"] stringByAppendingString:[NSString stringWithFormat:@"·%@",dataDic[@"enname"]]];
    //加载网络图片方法（UIImageView+SDWedImage中）
    [_contentImage downloadImage: dataDic[@"coverimg"]];
    [_contentImageTwo downloadImage:dataDic[@"coverimg"]];
    //[];
    _contentLabelTitle.text = dataDic[@"title"];
    _contentLabelDetails.text = [[dataDic[@"playInfo"] valueForKey:@"shareinfo"]  valueForKey:@"text"];
    
    //label调用属性字符串
    _contentLabelDetails.attributedText = [self makeText:dataDic[@"content"]];

    _LikeLabelNumber.text = [NSString stringWithFormat:@"%@",[dataDic[@"counterList"] valueForKey:@"like"]];
    
    CGFloat imageHeight = [_heightDic[@"imageHeight"] floatValue];
    CGFloat textHeight = [_heightDic[@"textHeight"] floatValue];
    CGFloat titleHeight = [_heightDic[@"titleHeight"] floatValue];
    
    if (imageHeight == 0) {
        
        _contentLabelTitle.frame = CGRectMake(20, 70, VIEW_WIDTH-40, titleHeight);
        _contentLabelDetails.frame = CGRectMake(20, titleHeight+80, VIEW_WIDTH-40, textHeight);
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, 0);
        
    }else{
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, imageHeight);
        _contentLabelTitle.frame = CGRectMake(20, imageHeight+80, VIEW_WIDTH-40, titleHeight);
        _contentLabelDetails.frame = CGRectMake(20, imageHeight+titleHeight+80+10, VIEW_WIDTH-40, textHeight);
    }

}

//生成属性字符串
- (NSAttributedString *)makeText :(NSString *)exampleString{
    //段落类型
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    //行间距
    paragraph.lineSpacing = 10;
    //段落间隔
    paragraph.paragraphSpacing = 20;
    //首行缩近
    paragraph.firstLineHeadIndent = 0;
    //属性字典（[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f]指定字符串使用的字体，因为iOS9中字体不是黑体是苹果体，不然在iOS9中字符高度计算容易出现错误）
    NSDictionary * dictA = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f],
                             //                             NSForegroundColorAttributeName:[UIColor greenColor],
                             //                             NSBackgroundColorAttributeName:[UIColor grayColor],
                             NSParagraphStyleAttributeName:paragraph,
                             //                             NSObliquenessAttributeName:@0.5 //斜体
                             //                             NSStrokeColorAttributeName:[UIColor whiteColor],
                             //                             NSStrokeWidthAttributeName:@2,//描边
                             //                             NSKernAttributeName:@20,//字间距
                             //                             NSStrikethroughStyleAttributeName:@2//删除线
                             //                             NSUnderlineStyleAttributeName:@1,//下划线
                             };
    //返回属性字符串
    NSAttributedString * attribute = [[NSAttributedString alloc] initWithString:exampleString attributes:dictA];
    return attribute;
}
//****cell中属性初始化****
//用户名label
- (UILabel *)userName{
    if(!_userName){
        _userName = [[UILabel alloc]init];
        _userName.textAlignment = NSTextAlignmentLeft;
        _userName.font = [UIFont systemFontOfSize:13.0];
        _userName.textColor = [UIColor lightGrayColor];
    }
    return _userName;
}
- (UIImageView *)contentImage{
    if(!_contentImage){
        _contentImage = [[UIImageView alloc]init];
    }
    return _contentImage;
}
- (UIImageView *)contentImageTwo{
    if(!_contentImageTwo){
        _contentImageTwo = [[UIImageView alloc]init];
    }
    return _contentImageTwo;
}
- (UIImageView *)contentImageThree{
    if(!_contentImageThree){
        _contentImageThree = [[UIImageView alloc]init];
    }
    return _contentImageThree;
}

- (UILabel *)contentLabelTitle{
    if(!_contentLabelTitle){
        _contentLabelTitle = [[UILabel alloc]init];
        _contentLabelTitle.textAlignment = NSTextAlignmentLeft;
        _contentLabelTitle.textColor = [UIColor blackColor];
        _contentLabelTitle.font = [UIFont fontWithName:@"PingFangSC-Regular" size:20.0f];
        _contentLabelTitle.numberOfLines = 0;
    }
    return _contentLabelTitle;
}
- (UILabel *)contentLabelDetails{
    if(!_contentLabelDetails){
        _contentLabelDetails = [[UILabel alloc]init];
        _contentLabelDetails.textAlignment = NSTextAlignmentLeft;
        _contentLabelDetails.textColor = [UIColor lightGrayColor];
        _contentLabelDetails.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15.0f];
        _contentLabelDetails.numberOfLines = 0;
    }
    return _contentLabelDetails;
}
- (UIButton *)likeBtn{
    if(!_likeBtn){
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_likeBtn setImage:[UIImage imageNamed:@"喜欢"] forState:UIControlStateNormal];
    }
    return _likeBtn;
}
- (UILabel *)LikeLabelNumber{
    if(!_LikeLabelNumber){
        _LikeLabelNumber = [[UILabel alloc]init];
        _LikeLabelNumber.font = [UIFont systemFontOfSize:9.0];
        _LikeLabelNumber.textColor = [UIColor blackColor];
        _LikeLabelNumber.textAlignment = NSTextAlignmentLeft;
    }
    return _LikeLabelNumber;
}
- (UILabel *)BottomLineLabel{
    if (!_BottomLineLabel) {
        _BottomLineLabel = [[UILabel alloc]init];
        _BottomLineLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _BottomLineLabel;
}

///为cell中,控件,添加约束
- (void)addAutoLayout{
    WS(weakSelf);
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15.0);
        make.left.equalTo(weakSelf.contentView.mas_left).offset(10);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-10);
        make.top.equalTo(weakSelf.contentView.mas_top).offset(10);
    }];
    
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-10);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-50);
    }];
    
    [_LikeLabelNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 10));
        make.left.equalTo(weakSelf.likeBtn.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.likeBtn.mas_centerY);

    }];
    [_BottomLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.contentView.mas_bottom);
        make.right.equalTo(weakSelf.contentView.mas_right);
        make.left.equalTo(weakSelf.contentView.mas_left);
        make.height.equalTo(@0.5);

    }];
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
