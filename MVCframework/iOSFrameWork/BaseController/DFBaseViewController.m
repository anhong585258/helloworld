//
//  BaseViewController.m
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "DFBaseViewController.h"

@interface DFBaseViewController ()

@end

@implementation DFBaseViewController


- (void)viewDidLoad{
    [super viewDidLoad];    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.expodIDs = [NSMutableArray array];
    self.navigationController.navigationBarHidden = YES;

    [self initViewModel];
    [self config];
    [self initConfig];
}
- (instancetype)init{
    self = [super init];
    if (self) {
//        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
-(void)initViewModel{
    
}
- (void)initConfig{
    
}
- (void)config{
    if (self.root_model) {
        self.root_model.delegate = self;
    }
    if (self.root_view) {
        self.view = self.root_view;
        self.root_view.delegate = self;
    }
}

- (void)modelCollectionDatasType:(id)type Success:(NSInteger)code Msg:(NSString *)msg Datas:(id)datas failture:(NSError *)error{
   
    if ([type isEqualToString:LOADING]) {
//        showHUD
        [self.root_view showHudInView:self.root_view hint:@"加载中..."];
        [self.root_view showHudInView:self.root_view hint:@""];

        return;
    }
//    hideHUD
//    [self.root_view hideHud];
    if (error) {
        if (_root_model) {
            if (![_root_model hasCached]) {
//                showNoNetWork
            }else{
//                showHideNetWork
            }
            [self.root_view showHint:@"请检查网络"];
            [self.root_view showHint:NSLocalizedString(@"error.connectServerTimeout", @"") yOffset:200];
            [self.root_view creatNONetWorkView];
            return;
        }
    }
    
    if (code == YES) {
        [self.root_view removeNONetWorkView];
        [self modelCollectionDatasType:type Datas:datas];
    }else{
        [self.root_view showHint:msg];        
    }
    
 
}
-(void)modelCollectionDatasType:(id)type Datas:(id)datas{
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_root_model) {
        [_root_model cancelAllOperations];
        _root_model.delegate = nil;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (_root_model) {
        [_root_model cancelAllOperations];
        _root_model.delegate = self;
    }
}

-(void)clickRefresh{
    if (_root_model) {
        [_root_model clickRefresh];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)uiView:(UIView *)uiview clickRefreshWithParams:(id)params
{
    [self clickRefresh];
}
@end
