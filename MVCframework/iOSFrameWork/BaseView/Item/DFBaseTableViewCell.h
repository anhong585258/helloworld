//
//  BaseTableViewCell.h
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFBaseView.h"
@interface DFBaseTableViewCell : UITableViewCell

@property (nonatomic,strong) id vo;
@property (nonatomic,assign) id<UIViewCollectEventsDelegate>delegate;
//当存在动态地布局的时候updateView 有时候会重新addSubviews:会导致内存泄露，固存在动态添加新的布局的时候清空布局再创建
- (void)clearCellContentView;
- (void)clearCellView;
- (void)initView;
- (void)setCellVO:(id)vo;
- (void)uiView:(UIView*)uiView collectEventsType:(id)type params:(id)params;

@end
