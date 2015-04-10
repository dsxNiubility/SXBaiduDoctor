//
//  SXSickDetailCell.h
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/10.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXSickDetailCell : UITableViewCell
@property(nonatomic,copy) NSString *name;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;

+ (instancetype)detailCellWithTbv:(UITableView *)tableView;

@end
