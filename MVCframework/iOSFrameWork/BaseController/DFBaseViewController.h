//
//  BaseViewController.h
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DFBaseView.h"
#import "DFBaseModel.h"
#import "DFBaseView+HUD.h"

@interface DFBaseViewController : UIViewController<ModelCollectionDatasDelegate,UIViewCollectEventsDelegate>

@property (nonatomic,strong)NSMutableArray *expodIDs;//实时保存支付成功的展览id，用户存放展览id
@property (nonatomic,strong)DFBaseView *root_view;
@property (nonatomic,strong)DFBaseModel *root_model;
@property (nonatomic,strong)id params;
- (instancetype)init;
- (void)initViewModel;
- (void)initConfig;
- (void)modelCollectionDatasType:(id)type Datas:(id)datas;
-(void)clickRefresh;

@end
