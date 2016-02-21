//
//  PKFlagListModel.m
//  ppkk
//
//  Created by ma c on 16/2/19.
//  Copyright © 2016年 北京尚学堂. All rights reserved.
//

#import "PKFlagListModel.h"

@implementation PKFlagListModel
-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
        self.data = [[Data alloc] initWithDictionary:dictionary[@"data"]];
    }
    
    if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
        self.result = [dictionary[@"result"] integerValue];
    }
    
    return self;
}

@end
/** */
@implementation Authorinfo
/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"icon"] isKindOfClass:[NSNull class]]){
        self.icon = dictionary[@"icon"];
    }
    if(![dictionary[@"uid"] isKindOfClass:[NSNull class]]){
        self.uid = [dictionary[@"uid"] integerValue];
    }
    
    if(![dictionary[@"uname"] isKindOfClass:[NSNull class]]){
        self.uname = dictionary[@"uname"];
    }	
    return self;
}
@end
///
@implementation Carousel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"count"] isKindOfClass:[NSNull class]]){
        self.count = [dictionary[@"count"] integerValue];
    }
    
    if(![dictionary[@"img"] isKindOfClass:[NSNull class]]){
        self.img = dictionary[@"img"];
    }
    if(![dictionary[@"url"] isKindOfClass:[NSNull class]]){
        self.url = dictionary[@"url"];
    }	
    return self;
}
@end
///
@implementation Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[@"carousel"] != nil && [dictionary[@"carousel"] isKindOfClass:[NSArray class]]){
        NSArray * carouselDictionaries = dictionary[@"carousel"];
        NSMutableArray * carouselItems = [NSMutableArray array];
        for(NSDictionary * carouselDictionary in carouselDictionaries){
            Carousel * carouselItem = [[Carousel alloc] initWithDictionary:carouselDictionary];
            [carouselItems addObject:carouselItem];
        }
        self.carousel = carouselItems;
    }
    if(![dictionary[@"date"] isKindOfClass:[NSNull class]]){
        self.date = dictionary[@"date"];
    }
    if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
        NSArray * listDictionaries = dictionary[@"list"];
        NSMutableArray * listItems = [NSMutableArray array];
        for(NSDictionary * listDictionary in listDictionaries){
            List * listItem = [[List alloc] initWithDictionary:listDictionary];
            [listItems addObject:listItem];
        }
        self.list = listItems;
    }
    if(![dictionary[@"total"] isKindOfClass:[NSNull class]]){
        self.total = [dictionary[@"total"] integerValue];
    }
    
    return self;
}
@end
///
@implementation Imglist




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"imgurl"] isKindOfClass:[NSNull class]]){
        self.imgurl = dictionary[@"imgurl"];
    }
    return self;
}
@end
///
@implementation List




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"content"] isKindOfClass:[NSNull class]]){
        self.content = dictionary[@"content"];
    }
    if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
        self.coverimg = dictionary[@"coverimg"];
    }
    if(![dictionary[@"coverimg_wh"] isKindOfClass:[NSNull class]]){
        self.coverimgWh = dictionary[@"coverimg_wh"];
    }
    if(![dictionary[@"date"] isKindOfClass:[NSNull class]]){
        self.date = dictionary[@"date"];
    }
    if(![dictionary[@"enname"] isKindOfClass:[NSNull class]]){
        self.enname = dictionary[@"enname"];
    }
    if(![dictionary[@"hot"] isKindOfClass:[NSNull class]]){
        self.hot = [dictionary[@"hot"] integerValue];
    }
    
    if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
        self.idField = dictionary[@"id"];
    }
    if(dictionary[@"imglist"] != nil && [dictionary[@"imglist"] isKindOfClass:[NSArray class]]){
        NSArray * imglistDictionaries = dictionary[@"imglist"];
        NSMutableArray * imglistItems = [NSMutableArray array];
        for(NSDictionary * imglistDictionary in imglistDictionaries){
            Imglist * imglistItem = [[Imglist alloc] initWithDictionary:imglistDictionary];
            [imglistItems addObject:imglistItem];
        }
        self.imglist = imglistItems;
    }
    if(![dictionary[@"imgtotal"] isKindOfClass:[NSNull class]]){
        self.imgtotal = [dictionary[@"imgtotal"] integerValue];
    }
    
    if(![dictionary[@"islike"] isKindOfClass:[NSNull class]]){
        self.islike = [dictionary[@"islike"] boolValue];
    }
    
    if(![dictionary[@"issend"] isKindOfClass:[NSNull class]]){
        self.issend = [dictionary[@"issend"] integerValue];
    }
    
    if(![dictionary[@"lastupdate"] isKindOfClass:[NSNull class]]){
        self.lastupdate = [dictionary[@"lastupdate"] integerValue];
    }
    
    if(![dictionary[@"like"] isKindOfClass:[NSNull class]]){
        self.like = [dictionary[@"like"] integerValue];
    }
    
    if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
        self.name = dictionary[@"name"];
    }
    if(![dictionary[@"playInfo"] isKindOfClass:[NSNull class]]){
        self.playInfo = [[PlayInfo alloc] initWithDictionary:dictionary[@"playInfo"]];
    }
    
    if(dictionary[@"playList"] != nil && [dictionary[@"playList"] isKindOfClass:[NSArray class]]){
        NSArray * playListDictionaries = dictionary[@"playList"];
        NSMutableArray * playListItems = [NSMutableArray array];
        for(NSDictionary * playListDictionary in playListDictionaries){
            PlayInfo * playListItem = [[PlayInfo alloc] initWithDictionary:playListDictionary];
            [playListItems addObject:playListItem];
        }
        self.playList = playListItems;
    }
    if(![dictionary[@"songid"] isKindOfClass:[NSNull class]]){
        self.songid = dictionary[@"songid"];
    }
    if(![dictionary[@"tag_info"] isKindOfClass:[NSNull class]]){
        self.tagInfo = [[TagInfo alloc] initWithDictionary:dictionary[@"tag_info"]];
    }
    
    if(![dictionary[@"ting_contentid"] isKindOfClass:[NSNull class]]){
        self.tingContentid = dictionary[@"ting_contentid"];
    }
    if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
        self.title = dictionary[@"title"];
    }
    if(![dictionary[@"type"] isKindOfClass:[NSNull class]]){
        self.type = [dictionary[@"type"] integerValue];
    }
    
    if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
        self.userinfo = [[Authorinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
    }
    
    if(![dictionary[@"view"] isKindOfClass:[NSNull class]]){
        self.view = [dictionary[@"view"] integerValue];
    }
    
    return self;
}
@end
///
@implementation PlayInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"authorinfo"] isKindOfClass:[NSNull class]]){
        self.authorinfo = [[Authorinfo alloc] initWithDictionary:dictionary[@"authorinfo"]];
    }
    
    if(![dictionary[@"imgUrl"] isKindOfClass:[NSNull class]]){
        self.imgUrl = dictionary[@"imgUrl"];
    }
    if(![dictionary[@"musicUrl"] isKindOfClass:[NSNull class]]){
        self.musicUrl = dictionary[@"musicUrl"];
    }
    if(![dictionary[@"shareinfo"] isKindOfClass:[NSNull class]]){
        self.shareinfo = [[Shareinfo alloc] initWithDictionary:dictionary[@"shareinfo"]];
    }
    
    if(![dictionary[@"sharepic"] isKindOfClass:[NSNull class]]){
        self.sharepic = dictionary[@"sharepic"];
    }
    if(![dictionary[@"sharetext"] isKindOfClass:[NSNull class]]){
        self.sharetext = dictionary[@"sharetext"];
    }
    if(![dictionary[@"shareurl"] isKindOfClass:[NSNull class]]){
        self.shareurl = dictionary[@"shareurl"];
    }
    if(![dictionary[@"ting_contentid"] isKindOfClass:[NSNull class]]){
        self.tingContentid = dictionary[@"ting_contentid"];
    }
    if(![dictionary[@"tingid"] isKindOfClass:[NSNull class]]){
        self.tingid = dictionary[@"tingid"];
    }
    if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
        self.title = dictionary[@"title"];
    }
    if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
        self.userinfo = [[Authorinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
    }
    
    if(![dictionary[@"webview_url"] isKindOfClass:[NSNull class]]){
        self.webviewUrl = dictionary[@"webview_url"];
    }	
    return self;
}
@end
///
@implementation RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"data"] isKindOfClass:[NSNull class]]){
        self.data = [[Data alloc] initWithDictionary:dictionary[@"data"]];
    }
    
    if(![dictionary[@"result"] isKindOfClass:[NSNull class]]){
        self.result = [dictionary[@"result"] integerValue];
    }
    
    return self;
}
@end
///
@implementation Shareinfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"pic"] isKindOfClass:[NSNull class]]){
        self.pic = dictionary[@"pic"];
    }
    if(![dictionary[@"text"] isKindOfClass:[NSNull class]]){
        self.text = dictionary[@"text"];
    }
    if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
        self.title = dictionary[@"title"];
    }
    if(![dictionary[@"url"] isKindOfClass:[NSNull class]]){
        self.url = dictionary[@"url"];
    }	
    return self;
}
@end
///
@implementation TagInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"count"] isKindOfClass:[NSNull class]]){
        self.count = [dictionary[@"count"] integerValue];
    }
    
    if(![dictionary[@"tag"] isKindOfClass:[NSNull class]]){
        self.tag = dictionary[@"tag"];
    }	
    return self;
}
@end
///
@implementation Userinfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[@"uid"] isKindOfClass:[NSNull class]]){
        self.uid = [dictionary[@"uid"] integerValue];
    }
    
    if(![dictionary[@"uname"] isKindOfClass:[NSNull class]]){
        self.uname = dictionary[@"uname"];
    }	
    return self;
}
@end


