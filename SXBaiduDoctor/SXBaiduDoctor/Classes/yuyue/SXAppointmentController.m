//
//  SXAppointmentController.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXAppointmentController.h"

@interface SXAppointmentController ()
@property (weak, nonatomic) IBOutlet UIView *centerView;

@end

@implementation SXAppointmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    self.centerView.layer.cornerRadius = 20;
//    self.centerView.layer.masksToBounds = YES;
    self.centerView.clipsToBounds = YES;
}


- (IBAction)choceRoom:(id)sender {
    NSLog(@"选择科室");
}

- (IBAction)choceArea:(id)sender {
    NSLog(@"选择位置");
}

- (IBAction)choceDoctor:(id)sender {
    NSLog(@"选择医生");
}

- (IBAction)search:(id)sender {
    NSLog(@"搜索");
}


@end
