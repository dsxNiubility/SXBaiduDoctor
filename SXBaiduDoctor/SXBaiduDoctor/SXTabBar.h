//
//  SXTabBar.h
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SXTabBarDelegate <NSObject>

@optional

- (void)ChangSelIndexForm:(NSInteger)from to:(NSInteger)to;

@end


@interface SXTabBar : UIView

@property (nonatomic,weak) id<SXTabBarDelegate> delegate;

- (void)addBarButtonWithNorName:(NSString *)nor andDisName:(NSString *)dis;

@end
