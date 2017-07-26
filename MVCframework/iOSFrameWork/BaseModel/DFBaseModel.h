//
//  BaseModel.h
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *LOADING = @"loading_status";

typedef void (^SuccessBlock)(NSInteger code,NSString *msg,id datas);

@protocol ModelCollectionDatasDelegate <NSObject>

@optional
- (void)modelCollectionDatasType:(id)type Success:(NSInteger)code Msg:(NSString *)msg Datas:(id)datas failture:(NSError *)error;

@end

@interface DFBaseModel : NSObject

@property (nonatomic,assign)id<ModelCollectionDatasDelegate>delegate;

+(instancetype)model;
-(void)initProperties;
-(void)initConfig;
-(void)modelCollectionDatasType:(id)type Success:(NSInteger)code Msg:(NSString *)msg Datas:(id)datas failture:(NSError *)error;
-(void)clickRefresh;
-(BOOL)hasCached;
-(id)get_cache_data:(id)confition;
-(void)showLoading;
-(void)cancelAllOperations;
@end
