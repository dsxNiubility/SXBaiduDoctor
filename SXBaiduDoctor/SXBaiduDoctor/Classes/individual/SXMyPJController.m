//
//  SXMyPJController.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/10.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXMyPJController.h"
#import "UIView+Frame.h"

@interface SXMyPJController ()
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIView *sliderView;

@end

@implementation SXMyPJController
- (IBAction)leftBtnClick:(id)sender {
    self.leftBtn.selected = YES;
    self.rightBtn.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.sliderView.x = self.leftBtn.x + (self.leftBtn.width - self.sliderView.width)/2.0;
    }];
}
- (IBAction)rightBtnClick:(id)sender {
    self.rightBtn.selected = YES;
    self.leftBtn.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.sliderView.x = self.rightBtn.x + (self.leftBtn.width - self.sliderView.width)/2.0;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
