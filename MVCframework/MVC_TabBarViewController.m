//
//  MVC_TabBarViewController.m
//  MVCframework
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "MVC_TabBarViewController.h"
#import "MVC_HomeViewController.h"
#import "MVC_ActiveViewController.h"
#import "MVC_MyViewController.h"

@interface MVC_TabBarViewController ()

@end

@implementation MVC_TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MVC_HomeViewController *HomeVC = [[MVC_HomeViewController alloc] init];
    [self createVC:HomeVC Title:@"首页" imageName:@"Tabbar_Home_N" selectedName:@"Tabbar_Home_S"];
    
    MVC_ActiveViewController *ActiveVC = [[MVC_ActiveViewController alloc] init];
    [self createVC:ActiveVC Title:@"活动" imageName:@"Tabbar_Activity_N" selectedName:@"Tabbar_Activity_S"];
    
    MVC_MyViewController *MineVC = [[MVC_MyViewController alloc] init];
    [self createVC:MineVC Title:@"我的" imageName:@"Tabbar_Mine_N" selectedName:@"Tabbar_Mine_S"];
}
- (void)createVC:(UIViewController *)vc Title:(NSString *)title imageName:(NSString *)imageName selectedName:(NSString *)imageSelect
{
    vc.title = title;
    self.tabBar.tintColor = [UIColor redColor];
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:imageSelect] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:[[UINavigationController alloc]initWithRootViewController:vc]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
