//
//  SXTbvHeaderView.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXTbvHeaderView.h"

@implementation SXTbvHeaderView

+ (instancetype)headerView{
    
    return [[NSBundle mainBundle]loadNibNamed:@"SXTbvHeaderView" owner:nil options:nil][0];
}

@end
