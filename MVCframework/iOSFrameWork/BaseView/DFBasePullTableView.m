//
//  BasePullTableView.m
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "DFBasePullTableView.h"

@implementation DFBasePullTableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self pullDownRefresh];
        [self pullUpLoad];
    }
    return self;
}
#pragma mark - UITableViewPullRefresh
- (void)pullDownRefresh
{
    __weak DFBasePullTableView *weakSelf = self;
//    [self.tableView addHeaderWithCallback:^{
//        [weakSelf uiView:nil collectEventsType:PULL_DOWN params:weakSelf._id];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [weakSelf.tableView reloadData];
//            [weakSelf.tableView headerEndRefreshing];
//        });
//    }];
    //    [self.tableView headerBeginRefreshing];
}
- (void)pullUpLoad
{
    __weak DFBasePullTableView *weakSelf = self;
//    [self.tableView addFooterWithCallback:^{
//        [weakSelf uiView:nil collectEventsType:PULL_UP params:weakSelf._id];
//        // 2.2秒后刷新表格UI
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 刷新表格
//            [weakSelf.tableView reloadData];
//            
//            // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
//            [weakSelf.tableView footerEndRefreshing];
//        });
//        
//    }];
}

@end
