//
//  NSArray+PKFlageCellHeight.m
//  ppkk
//
//  Created by ma c on 16/2/20.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "NSArray+PKFlageCellHeight.h"
#import "NSString+Helper.h"
#import "PKFlagListModel.h"

@implementation NSArray (PKFlageCellHeight)

+ (NSArray *)countCellHeight:(NSArray *)model{
    //创建存储数据的数组
    NSMutableArray *HeightArray = [NSMutableArray array];
    //便利数组
    for (NSInteger i = 0; i <model.count; i ++) {
        
        List *list = model[i];
        CGFloat imageH = 0.00001;
        CGFloat textH = 0.0;
        CGFloat titleH = 0.0;
        //判断是否为空
        if (!([list.coverimgWh isEmptyString]||list.coverimgWh == nil)) {
            if(list.imglist.count == 1){
            NSString *ImageSize = list.coverimgWh;
            //字符串截取
            NSArray *array = [ImageSize componentsSeparatedByString:@"*"];
            //根据宽高比计算高度
            imageH = [array[1] floatValue]*((VIEW_WIDTH-40.0)/[array[0] floatValue]);
            }
            if (list.imglist.count >=3) {
                NSString *ImageSize = list.coverimgWh;
                //字符串截取
                NSArray *array = [ImageSize componentsSeparatedByString:@"*"];
                //根据宽高比计算高度
                imageH = [array[1] floatValue]*((VIEW_WIDTH-40.0)/[array[0] floatValue]) * 1.3;
            }
        }
        //转换成number类型数据存入字典
        NSNumber *imageHeight = [NSNumber numberWithFloat:imageH];
        if (![list.content isEmptyString]) {
            textH = [NSString autoHeightWithString:list.content Width:VIEW_WIDTH-50 Font:[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f]];
        }
        if(![list.title isEmptyString]){
            titleH =[NSString autoHeightWithString:list.title Width:VIEW_WIDTH-50 Font:[UIFont fontWithName:@"PingFangSC-Regular" size:20.0f]];
        }
        NSNumber * textHeight = [NSNumber numberWithFloat:textH];
        NSNumber * titleHeight = [NSNumber numberWithFloat:titleH];
        NSNumber *cellHeight = [NSNumber numberWithFloat:imageH+textH+150.0];
        
        NSDictionary *heightDic = @{@"imageHeight":imageHeight,@"textHeight":textHeight,@"cellHeight":cellHeight,@"titleHeight":titleHeight};
        
        [HeightArray addObject:heightDic];
    }
    return HeightArray;
}

@end
