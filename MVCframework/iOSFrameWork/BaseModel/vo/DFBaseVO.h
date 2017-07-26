//
//  BaseVO.h
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFBaseVO : NSObject
@property (nonatomic,assign)long id;
- (void)initProperties;
+(instancetype)vo;
@end
