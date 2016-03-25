//
//  ILNavigationController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "LFNavigationController.h"

@interface LFNavigationController ()

@end

@implementation LFNavigationController

// 第一次使用这个类或者这个类的子类的时候
+ (void)initialize
{
    if (self == [LFNavigationController class]) { // 肯定能保证只调用一次
       
        
       // 1.设置全局导航条外观
        [self setupNav];
        
        
        
    }
}

#warning 设置全局导航条
+ (void)setupNav
{
    // 获取应用程序中所有的导航条
    // 获取所有导航条外观
    UINavigationBar *bar = [UINavigationBar appearance];
    
    //UIImage *navImage = [UIImage imageNamed:@"nav_bg"];
    
    //[bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [bar setTintColor:[UIColor grayColor]];
    
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                           NSFontAttributeName : [UIFont systemFontOfSize:15]
                           };
    [bar setTitleTextAttributes:dict];
    
    // 设置导航条的主题颜色
    [bar setTintColor:[UIColor whiteColor]];
}











@end
