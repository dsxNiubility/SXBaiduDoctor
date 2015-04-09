//
//  SXMainTabBarController.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXMainTabBarController.h"
#import "SXBarButton.h"
#import "SXTabBar.h"

@interface SXMainTabBarController ()<SXTabBarDelegate>

@end

@implementation SXMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SXTabBar *tabBar = [[SXTabBar alloc]init];
    tabBar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:tabBar];
    
//    [self.tabBar setShadowImage:[UIImage imageNamed:@"shawdo"]];
    self.tabBar.backgroundImage = [UIImage imageNamed:@"shawdo"];
    tabBar.delegate = self;
    
    [tabBar addImageView];
    
    [tabBar addBarButtonWithNorName:@"menu_guide_default" andDisName:@"menu_guide_current" andTitle:@"智能导诊"];
    [tabBar addBarButtonWithNorName:@"menu_yuyue_default" andDisName:@"menu_yuyue_current" andTitle:@"预约医生"];
    [tabBar addBarButtonWithNorName:@"menu_individual_default" andDisName:@"menu_individual_current" andTitle:@"个人中心"];
}

#pragma mark - ******************** SXTabBarDelegate代理方法
- (void)ChangSelIndexForm:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

@end
