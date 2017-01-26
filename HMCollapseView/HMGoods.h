//
//  HMActivity.h
//  HMCollapseView
//
//  Created by 袁统 on 2016/10/30.
//  Copyright © 2016年 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMGoods : NSObject

@property(nonatomic, copy) NSString *img;

//  所有的活动
@property(nonatomic, copy)NSArray<NSString *> *activities;

@property(nonatomic, assign, getter=isOpened) BOOL opened;

@property(nonatomic, assign) BOOL isClicked;

@end
