//
//  BaseController.h
//  BuildingMaterials
//
//  Created by 龙丰 on 16/3/24.
//  Copyright © 2016年 longfeng.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController

@property(nonatomic,weak)UIButton* leftBut;
@property(nonatomic,weak)UIButton* rightBut;
@property(nonatomic,weak)UILabel* titleLael;


- (void)leftBtnAction:(UIButton *)sender;
- (void)rightBtnAction:(UIButton *)sender;
-(void)hiddenTabBar;
-(void)showTabBar;
@end
