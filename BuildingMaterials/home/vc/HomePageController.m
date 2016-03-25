//
//  HomePageController.m
//  BuildingMaterials
//
//  Created by 龙丰 on 16/3/24.
//  Copyright © 2016年 longfeng.com. All rights reserved.
//

#import "HomePageController.h"
#import "ImagePlayerView.h"
#import "TestControllerViewController.h"
@interface HomePageController ()<ImagePlayerViewDelegate>
@property(weak,nonatomic)ImagePlayerView* headImagePlayView;
@property(strong,nonatomic)NSArray* iconArr;
@property(strong,nonatomic)NSArray* adArr;

@end

@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLael.text = @"首页";
    self.leftBut.hidden = YES;
    [self creatHeadView];
    [self creatMidView];
    [self createBottomView];
    
    _adArr = @[@"ad1.jpg",@"ad2.jpg",@"ad3.jpg"];
}





-(void)creatHeadView{

    
    ImagePlayerView* headImagePlayView = [[ImagePlayerView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height*0.28)];
    headImagePlayView.imagePlayerViewDelegate = self;
    headImagePlayView.userInteractionEnabled = YES;
    headImagePlayView.scrollInterval = 3.0;
    headImagePlayView.pageControlPosition = ICPageControlPosition_BottomCenter;
    
    headImagePlayView.hidePageControl = NO;
    headImagePlayView.backgroundColor = [UIColor redColor];
    [self.view addSubview:headImagePlayView];
    [headImagePlayView reloadData];
    
    self.headImagePlayView = headImagePlayView;


}

-(void)creatMidView{


    CGFloat iconWidth = 50;
    CGFloat iconHeigth = 50;
    CGFloat vSpace = 20;
    CGFloat hSpace = (screen_width - 70*4 - 20)/3;
    UIView* midView = [[UIView alloc] init];
    
    _iconArr = @[@"门窗",@"地板",@"灯具照明",@"管材管件",@"卫浴洁具",@"石材",@"厨房设施",@"更多",];

    for (int i = 0; i < _iconArr.count; i++) {
        
        int row=i/4;//行号
        //1/3=0,2/3=0,3/3=1;
        int loc=i%4;//列号
        
        
        UIView * iconView = [[UIView alloc] initWithFrame:CGRectMake(10+(70+hSpace)*loc, (vSpace+70)*row+5, 70, 70)];
        iconView.tag = i;
        
        UIImageView* imageView = [[UIImageView alloc] init];
        imageView.layer.cornerRadius = 2.0;
        imageView.layer.masksToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ca%d",i+1]];
        [iconView addSubview:imageView];
        UILabel* label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:12.0];
        label.text = _iconArr[i];
        [iconView addSubview:label];
        
        
        imageView.frame = CGRectMake(10, 0, iconWidth, iconHeigth);
        label.frame = CGRectMake(0, 55, 70, 15);
        
        [midView addSubview:iconView];
        
        
        UITapGestureRecognizer* tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
        [iconView addGestureRecognizer:tapGest];
        
        
    }


    midView.frame  = CGRectMake(0, screen_height*0.28+70, screen_width, 160);

    [self.view addSubview:midView];

}



-(void)createBottomView{

    UIView* bottomView = [[UIView alloc] init];
    CGFloat space = 2;
    CGFloat iconWidth = (screen_width-4*space)/3;
    for (int i = 0; i < 3; i++) {
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake((iconWidth+space)*i+space, 0,iconWidth, iconWidth*1.2)];
        imageView.userInteractionEnabled = YES;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ca%d",i+1]];
        [bottomView addSubview:imageView];
        
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoRecommend)];
        [imageView addGestureRecognizer:tap];
    }
    

    [bottomView setFrame:CGRectMake(0, screen_height*0.28+250, screen_width, screen_width/3*1.2)];
    [self.view addSubview:bottomView];

}

#pragma mark - tapAction

-(void)didTap:(UITapGestureRecognizer*)tapGest{
 
   
    NSInteger tag = tapGest.view.tag;
    
    TestControllerViewController* vc = [[TestControllerViewController alloc] init];
    vc.title = self.iconArr[tag];
    [vc hiddenTabBar];
    [self.navigationController pushViewController:vc animated:YES];
    
//    switch (tag) {
//        case 0:
//            
//            break;
//        case 1:
//            
//            break;
//        case 2:
//            
//            break;
//        case 3:
//            
//            break;
//        case 4:
//            
//            break;
//        case 5:
//            
//            break;
//        case 6:
//            
//            break;
//        case 7:
//            
//            break;
//        case 8:
//            
//            break;
//       
//    }

    

}


-(void)gotoRecommend{
 
    
    TestControllerViewController* vc = [[TestControllerViewController alloc] init];
    vc.title =  @"推荐建材";
    [vc hiddenTabBar];
    [self.navigationController pushViewController:vc animated:YES];


}

#pragma mark - ImagePlayerViewDelegate
- (NSInteger)numberOfItems
{
    return 3;
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
  
    
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ad%d.jpg",index+1]];
  
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    
    
    
    
}





@end
