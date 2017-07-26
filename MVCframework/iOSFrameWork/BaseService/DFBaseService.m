//
//  BaseService.m
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "DFBaseService.h"

@implementation DFBaseService

+(instancetype)service{
    id instance = [[self alloc] init];
    [instance initProperties];
    return instance;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}
+(void)cancelAllOperations{
    [[AFHTTPSessionManager manager].operationQueue cancelAllOperations];
}
-(void)initProperties{
    
}
-(void)executeServiceBlockSuccessCode:(NSInteger)code Msg:(NSString *)msg Datas:(id)datas Failture:(NSError *)error{
    if (self.serviceBlock) {
        self.serviceBlock(code,msg,datas,error);
    }
}
-(void)cache_data:(id)data{
    
}


@end
