//
//  SXTabBar.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXTabBar.h"
#import "SXBarButton.h"

@interface SXTabBar ()

@property(nonatomic,strong) SXBarButton *selButton;

@end
@implementation SXTabBar

#pragma mark - /************************* 通过传入数据赋值图片 ***************************/
- (void)addBarButtonWithNorName:(NSString *)nor andDisName:(NSString *)dis
{
    SXBarButton *btn = [[SXBarButton alloc]init];
    
    [btn setImage:[UIImage imageNamed:nor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:dis] forState:UIControlStateDisabled];
    
    
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    
    // 让第一个按钮默认为选中状态
    if (self.subviews.count == 1) {
        [self btnClick:btn];
    }
}

#pragma mark - /************************* 动态加载时设置frame值 ***************************/
- (void)layoutSubviews
{
    for (int i = 0; i<self.subviews.count; i++) { // $$$$$
        
        UIButton *btn = self.subviews[i];
        
        //        CGFloat btnW = self.frame.size.width/self.subviews.count;
        //        CGFloat btnH = self.frame.size.height;
        CGFloat btnW = 375/5;
        CGFloat btnH = 49;
        CGFloat btnX = i * btnW;
        CGFloat btnY = 0;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 绑定tag 便于后面使用
        btn.tag = i;
    }
}

#pragma mark - /************************* 按钮点下方法 ***************************/
- (void)btnClick:(SXBarButton *)btn
{
    // 响应代理方法 实现页面跳转
    if ([self.delegate respondsToSelector:@selector(ChangSelIndexForm:to:)]) {
        [self.delegate ChangSelIndexForm:_selButton.tag to:btn.tag];
    }
    
    // 设置按钮显示状态 并切换选中按钮
    _selButton.enabled = YES;
    _selButton = btn;
    btn.enabled = NO;
}


@end
