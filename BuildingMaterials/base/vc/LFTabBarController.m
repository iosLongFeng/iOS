//
//  LFTabBarController.m
//  基本框架
//
//  Created by 龙丰 on 15/10/17.
//  Copyright (c) 2015年 longfeng.com. All rights reserved.
//

#import "LFTabBarController.h"
#import "LFTabBar.h"
@interface LFTabBarController ()<LFTabBarDelegate>

{

    LFTabBar* _lfTabBar;
}
@end

@implementation LFTabBarController

+(instancetype)shareTabbar
{
    static LFTabBarController *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[LFTabBarController alloc] init];
    });
    
    return sharedManager;
    
    
}


- (void)loadView {
    [super loadView];

    
    
    NSArray * normalImage = @[@"tab_home",@"tab_Class_circle",@"tab_Personal_Center",@"tab_Personal_Center",@"tab_Personal_Center",@"tab_Personal_Center"];
    
    NSArray * selectImage = @[@"tab_home_click",@"tab_Class_circle_click",@"tab_Personal_Center_click",@"tab_Personal_Center_click",@"tab_Personal_Center_click"];
    NSArray * normalTitle = @[@"首页",@"分类",@"旺铺",@"发现",@"个人中心"];
    NSArray * selectTitle = @[@"首页",@"分类",@"旺铺",@"发现",@"个人中心"];
    self.tabBar.hidden =  YES;
    self.view.backgroundColor = [UIColor whiteColor];
   
    
    CGFloat tabBarViewY = [UIScreen mainScreen].bounds.size.height - 49;

    // 创建tabBar
    _lfTabBar = [[LFTabBar alloc] init];
    _lfTabBar.userInteractionEnabled = YES;
    
    _lfTabBar.frame = CGRectMake(0, tabBarViewY, [UIScreen mainScreen].bounds.size.width, 49);
    _lfTabBar.image =  [UIImage new];
    _lfTabBar.backgroundColor = [UIColor whiteColor];
    _lfTabBar.delegate = self;
    

    for (int i = 0; i < 5; i++) {
        
        // 添加底部按钮
    [_lfTabBar addTabBarButtonWithName:normalTitle[i] selName:selectTitle[i]];
        
    }
    
    [self.view addSubview:_lfTabBar];

   
}



// 代理方法
- (void)tabBar:(LFTabBar *)tabBar didSelectedIndex:(int)index
{
    self.selectedIndex = index;
    
}


-(void)hiddenTabBar{
    
    
    _lfTabBar.hidden = YES;
    

}

-(void)showTabBar{

    _lfTabBar.hidden = NO;

};


@end
