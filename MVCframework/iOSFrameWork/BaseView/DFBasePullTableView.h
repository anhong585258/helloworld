//
//  BasePullTableView.h
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "DFBaseTableView.h"
#import "MJRefresh.h"
static NSString * PULL_DOWN = @"下拉刷新";
static NSString * PULL_UP = @"上拉加载";
@interface DFBasePullTableView : DFBaseTableView

@property (nonatomic,copy)NSString * _id;

- (void)pullDownRefresh;
- (void)pullUpLoad;
@end
