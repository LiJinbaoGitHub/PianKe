//
//  PKFragmentTableViewCell.m
//  ppkk
//
//  Created by ma c on 16/1/28.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKFragmentTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"

@interface PKFragmentTableViewCell ()

@property (strong, nonatomic) UIImageView * iconImage;    //头像
@property (strong, nonatomic) UILabel * userName;         //用户名
@property (strong, nonatomic) UILabel * timeLable;        //时间
@property (strong, nonatomic) UILabel * contentLable;     //内容
@property (strong, nonatomic) UIImageView * contentImage; //大图片
@property (strong, nonatomic) UIButton * writeBtn;        //评论按钮
@property (strong, nonatomic) UILabel * writeLable;       //评论数量
@property (strong, nonatomic) UIButton * likeBtn;         //喜欢按钮
@property (strong, nonatomic) UILabel * likeLable;        //喜欢数量
@property (strong, nonatomic) UILabel * lineLable;        //线

@end

@implementation PKFragmentTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self addSubview:self.iconImage];
        [self addSubview:self.userName];
        [self addSubview:self.timeLable];
        [self addSubview:self.contentLable];
        [self addSubview:self.contentImage];
        [self addSubview:self.writeBtn];
        [self addSubview:self.writeLable];
        [self addSubview:self.likeBtn];
        [self addSubview:self.likeLable];
        [self addSubview:self.lineLable];
        self.autoresizingMask = UIViewAutoresizingNone;
        [self addlayout];
    }
    return self;
}
//约束
- (void)addlayout{
    WS(weakSelf);
    
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.left.equalTo(weakSelf.contentView.mas_left).offset(20);
        make.top.equalTo(weakSelf.contentView.mas_top).offset(20);
    }];
    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@14.0);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(5);
        make.centerY.equalTo(weakSelf.iconImage.mas_centerY);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-70);
    }];
    
    [_timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 14));
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-20);
        make.centerY.equalTo(weakSelf.iconImage.mas_centerY);
    }];
    
    [_writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-30);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-150);
    }];
    [_writeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 10));
        make.left.equalTo(weakSelf.writeBtn.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.writeBtn.mas_centerY);
    }];
    
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-30);
        make.left.equalTo(weakSelf.writeLable.mas_right).offset(-30);
    }];
    
    [_likeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 10));
        make.left.equalTo(weakSelf.likeBtn.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.writeBtn.mas_centerY);
    }];
    [_lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.contentView.mas_bottom);
        make.right.equalTo(weakSelf.contentView.mas_right);
        make.left.equalTo(weakSelf.contentView.mas_left);
        make.height.equalTo(@0.5);
    }];
}

//**属性
- (UIImageView *)iconImage{
    if(!_iconImage){
        _iconImage = [[UIImageView alloc]init];
        _iconImage.layer.cornerRadius = 15.0;
        _iconImage.layer.masksToBounds = YES;
        _iconImage.backgroundColor = [UIColor lightGrayColor];
    }
    return _iconImage;
}
- (UILabel *)userName{
    if(!_userName){
        _userName = [[UILabel alloc]init];
        _userName.textAlignment = NSTextAlignmentLeft;
        _userName.font = [UIFont systemFontOfSize:13.0];
        _userName.textColor = RGB(80, 100, 127);
    }
    return _userName;
}
- (UILabel *)timeLable{
    if(!_timeLable){
        _timeLable = [[UILabel alloc]init];
        _timeLable.textAlignment = NSTextAlignmentLeft;
        _timeLable.font = [UIFont systemFontOfSize:13.0];
        _timeLable.textColor = [UIColor blackColor];
    }
    return _timeLable;
}
- (UILabel *)contentLable{
    if(!_contentLable){
        _contentLable = [[UILabel alloc]init];
        _contentLable.textAlignment = NSTextAlignmentLeft;
        _contentLable.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15.0];
        _contentLable.textColor = [UIColor blackColor];
        _contentLable.numberOfLines = 0;
    }
    return _contentLable;
}
- (UIImageView *)contentImage{
    if(!_contentImage){
        _contentImage = [[UIImageView alloc]init];
    }
    return _contentImage;
}
- (UIButton *)writeBtn{
    if(!_writeBtn){
        _writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_writeBtn setImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
    }
    return _writeBtn;
}
- (UILabel *)writeLable{
    if(!_writeLable){
        _writeLable = [[UILabel alloc]init];
        _writeLable.font = [UIFont systemFontOfSize:9.0];
        _writeLable.textAlignment = NSTextAlignmentLeft;
        _writeLable.textColor = [UIColor blackColor];
    }
    return _writeLable;
}
- (UIButton *)likeBtn{
    if(!_likeBtn){
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_writeBtn setImage:[UIImage imageNamed:@"喜欢"] forState:UIControlStateNormal];
    }
    return _likeBtn;
}
- (UILabel *)likeLable{
    if(!_likeLable){
        _likeLable = [[UILabel alloc]init];
        _likeLable.textColor = [UIColor blackColor];
        _likeLable.textAlignment = NSTextAlignmentLeft;
        _likeLable.font = [UIFont systemFontOfSize:9.0];
    }
    return _likeLable;
}
- (UILabel *)lineLable{
    if(!_lineLable){
        _lineLable = [[UILabel alloc]init];
        [_lineLable setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _lineLable;
}

//通过set方法在counterList刚被赋值时，对其他控件进行赋值
- (void)setCounterList:(PKFragmentList *)counterList{
    
    _counterList = counterList;
    [_iconImage downloadImage:counterList.userinfo.icon];//SDWebImage缓存图片
    _userName.text = counterList.userinfo.uname;
    _timeLable.text = counterList.addtimeF;
    _likeLable.text = [NSString stringWithFormat:@"%li",counterList.counterList.like];
    _writeLable.text = [NSString stringWithFormat:@"%li",counterList.counterList.comment];
    //加载网络图片的方法 (UIImageView + SDWedImage)
    [_contentImage downloadImage:_counterList.coverimg];
    //lable调用属性字符串
    if (counterList.counterList) {
        _contentLable.attributedText = [self makeText:counterList.content];
    }
    
    CGFloat imageHeight = [_heightDic[@"imageHeight"] floatValue];
    CGFloat textHeight = [_heightDic[@"textHeight"] floatValue];
    
    if(imageHeight == 0){
        
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH - 40, 0);
        _contentLable.frame = CGRectMake(20, 70, VIEW_WIDTH - 40, textHeight);
        
    }else{
        
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH - 40, imageHeight);
        _contentLable.frame = CGRectMake(20, imageHeight+80, VIEW_WIDTH - 40, textHeight);

    }
}

