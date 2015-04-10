//
//  SXSickDetailCell.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/10.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXSickDetailCell.h"

@implementation SXSickDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)detailCellWithTbv:(UITableView *)tableView
{
    static NSString* ID = @"SickDetailCell";
    SXSickDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

- (void)setName:(NSString *)name
{
    _name = name;
    self.nameLbl.text = name;
}
@end
