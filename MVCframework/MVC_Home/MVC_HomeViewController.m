//
//  MVC_HomeViewController.m
//  MVCframework
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "MVC_HomeViewController.h"
#import "MVC_HomeView.h"
#import "MVC_HomeModel.h"

@interface MVC_HomeViewController ()

@end

@implementation MVC_HomeViewController

- (void)initViewModel
{
    self.root_view = [MVC_HomeView view:self.view.frame];
    self.root_model = [MVC_HomeModel model];

}
- (void)initConfig
{
    
}
- (void)modelCollectionDatasType:(id)type Datas:(id)datas
{
    
}
- (void)uiView:(UIView *)uiview clickRefreshWithParams:(id)params
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
