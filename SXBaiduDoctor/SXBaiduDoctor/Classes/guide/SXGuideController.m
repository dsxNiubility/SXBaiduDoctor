//
//  SXGuideController.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/9.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXGuideController.h"
#import "SXSexButton.h"
#import "UIView+Frame.h"

@interface SXGuideController ()
@property (weak, nonatomic) IBOutlet UIImageView *bodyimgView;
@property (weak, nonatomic) IBOutlet SXSexButton *manBtn;
@property (weak, nonatomic) IBOutlet SXSexButton *womanBtn;
@property (weak, nonatomic) IBOutlet SXSexButton *childBtn;
@property (weak, nonatomic) IBOutlet UIButton *otherSickBtn;
@property (weak, nonatomic) IBOutlet UIButton *headBackBtn;

@property (weak, nonatomic) IBOutlet UIView *bigSwitchView;

@property (weak, nonatomic) IBOutlet UIView *switchView;
@property (weak, nonatomic) IBOutlet UIView *manFront;
@property (weak, nonatomic) IBOutlet UIView *womanFront;
@property (weak, nonatomic) IBOutlet UIView *womenBack;
@property (weak, nonatomic) IBOutlet UIView *manBack;
@property (weak, nonatomic) IBOutlet UIView *childBack;
@property (weak, nonatomic) IBOutlet UIView *childFront;
@property (weak, nonatomic) IBOutlet UIView *womanFace;

@property(nonatomic,strong) UIButton *selButton;
@property(nonatomic,strong) UIView *selView;

@end

@implementation SXGuideController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self sexClick:self.manBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchBtnClick:(id)sender {
    
    if (self.switchView.x < 0) {
        [UIView animateWithDuration:0.3 animations:^{
            self.switchView.x += 32;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.switchView.x -= 32;
        }];
    }
    [self checkCenterView];

}

- (IBAction)sexClick:(UIButton *)sender {
    
    self.selButton.selected = NO;
    self.selButton = sender;
    self.selButton.selected = YES;
    [self checkCenterView];
}

- (void)checkCenterView
{
    switch (self.selButton.tag) {
        case 10:
            if (self.switchView.x < 0) {
                self.selView.hidden = YES;
                self.manBack.hidden = NO;
                self.selView = self.manBack;
            }else{
                self.selView.hidden = YES;
                self.manFront.hidden = NO;
                self.selView = self.manFront;
            }
            break;
        case 20:
            if (self.switchView.x < 0) {
                self.selView.hidden = YES;
                self.womenBack.hidden = NO;
                self.selView = self.womenBack;
            }else{
                self.selView.hidden = YES;
                self.womanFront.hidden = NO;
                self.selView = self.womanFront;
            }
            break;
        case 30:
            if (self.switchView.x < 0) {
                self.selView.hidden = YES;
                self.childBack.hidden = NO;
                self.selView = self.childBack;
            }else{
                self.selView.hidden = YES;
                self.childFront.hidden = NO;
                self.selView = self.childFront;
            }
            break;
            
        default:
            break;
    }
}
- (IBAction)Head:(UIButton *)sender {
    
    self.manBtn.hidden = YES;
    self.womanBtn.hidden = YES;
    self.childBtn.hidden = YES;
    self.bigSwitchView.hidden = YES;
    self.otherSickBtn.hidden = YES;
    
    self.headBackBtn.hidden = NO;
    
    self.selView.hidden = YES;
    self.selView = self.womanFace;
    self.selView.hidden = NO;
    
    
}

- (IBAction)headBack:(UIButton *)sender {
    
    [self checkCenterView];
    self.manBtn.hidden = NO;
    self.womanBtn.hidden = NO;
    self.childBtn.hidden = NO;
    self.bigSwitchView.hidden = NO;
    self.otherSickBtn.hidden = NO;
    
    self.headBackBtn.hidden = YES;
}

- (IBAction)listBtnClick:(UIButton *)sender {
    NSLog(@"跳转列表");
}

@end
