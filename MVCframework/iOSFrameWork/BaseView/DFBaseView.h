//
//  BaseView.h
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIViewCollectEventsDelegate<NSObject>
@required
@optional
-(void)uiView:(UIView*)uiView collectEventsType:(id)type params:(id)params;
-(void)uiView:(UIView*)uiview clickRefreshWithParams:(id)params;
@end
@interface DFBaseView : UIView

@property (nonatomic,assign) id <UIViewCollectEventsDelegate> delegate;

-(void)initConfig;
-(void)initView:(NSString *)title;
-(void)initView;
+ (instancetype)view:(CGRect)frame;
+ (instancetype)view:(CGRect)frame withTitle:(NSString *)title;
+ (instancetype)view:(CGRect)frame style:(UITableViewStyle)style;
- (void)initProperties;

- (void)updateView:(id)datas;
- (void)creatNONetWorkView;
- (void)removeNONetWorkView;
//delegate method
- (void)uiView:(UIView*)uiView collectEventsType:(id)type params:(id)params;
@end
