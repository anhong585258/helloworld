//
//  BasePullDownAndUpLoadModel.h
//  Unity-iPhone
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//
//

#import "DFBaseModel.h"

@interface BasePullDownAndUpLoadModel : DFBaseModel
@property (nonatomic ,assign) int page;
@property (nonatomic,assign)BOOL has_more_datas;
@property (nonatomic,assign)NSInteger max_count;
@property (nonatomic,strong)id listDatasCache;//用于缓存临时数据
@property (nonatomic,retain)NSMutableArray *dataArray;
/**
 *  上拉加载更多数据
 */
- (void)pullUpLoad;
/**
 *  下拉刷新数据
 */
- (void)pullDownRefresh;

- (void)reqestPullUpLoad:(id)params;
- (void)requestPullDownRefresh:(id)params;

- (void)saveListArrayType:(id)type withDatas:(id)datas;

- (NSArray *)getVOListArrayWith:(id)params;




@end
