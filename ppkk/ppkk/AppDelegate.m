//
//  AppDelegate.m
//  ppkk
//
//  Created by ma c on 16/1/22.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
///Users/mac/Desktop/git/ppkk/ppkk/PrefixHeader.pch

#import "AppDelegate.h"
#import "RESideMenu.h" //抽屉
#import "PKHomeViewController.h"
#import "ZJPNavigationController.h"
#import "PKLeftMenuViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    ZJPNavigationController * navigationController = [[ZJPNavigationController alloc]initWithRootViewController:[[PKHomeViewController alloc]init]];

    PKLeftMenuViewController * leftMenu = [[PKLeftMenuViewController alloc]init];
    RESideMenu * sideMenu = [[RESideMenu alloc]initWithContentViewController: navigationController leftMenuViewController:leftMenu rightMenuViewController:nil];
    sideMenu.backgroundImage = [UIImage imageNamed:@"Starts"];
    sideMenu.menuPreferredStatusBarStyle = 1;
    sideMenu.contentViewScaleValue = 1;
    sideMenu.contentViewInPortraitOffsetCenterX = VIEW_WIDTH/2-45;
    
    
    self.window.rootViewController = sideMenu;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self addLaunchingImage];
    return YES;
}
//启动图放大
- (void)addLaunchingImage{
    UIImageView *launchingImage = [[UIImageView alloc]initWithFrame:self.window.frame];
    launchingImage.image = [UIImage imageNamed:@"LaunchImage"];
    [self.window addSubview:launchingImage];
    __block CGRect launchingImageRect = launchingImage.bounds;

    [UIView animateWithDuration:3 animations:^{
        //让launchingImage的frame..
        launchingImageRect = CGRectMake(-40, -40, VIEW_WIDTH + 80, VIEW_HEIGHT + 80);
        //将新的frame赋值给launchingImage
        launchingImage.frame = launchingImageRect;
    } completion:^(BOOL finished) {
        //判断动画是否执行完成
        if (finished) {
            //如果执行完成就将透明度设置成0，使其缓慢消失
            [UIView animateWithDuration:1 animations:^{
                launchingImage.alpha = 0;
            } completion:^(BOOL finished) {
                if (finished) {
                    //动画执行完成后将其移除
                    [launchingImage removeFromSuperview];
                }
            }];
        }
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
