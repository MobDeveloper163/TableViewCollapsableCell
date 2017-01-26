void (^didCollapCellClicked2)(int, int) = ^(int name, int age){
    
};//
//  HMGoodsCell.m
//  HMCollapseView
//
//  Created by 袁统 on 2016/10/30.
//  Copyright © 2016年 Ryan. All rights reserved.
//


#import "HMGoodsCell.h"
#import "HMGoods.h"

@interface HMGoodsCell ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UITableView *activityContainerView;
@property(nonatomic, weak)UIView *lastView;

@end

@implementation HMGoodsCell

-(void)awakeFromNib{
    [super awakeFromNib];
    self.activityContainerView.bounces = NO;
    self.activityContainerView.showsVerticalScrollIndicator = NO;
    self.activityContainerView.rowHeight = ACTIVITY_CELL_HEIGHT;
    self.activityContainerView.dataSource = self;
    self.activityContainerView.delegate = self;
    self.activityContainerView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)setGoods:(HMGoods *)goods{
    
    _goods = goods;
    
    self.iconView.image = [UIImage imageNamed:goods.img];
    
    if(goods.isClicked){
        
        [self.activityContainerView reloadData];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    // 假如是打开状态，返回所有的行数
    if(self.goods.isOpened){
        
        return self.goods.activities.count;
    }
    
    // 如果是关闭状态，只返回两行
    return 2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    UIView *bgView = [[UIView alloc] init];
    [cell setSelectedBackgroundView:bgView];
    cell.backgroundColor = RY_RANDOM_COLOR;
    return cell;
}

// 当点击cell的时候，重置打开和关闭状态，并刷新活动数据
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.goods.opened = !self.goods.isOpened;
    self.goods.isClicked = YES;
    self.didCollapseCellClicked(self);
}

@end
