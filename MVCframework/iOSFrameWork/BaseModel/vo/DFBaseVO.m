//
//  BaseVO.m
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "DFBaseVO.h"

@implementation DFBaseVO
+(instancetype)vo
{
    id instance = [self alloc];
    [instance initProperties];
    return instance;
}
-(void)initProperties
{
    
}
@end
