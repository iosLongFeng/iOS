//
//  BaseController.m
//  BuildingMaterials
//
//  Created by 龙丰 on 16/3/24.
//  Copyright © 2016年 longfeng.com. All rights reserved.
//

#import "BaseController.h"
#import "LFTabBarController.h"
@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBar];
}


-(void)setNavBar{

    //设置导航栏背景图片
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"view_bg"]];
    self.view.opaque = YES;
    
    //导航栏左侧按钮
    
    UIButton* leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 35, 35);
    
    leftBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    //[leftBtn setImage:[UIImage imageNamed:@"箭头@2x"] forState:0];
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self
                action:@selector(leftBtnAction:)
      forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.leftBut = leftBtn;
    //导航栏右侧按钮
    
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightBtn.frame = CGRectMake(0, 0,35, 35);
    
    rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    rightBtn.titleLabel.textAlignment =2;
    [rightBtn addTarget:self
                 action:@selector(rightBtnAction:)
       forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    self.rightBut = rightBtn;
    //标题
    UILabel* titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    titleLb.font = [UIFont boldSystemFontOfSize:17];
    titleLb.textAlignment = 1;
    titleLb.textColor = [UIColor blueColor];
    self.navigationItem.titleView = titleLb;

    self.titleLael = titleLb;


}



#pragma mark --- 导航栏左侧按钮点击方法 ---

- (void)leftBtnAction:(UIButton *)sender
{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.navigationController popViewControllerAnimated:YES];
        
    });
    
}

#pragma mark --- 导航栏右侧按钮点击方法 ---

- (void)rightBtnAction:(UIButton *)sender
{
    //由子类实现具体的方法
}

-(void)hiddenTabBar{

    [[LFTabBarController shareTabbar] hiddenTabBar];

}
-(void)showTabBar{

    [[LFTabBarController shareTabbar] showTabBar];
}


@end
