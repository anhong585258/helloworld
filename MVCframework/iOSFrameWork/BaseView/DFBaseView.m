//
//  BaseView.m
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "DFBaseView.h"

@implementation DFBaseView

+ (instancetype)view:(CGRect)frame{
    id instance = [[self alloc] initWithFrame:frame];
    [instance initProperties];
    [instance initView];
    return instance;
}
+ (instancetype)view:(CGRect)frame withTitle:(NSString *)title{
    id instance = [[self alloc] initWithFrame:frame];
    [instance initProperties];
    [instance initView:title];
    return instance;
}

+ (instancetype)view:(CGRect)frame style:(UITableViewStyle)style{
    id instance = [[self alloc] initWithFrame:frame style:style];
    [instance initProperties];
    [instance initView];
    return instance;

}
-(void)initProperties{
    
}
-(void)initView:(NSString *)title{
    
}
-(void)initView{
    
}



- (void)updateView:(id)datas{
    
    
}
- (void)initConfig{
    
}
- (void)setDelegate:(id<UIViewCollectEventsDelegate>)delegate{
    _delegate = delegate;
    [self initConfig];
}

#pragma mark - UIViewCollectEventsDelegate
-(void)uiView:(UIView*)uiView collectEventsType:(id)type params:(id)params{
    
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(uiView:collectEventsType:params:)]) {
            [self.delegate uiView:uiView collectEventsType:type params:params];
        }
    }
}
-(void)tempclickRefresh
{
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(uiView:clickRefreshWithParams:)]) {
            [self.delegate uiView:self clickRefreshWithParams:nil];
        }
    }
}
- (void)creatNONetWorkView{
    
}
- (void)removeNONetWorkView{
    
}
@end
