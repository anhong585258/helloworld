//
//  BaseModel.m
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "DFBaseModel.h"
#import "DFBaseService.h"
@implementation DFBaseModel

+(instancetype)model{
    id instance = [self alloc];
    [instance initProperties];
    return instance;
}
-(void)initProperties{
    
}

-(void)initConfig{
    
}
- (void)setDelegate:(id<ModelCollectionDatasDelegate>)delegate{
    _delegate = delegate;
    [self initConfig];
}
- (void)modelCollectionDatasType:(id)type Success:(NSInteger)code Msg:(NSString *)msg Datas:(id)datas failture:(NSError *)error{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(modelCollectionDatasType:Success:Msg:Datas:failture:)]) {
            [self.delegate modelCollectionDatasType:type Success:code Msg:msg Datas:datas failture:error];
        }
    }
}
-(void)cancelAllOperations{
    [DFBaseService cancelAllOperations];
}
-(void)clickRefresh{
    
}
-(id)get_cache_data:(id)confition{
    return nil;
}
-(BOOL)hasCached{
    return NO;
}
-(void)showLoading{
    [self modelCollectionDatasType:LOADING Success:0 Msg:nil Datas:nil failture:nil];
}
@end
