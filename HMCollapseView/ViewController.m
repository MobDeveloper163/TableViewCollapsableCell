//
//  ViewController.m
//  HMCollapseView
//
//  Created by 袁统 on 2016/10/30.
//  Copyright © 2016年 Ryan. All rights reserved.
//

#import "ViewController.h"
#import "HMGoodsCell.h"
#import "HMGoods.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, copy)NSArray<HMGoods *> *totalGoods;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 128;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

// 模拟数据
-(NSArray<HMGoods *> *)totalGoods{
    
    if(!_totalGoods){
        
        NSMutableArray *totalGoods = [NSMutableArray arrayWithCapacity:30];
        NSMutableArray <NSString *> *activities = nil;
        
        for(int i = 0; i< 30; i++){
            
            HMGoods *goods = [[HMGoods alloc] init];
            int numberOfActivities = arc4random_uniform(4) + 3;
            activities = [NSMutableArray arrayWithCapacity:numberOfActivities];
            
            for(int j = 0; j < numberOfActivities; j++){
                [activities addObject:[NSString stringWithFormat:@"第%d个活动", i]];
            }
            
            goods.activities = activities;
            goods.img = [NSString stringWithFormat:@"%d.jpg", arc4random_uniform(4) + 1];
            [totalGoods addObject:goods];
        }
        
        _totalGoods = totalGoods;
    }
    
    return _totalGoods;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.totalGoods.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HMGoodsCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:@"collapseCellID"];
    goodsCell.goods = self.totalGoods[indexPath.row];
    goodsCell.backgroundColor = RY_RANDOM_COLOR;
    
    // 点击的时候更新当前的Cell
    goodsCell.didCollapseCellClicked = ^(UITableViewCell *cell){
      
        NSIndexPath *indexPath = [tableView indexPathForCell:cell];
        
        if(indexPath){
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
    };
    
    return goodsCell;
}

// 根据cell内部的TableView的行数以及自身高度。计算cell自身的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    HMGoods *goods = self.totalGoods[indexPath.row];
    NSInteger numberOfRowsToShow = 2; // cell在关闭状态，显示两行
    
    if(goods.isOpened){  // cell在打开状态，显示所有的cell
        numberOfRowsToShow = goods.activities.count;
    }
    
    // 根据显示的行数，计算cell的总高度
    return 16 + 60 + 8 + numberOfRowsToShow * ACTIVITY_CELL_HEIGHT;
}


@end
