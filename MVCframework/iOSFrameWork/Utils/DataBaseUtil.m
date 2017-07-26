//
//  DataBaseUtil.m
//  IOS_HuaDian
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "DataBaseUtil.h"
@implementation DataBaseUtil
{
    FMDatabase * database;
}
+(DataBaseUtil*)shareInstance
{
    static DataBaseUtil * instance = nil;
    static dispatch_once_t oneToken;
    if (!instance) {
        dispatch_once(&oneToken, ^{
            instance = [[DataBaseUtil alloc] init];
            instance.dic = [NSMutableDictionary dictionary];
        });
    }
    return instance;
}
-(void)createDataBase:(NSString *)db_name WithBlock:(void (^)())initTables
{
    NSString * db_path = [NSString stringWithFormat:@"%@/Library/Caches/%@",NSHomeDirectory(),db_name];
    database = [[FMDatabase alloc] initWithPath:db_path];
    if ([database open]) {
        if (initTables) {
            initTables();
        }
    }else
    {
        NSLog(@"db创建失败!");
    }
}
-(void)createTableWithTableName:(Class)clazz
{
    NSString * tableName = NSStringFromClass(clazz);
    BaseTable * bt = [clazz alloc];
    [bt initTable:database];
    [bt createTable];
    [self.dic setValue:bt forKey:tableName];
    NSLog(@"%@表创建成功",tableName);
}
-(id)insertTableName:(Class)clazz withConfition:(id)confition
{
    BaseTable * bt = [self getTableWithClass:clazz];
    return [bt insertTableWithConfition:confition];
}
-(id)selectDatasWithTableName:(Class)clazz withConfition:(id)confition
{
    BaseTable * bt = [self getTableWithClass:clazz];
    return [bt selectTableWithConfition:confition];
}
-(id)selectCategoryDatasWithTableName:(Class)clazz withConfition:(id)confition
{
    BaseTable * bt = [self getTableWithClass:clazz];
    return [bt selectCategoryTableWithConfition:confition];
}
-(id)deleteDataTableName:(Class)clazz withConfition:(id)confition
{
    BaseTable * bt = [self getTableWithClass:clazz];
    return [bt deleteTableWithConfition:confition];
}
-(id)updateDataTableName:(Class)clazz withConfition:(id)confition
{
     BaseTable * bt = [self getTableWithClass:clazz];
    return [bt updateTableWithConfition:confition];
}
-(void)clearDatabase
{
    for (NSString * tableName in self.dic) {
        BaseTable * bt = [self getTableWithTableName:tableName];
        [bt clearTable];
    }
}
-(BaseTable*)getTableWithTableName:(NSString *)tableName
{
    BaseTable * bt = [self.dic objectForKey:tableName];
    return bt;
}
-(BaseTable*)deleteTableWithTableName:(NSString *)tableName
{
    BaseTable * bt = [self getTableWithTableName:tableName];
    if (bt) {
        //[self.dic delete:bt];
    }
    return bt;
}
-(BaseTable *)getTableWithClass:(Class)clazz
{
    NSString * tableName = NSStringFromClass(clazz);
    BaseTable * bt = [self getTableWithTableName:tableName];
    return bt;
}
@end
