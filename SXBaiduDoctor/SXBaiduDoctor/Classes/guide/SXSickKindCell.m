//
//  SXSickKindCell.m
//  SXBaiduDoctor
//
//  Created by 董 尚先 on 15/4/10.
//  Copyright (c) 2015年 shangxianDante. All rights reserved.
//

#import "SXSickKindCell.h"


@implementation SXSickKindCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (instancetype)kindCellWithTbv:(UITableView *)tableView
{
    static NSString* ID = @"SickKindCell";
    SXSickKindCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    UIView *selView = [[UIView alloc]init];
    selView.frame = cell.bounds;
    selView.backgroundColor = [UIColor whiteColor];
    cell.selectedBackgroundView = selView;
    return cell;
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    // 取消高亮时的显示
}

- (void)setName:(NSString *)name
{
    _name = name;
    self.nameLbl.text = name;
}

@end
