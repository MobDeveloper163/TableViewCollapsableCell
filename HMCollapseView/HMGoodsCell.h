//
//  HMGoodsCell.h
//  HMCollapseView
//
//  Created by 袁统 on 2016/10/30.
//  Copyright © 2016年 Ryan. All rights reserved.
//

#define ACTIVITY_CELL_HEIGHT 25

#define RY_RANDOM_COLOR [UIColor colorWithRed: (50 + arc4random_uniform(150)) / 256.0 green:(50 + arc4random_uniform(150)) / 256.0 blue:(50 + arc4random_uniform(150)) / 256.0 alpha:1]

#include <UIKit/UIKit.h>

typedef void (^DidCollapCellClicked)(UITableViewCell *);

@class HMGoods;
@interface HMGoodsCell : UITableViewCell

@property(nonatomic, strong) HMGoods *goods;

@property(nonatomic, copy) DidCollapCellClicked didCollapseCellClicked;

@end
