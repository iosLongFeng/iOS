//
//  AppDelegate.m
//  BuildingMaterials
//
//  Created by 龙丰 on 16/3/24.
//  Copyright © 2016年 longfeng.com. All rights reserved.
//

#import "AppDelegate.h"
#import "LFTabBarController.h"
#import "LFNavigationController.h"
#import "HomePageController.h"
#import "CategeroyController.h"
#import "FinderController.h"
#import "PersonCenterController.h"
#import "StoreController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    LFTabBarController* tabVc = [LFTabBarController shareTabbar];
   
    NSMutableArray *vcs = [NSMutableArray array];
    NSArray* vcArr = @[@"HomePageController",@"CategeroyController",@"StoreController",@"FinderController",@"PersonCenterController"];
    
    for (int i = 0; i< vcArr.count; i++) {
        
        UIViewController *vc = [[NSClassFromString(vcArr[i]) alloc] init];
       
        LFNavigationController *nav = [[LFNavigationController alloc] initWithRootViewController:vc];
        
        [vcs addObject:nav];
    }
 
    [tabVc  setViewControllers:vcs];
    self.window.rootViewController = tabVc;
    [self.window makeKeyAndVisible];

    return YES;
}


@end
