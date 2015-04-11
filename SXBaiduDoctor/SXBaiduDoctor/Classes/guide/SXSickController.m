//
//  SXSickController.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/10.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXSickController.h"
#import "SXSickKindCell.h"
#import "SXSickDetailCell.h"

@interface SXSickController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewLeft;
@property (weak, nonatomic) IBOutlet UITableView *tableViewRight;

@property(nonatomic,strong) NSIndexPath *indexPath;

@property(nonatomic,strong) NSArray *allList;

@end

@implementation SXSickController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Woman.plist" ofType:nil];
    NSArray *allList = [NSArray arrayWithContentsOfFile:path];
    self.allList = allList;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableViewLeft.showsVerticalScrollIndicator = NO;
    self.tableViewRight.showsVerticalScrollIndicator = NO;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSIndexPath *bottomIndexPath = [NSIndexPath indexPathForRow:self.allList.count - 1 inSection:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.selIndex inSection:0];
    self.indexPath = indexPath;
    
    if (self.selIndex > 12) {
        [self.tableViewLeft scrollToRowAtIndexPath:bottomIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
    
    [self.tableViewLeft selectRowAtIndexPath:self.indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    NSLog(@"%ld",[self.tableViewLeft indexPathForSelectedRow].row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableViewLeft) {
        return self.allList.count;
    }else{
        NSInteger leftSelected = [self.tableViewLeft indexPathForSelectedRow].row;
        NSArray *array = self.allList[leftSelected][@"arr"];
        return array.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableViewLeft) {
        SXSickKindCell *cell = [SXSickKindCell kindCellWithTbv:tableView];
        NSDictionary *sickDict = self.allList[indexPath.row];
        cell.name = sickDict[@"first"];
        
        return cell;
    }else{
        SXSickDetailCell *cell = [SXSickDetailCell detailCellWithTbv:tableView];
        NSInteger leftSelected = [self.tableViewLeft indexPathForSelectedRow].row;
        NSDictionary *temDict = self.allList[leftSelected][@"arr"][indexPath.row];
        cell.name = temDict[@"second"];
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
        NSInteger leftSelectedRow = [self.tableViewLeft indexPathForSelectedRow].row;
        NSLog(@"左边第%ld行，右边第%ld行",leftSelectedRow,indexPath.row);
    }
}

@end
