//
//  MVC_ActiveViewController.m
//  MVCframework
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "MVC_ActiveViewController.h"
#import "MVC_ActiveModel.h"
#import "MVC_ActiveView.h"

@interface MVC_ActiveViewController ()

@end

@implementation MVC_ActiveViewController

- (void)initViewModel
{
    self.root_view = [MVC_ActiveView view:self.view.frame];
    self.root_model = [MVC_ActiveModel model];

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
