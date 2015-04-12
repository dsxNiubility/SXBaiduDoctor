//
//  SXRoomController.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/10.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXRoomController.h"
#import "SXSickKindCell.h"
#import "SXSickDetailCell.h"
#import "SXAppointmentController.h"

#define SXRoomChangeNotification @"SXRoomChangeNotification"

@interface SXRoomController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewLeft;
@property (weak, nonatomic) IBOutlet UITableView *tableViewRight;

@property(nonatomic,strong) NSIndexPath *indexPath;

@property(nonatomic,strong) NSArray *allList;

@end

@implementation SXRoomController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *img = [UIImage imageNamed:@"nav.png"];
    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Department.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *allList = dict[@"data"];
    self.allList = allList;
    
    self.tableViewLeft.showsVerticalScrollIndicator = NO;
    self.tableViewRight.showsVerticalScrollIndicator = NO;
    
}

- (void)viewWillAppear:(BOOL)animated
{

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self.tableViewLeft selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableViewLeft) {
        return self.allList.count;
        
    }else{
        NSInteger leftSelected = [self.tableViewLeft indexPathForSelectedRow].row;
        NSArray *array = self.allList[leftSelected][@"children"];
        return array.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableViewLeft) {
        SXSickKindCell *cell = [SXSickKindCell kindCellWithTbv:tableView];
        NSDictionary *sickDict = self.allList[indexPath.row];
        
        cell.name = sickDict[@"name"];

        
        return cell;
    }else{
        SXSickDetailCell *cell = [SXSickDetailCell detailCellWithTbv:tableView];
        NSInteger leftSelected = [self.tableViewLeft indexPathForSelectedRow].row;
        NSDictionary *temDict = self.allList[leftSelected][@"children"][indexPath.row];
        cell.name = temDict[@"name"];
        return cell;
    }
}

#pragma mark - ******************** 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableViewLeft) { // 左边
        
        NSLog(@"左边第%ld行",indexPath.row);
        // 刷新右边
        [self.tableViewRight reloadData];
        
    } else { // 右边
        
        SXSickDetailCell *cell = (SXSickDetailCell *)[tableView cellForRowAtIndexPath:indexPath];
        [[NSNotificationCenter defaultCenter]postNotificationName:SXRoomChangeNotification object:nil userInfo:@{@"name":cell.nameLbl.text}];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
