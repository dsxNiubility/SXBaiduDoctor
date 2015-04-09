//
//  SXMeController.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXMeController.h"
#import "SXTbvHeaderView.h"

@interface SXMeController ()

@end

@implementation SXMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    SXTbvHeaderView *tbvHeader = [SXTbvHeaderView headerView];
    self.tableView.tableHeaderView = tbvHeader;

}




@end
