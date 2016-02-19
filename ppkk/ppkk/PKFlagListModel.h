//
//  PKFlagListModel.h
//  ppkk
//
//  Created by ma c on 16/2/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 作者信息*/
@interface Authorinfo : NSObject
@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * uname;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

/** */
@interface Carousel : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
/** */

/** 请求成功后的第一层数据*/
@interface Data : NSObject

@property (nonatomic, strong) NSArray * carousel;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
/** 图片列表*/
@interface Imglist : NSObject

@property (nonatomic, strong) NSString * imgurl;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

/** 分享信息*/
@interface Shareinfo : NSObject

@property (nonatomic, strong) NSString * pic;
@property (nonatomic, strong) NSString * text;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
@interface Userinfo : NSObject

@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * uname;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
//

/** 玩家信息*/
@interface PlayInfo : NSObject

@property (nonatomic, strong) Authorinfo * authorinfo;
@property (nonatomic, strong) NSString * imgUrl;
@property (nonatomic, strong) NSString * musicUrl;
@property (nonatomic, strong) Shareinfo * shareinfo;
@property (nonatomic, strong) NSString * sharepic;
@property (nonatomic, strong) NSString * sharetext;
@property (nonatomic, strong) NSString * shareurl;
@property (nonatomic, strong) NSString * tingContentid;
@property (nonatomic, strong) NSString * tingid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) Authorinfo * userinfo;
@property (nonatomic, strong) NSString * webviewUrl;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
/** */
@interface RootClass : NSObject

@property (nonatomic, strong) Data * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
/** */
@interface TagInfo : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString * tag;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
/** */

/** */
@interface List : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * coverimgWh;
@property (nonatomic, strong) NSString * date;
@property (nonatomic, strong) NSString * enname;
@property (nonatomic, assign) NSInteger hot;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSArray * imglist;
@property (nonatomic, assign) NSInteger imgtotal;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, assign) NSInteger issend;
@property (nonatomic, assign) NSInteger lastupdate;
@property (nonatomic, assign) NSInteger like;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) PlayInfo * playInfo;
@property (nonatomic, strong) NSArray * playList;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) TagInfo * tagInfo;
@property (nonatomic, strong) NSString * tingContentid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) Authorinfo * userinfo;
@property (nonatomic, assign) NSInteger view;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end


@interface PKFlagListModel : NSObject

@end
