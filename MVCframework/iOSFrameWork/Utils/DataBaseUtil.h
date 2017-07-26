//
//  DataBaseUtil.h
//  IOS_HuaDian
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FMDatabase.h"
#import "BaseTable.h"

@class BaseTable;

@interface DataBaseUtil : NSObject
@property (strong,nonatomic)NSMutableDictionary * dic;
+(DataBaseUtil*)shareInstance;
-(void)createDataBase:(NSString*)db_name WithBlock:(void (^)())initTables;
-(void)createTableWithTableName:(Class)clazz;
-(id)insertTableName:(Class)clazz withConfition:(id)confition;
-(id)selectDatasWithTableName:(Class)clazz withConfition:(id)confition;
-(id)selectCategoryDatasWithTableName:(Class)clazz withConfition:(id)confition;
-(id)deleteDataTableName:(Class)clazz withConfition:(id)confition;
-(id)updateDataTableName:(Class)clazz withConfition:(id)confition;
-(void)clearDatabase;
-(BaseTable *)getTableWithClass:(Class)clazz;
-(BaseTable*)getTableWithTableName:(NSString*)tableName;
-(BaseTable*)deleteTableWithTableName:(NSString*)tableName;
@end
