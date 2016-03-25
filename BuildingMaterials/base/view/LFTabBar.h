//
//  LFTabBar.h
//  基本框架
//
//  Created by 龙丰 on 15/10/17.
//  Copyright (c) 2015年 longfeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFTabBar;

@protocol LFTabBarDelegate <NSObject>

@optional
- (void)tabBar:(LFTabBar *)tabBar didSelectedIndex:(int)index;

@end


@interface LFTabBar : UIImageView

@property (nonatomic, weak) id<LFTabBarDelegate> delegate;

// 给外界创建按钮
- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName;


@end