- (void)setDateDic:(NSDictionary *)dataDic{
    _dataDic = dataDic;
    [_iconImage downloadImage:[dataDic[@"userinfo"] valueForKey:@"icon"]];
    _userName.text = [dataDic[@"userinfo"] valueForKey:@"uname"];
    _timeLable.text = dataDic[@"addtimeF"];
    _likeLable.text = [NSString stringWithFormat:@"%@",[dataDic[@"counterList"] valueForKey:@"like"]];
    _writeLable.text = [NSString stringWithFormat:@"%@",[dataDic[@"counterList"] valueForKey:@"comment"]];
    //加载网络图片方法（UIImageView+SDWedImage中）
    [_contentImage downloadImage:dataDic[@"coverimg"]];
    //label调用属性字符串
    _contentLable.attributedText = [self makeText:dataDic[@"content"]];
    
    CGFloat imageHeight = [_heightDic[@"imageHeight"] floatValue];
    CGFloat textHeight = [_heightDic[@"textHeight"] floatValue];
    NSLog(@"----------%lf---------%lf",imageHeight,textHeight);
    if (imageHeight == 0) {
        
        _contentLable.frame = CGRectMake(20, 70, VIEW_WIDTH-40, textHeight);
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, 0);
        
    }else{
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, imageHeight);
        _contentLable.frame = CGRectMake(20, imageHeight+80, VIEW_WIDTH-40, textHeight);
        
    }

}

//生成属性字符串
- (NSAttributedString *)makeText : (NSString *)exampleSting {
    //段落类型
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc]init];
    //行间距
    paragraph.lineSpacing = 10;
    //段落间隔
    paragraph.paragraphSpacing = 20;
    //首行缩进
    paragraph.firstLineHeadIndent = 30;
    //属性字典（[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f]指定字符串使用的字体，因为iOS9中字体不是黑体是苹果体，不然在iOS9中字符高度计算容易出现错误）
    NSDictionary * dicArray = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f],
//                                NSForegroundColorAttributeName:[UIColor greenColor],
//                                NSBackgroundColorAttributeName:[UIColor grayColor],
                                NSParagraphStyleAttributeName:paragraph,
//                                NSObliquenessAttributeName:@0.5 //斜体
//                                NSStrokeColorAttributeName:[UIColor whiteColor],
//                                NSStrokeWidthAttributeName:@2,//描边
//                                NSKernAttributeName:@20,//字间距
//                                NSStrikethroughStyleAttributeName:@2//删除线
//                                NSUnderlineStyleAttributeName:@1,//下划线
                                };
    
    //返回字符串属性
    NSAttributedString * attribute = [[NSAttributedString alloc]initWithString:exampleSting attributes:dicArray];
    return attribute;
}


//- (void)awakeFromNib {
//
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//}

@end
