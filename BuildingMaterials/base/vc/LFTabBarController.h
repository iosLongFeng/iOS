//
//  LFTabBarController.h
//  基本框架
//
//  Created by 龙丰 on 15/10/17.
//  Copyright (c) 2015年 longfeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFTabBarController : UITabBarController



+(instancetype)shareTabbar;
-(void)hiddenTabBar;
-(void)showTabBar;
@end
