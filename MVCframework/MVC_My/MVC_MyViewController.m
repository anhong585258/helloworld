//
//  MVC_MyViewController.m
//  MVCframework
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "MVC_MyViewController.h"
#import "MVC_MyView.h"
#import "MVC_MyModel.h"

@interface MVC_MyViewController ()

@end

@implementation MVC_MyViewController

- (void)initViewModel
{
    self.root_view = [MVC_MyView view:self.view.frame];
    self.root_model = [MVC_MyModel model];

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
