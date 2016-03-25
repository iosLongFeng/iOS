//
//  LFTabBar.m
//  基本框架
//
//  Created by 龙丰 on 15/10/17.
//  Copyright (c) 2015年 longfeng.com. All rights reserved.
//

#import "LFTabBar.h"
#import "LFTabBarButton.h"

@interface LFTabBar()

@property (nonatomic, weak) UIButton *selectedButton;

@end


@implementation LFTabBar



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
      self.image = [self buttonImageFromColor:[UIColor lightGrayColor]];
       
        
    }
    return self;
}

// 提供一个方法给外界添加按钮
- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName
{
    // 创建按钮
  LFTabBarButton *btn = [LFTabBarButton buttonWithType:UIButtonTypeCustom];
//    
//    
//    // 设置按钮的图片
//    [btn setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
//    
//    [btn setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
//    
//    // 监听按钮的点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [btn  setTitle:name forState:UIControlStateNormal];
    [btn  setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:btn];
    
}


// 点击按钮的时候调用
- (void)btnClick:(UIButton *)button
{
    // 取消之前选择按钮
    _selectedButton.selected = NO;
    // 选中当前按钮
    button.selected = YES;
    // 记录当前选中按钮
    _selectedButton = button;
    
    // 切换控制器
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectedIndex:)]) {
        
        [_delegate tabBar:self didSelectedIndex:(int)button.tag];
    }
    
}

#pragma mark - 设置按钮的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    // 设置按钮的尺寸
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        
        // 绑定角标
        btn.tag = i;
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 默认选中第一个按钮
        if (i == 0) {
            [self btnClick:btn];
        }
    }
    

}

- (UIImage *)buttonImageFromColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return img;
}


@end
