//
//  BaseService.h
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "MJExtension.h"
typedef void (^ServiceBlock)(NSInteger code,NSString *msg,id datas,NSError *error);

@interface DFBaseService : NSObject

@property (copy)ServiceBlock serviceBlock;
@property (strong)AFHTTPSessionManager *manager;
+(void)cancelAllOperations;
+(instancetype)service;
-(void)initProperties;
-(void)executeServiceBlockSuccessCode:(NSInteger)code Msg:(NSString *)msg Datas:(id)datas Failture:(NSError *)error;
-(void)cache_data:(id)data;
@end
