//
//  SXGuideController.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXGuideController.h"
#import "UIView+Frame.h"

@interface SXGuideController ()
@property (weak, nonatomic) IBOutlet UIImageView *bodyimgView;
@property (weak, nonatomic) IBOutlet UIButton *manBtn;
@property (weak, nonatomic) IBOutlet UIButton *womanBtn;
@property (weak, nonatomic) IBOutlet UIButton *childBtn;
@property (weak, nonatomic) IBOutlet UIView *switchView;

@end

@implementation SXGuideController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchBtnClick:(id)sender {
    if (self.switchView.x < 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.switchView.x += 32;
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.switchView.x -= 32;
        }];
    }

}



@end
