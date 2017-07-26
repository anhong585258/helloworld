//
//  BasePullDownAndUpLoadModel.m
//  Unity-iPhone
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//
//

#import "BasePullDownAndUpLoadModel.h"

@implementation BasePullDownAndUpLoadModel
- (void)initProperties{
    [super initProperties];
    self.listDatasCache = [NSMutableDictionary dictionary];
    self.page = 1;
    self.max_count = 10;
    self.has_more_datas = YES;
    self.dataArray = [NSMutableArray array];
}
/**
 *  上拉加载更多数据
 */
- (void)pullUpLoad{
    
}
/**
 *  下拉刷新数据
 */
- (void)pullDownRefresh{
    self.page = 1;
    [self.dataArray removeAllObjects];
}

- (void)reqestPullUpLoad:(id)params{
    
}
- (void)requestPullDownRefresh:(id)params{
    
}
- (void)saveListArrayType:(id)type withDatas:(id)datas{
    
}

- (NSArray *)getVOListArrayWith:(id)params{
    return nil;
}
@end
