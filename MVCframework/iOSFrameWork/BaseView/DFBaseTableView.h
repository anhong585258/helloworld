//
//  BaseTableView.h
//  MyAppDemo
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFBaseView.h"
@interface DFBaseTableView : DFBaseView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray * datas;
@property (nonatomic,strong) UITableView * tableView;
@end
