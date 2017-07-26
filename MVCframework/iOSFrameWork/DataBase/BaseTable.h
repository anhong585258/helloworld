//
//  BaseTable.h
//  IOS_HuaDian
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@interface BaseTable : NSObject
@property (strong,nonatomic) FMDatabase * db;
-(void)initTable:(FMDatabase*)db;
-(void)createTable;
-(id)selectTableWithConfition:(id)confition;
-(id)selectCategoryTableWithConfition:(id)confition;
-(id)deleteTableWithConfition:(id)confition;
-(id)updateTableWithConfition:(id)confition;
-(id)insertTableWithConfition:(id)confition;
-(void)clearTable;
-(BOOL)executeUpdate:(NSString*)sql;
-(FMResultSet*)executeQuery:(NSString*)sql;
-(FMResultSet*)executeUpdate:(NSString *)sql withArgumentsInArray:(NSArray *)arguments;
-(NSArray*)getProperties:(Class)clazz;
-(NSString *)serializeCreateSqlWithClass:(Class)clazz;
-(NSArray *)serializeInsertSqlWithValue:(id)vo;
-(NSString *)serializeUpdateSqlWithValue:(id)vo withUnique:(NSString*)unique;
-(NSString *)serializeDeleteSqlWithValue:(id)vo withUnique:(NSString*)unique;
-(NSString *)serializeClearSql;
-(NSString *)serializeSelectSqlWithValue:(id)value withUnique:(NSString*)unique;
-(id)serializeFMResultSet2VO:(FMResultSet*)set withClass:(Class)clazz;
-(void)closeDB;
@end
