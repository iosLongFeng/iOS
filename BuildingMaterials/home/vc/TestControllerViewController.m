//
//  TestControllerViewController.m
//  BuildingMaterials
//
//  Created by 龙丰 on 16/3/24.
//  Copyright © 2016年 longfeng.com. All rights reserved.
//

#import "TestControllerViewController.h"

@interface TestControllerViewController ()

@end

@implementation TestControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLael.text = self.title;
}

-(void)leftBtnAction:(UIButton *)sender{
    
    [self showTabBar];
    [super leftBtnAction:sender];
}

@end
