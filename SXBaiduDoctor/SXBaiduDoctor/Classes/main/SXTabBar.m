//
//  SXTabBar.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXTabBar.h"
#import "SXBarButton.h"
#import "UIView+Frame.h"

@interface SXTabBar ()

@property(nonatomic,strong) SXBarButton *selButton;
@property(nonatomic,strong) UIImageView *imgView;

@end
@implementation SXTabBar

- (void)addImageView
{
    self.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.image = [UIImage imageNamed:@"index_footer_current_bg_middle"];
    self.imgView = imgView;
    [self addSubview:imgView];
}

#pragma mark - /************************* 通过传入数据赋值图片 ***************************/
- (void)addBarButtonWithNorName:(NSString *)nor andDisName:(NSString *)dis andTitle:(NSString *)title
{
    SXBarButton *btn = [[SXBarButton alloc]init];
    
    [btn setImage:[UIImage imageNamed:nor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:dis] forState:UIControlStateDisabled];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:149/255.0 green:149/255.0 blue:149/255.0 alpha:1] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:71/255.0 green:168/255.0 blue:222/255.0 alpha:1] forState:UIControlStateDisabled];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    
    // 让第一个按钮默认为选中状态
    if (self.subviews.count == 3) {
        btn.tag = 1;
        [self btnClick:btn];
    }
}


#pragma mark - /************************* 动态加载时设置frame值 ***************************/
- (void)layoutSubviews
{
    UIImageView *imgView = self.subviews[0];
    imgView.frame = self.bounds;
    
    for (int i = 1; i<self.subviews.count; i++) { // $$$$$
        
        UIButton *btn = self.subviews[i];
        
        //        CGFloat btnW = self.frame.size.width/self.subviews.count;
        //        CGFloat btnH = self.frame.size.height;
        CGFloat btnW = 375/3;
        CGFloat btnH = 49;
        CGFloat btnX = (i-1) * btnW;
        CGFloat btnY = 0;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 绑定tag 便于后面使用
        btn.tag = i-1;
    }
}

#pragma mark - /************************* 按钮点下方法 ***************************/
- (void)btnClick:(SXBarButton *)btn
{
    switch (btn.tag) {
        case 0:
            self.imgView.image = [UIImage imageNamed:@"index_footer_current_bg_left"];
            break;
        case 1:
            self.imgView.image = [UIImage imageNamed:@"index_footer_current_bg_middle"];
            break;
        case 2:
            self.imgView.image = [UIImage imageNamed:@"index_footer_current_bg_right"];
            break;
            
        default:
            break;
    }
    
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
