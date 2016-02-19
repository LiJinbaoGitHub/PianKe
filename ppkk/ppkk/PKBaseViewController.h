//
//  PKBaseViewController.h
//  ppkk
//
//  Created by ma c on 16/1/22.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "AFNetworking.h"
#import "RESideMenu.h"
#import "UIImageView+SDWedImage.h"
#import "UIView+Toast.h"
#import "JPRefreshView.h"
#import "UIBarButtonItem+Helper.h"
#import "ZJPBaseHttpTool.h"
#import "JPRefreshView.h"

//类型声明
typedef void (^HttpSuccessBlock)(id JSON);
typedef void (^HttpErrorBlock)(NSError * error);

@interface PKBaseViewController : UIViewController

//属性
@property (copy, nonatomic) HttpSuccessBlock successBlock;
@property (copy, nonatomic) HttpErrorBlock errorBlock;

//方法

- (void)GETHttpRequest:(NSString *)url dic:(NSDictionary *)dic                                        successBlock:(HttpSuccessBlock)RequestSuccess
            errorBlock:(HttpErrorBlock)RequestError;

- (void)POSTHttpRequest:(NSString *)url dic:(NSDictionary *)dic
           successBlock:(HttpSuccessBlock)RequestSuccess errorBlock:(HttpErrorBlock)RequestError;
- (void)addBackItemBtn;

- (void)addNavLeftBackBtnMeun;

@end







