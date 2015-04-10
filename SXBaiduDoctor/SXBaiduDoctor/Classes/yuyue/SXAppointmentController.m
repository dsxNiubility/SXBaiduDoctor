//
//  SXAppointmentController.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXAppointmentController.h"

#define SXRoomChangeNotification @"SXRoomChangeNotification"

@interface SXAppointmentController ()
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) IBOutlet UIButton *roomBtn;
@property (weak, nonatomic) IBOutlet UIButton *choiceBtn;

@end

@implementation SXAppointmentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
    self.centerView.layer.cornerRadius = 20;
//    self.centerView.layer.masksToBounds = YES;
    self.centerView.clipsToBounds = YES;
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeWithInfo:) name:SXRoomChangeNotification object:nil];
}

- (void)changeWithInfo:(NSNotification *)no
{
    [self.roomBtn setTitle:no.userInfo[@"name"] forState:UIControlStateNormal];
    [self.roomBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.choiceBtn.enabled = YES;
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
