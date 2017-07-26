//
//  BaseTable.m
//  IOS_HuaDian
//
//  Created by zhangx on 2017/7/7.
//  Copyright © 2017年 zhangx. All rights reserved.
//

#import "BaseTable.h"
#import <objc/runtime.h>

@implementation BaseTable
-(void)initTable:(FMDatabase *)db
{
    self.db = db;
}
-(void)createTable
{
    
}
-(id)selectTableWithConfition:(id)confition
{
    return nil;
}
-(id)selectCategoryTableWithConfition:(id)confition
{
    return nil;
}
-(id)deleteTableWithConfition:(id)confition
{
    return nil;
}
-(id)updateTableWithConfition:(id)confition
{
    return nil;
}
-(id)insertTableWithConfition:(id)confition
{
    return nil;
}
-(BOOL)executeUpdate:(NSString *)sql
{
    BOOL result = NO;
    if ([self.db open]) {
        result = [self.db executeUpdate:sql];
    }
    return  result;
}
-(FMResultSet*)executeQuery:(NSString *)sql
{
    FMResultSet * result = [[FMResultSet alloc] init];
    if ([self.db open]) {
        result = [self.db executeQuery:sql];
    }
    return result;
}
-(FMResultSet*)executeUpdate:(NSString *)sql withArgumentsInArray:(NSArray *)arguments
{
    FMResultSet * results = nil;
    if ([self.db open]) {
        [self.db executeUpdate:sql withArgumentsInArray:arguments];
    }
    return results;
}
-(void)clearTable
{
    NSString * sql = [self serializeClearSql];
    [self executeUpdate:sql];
    [self closeDB];
}
-(NSArray*)getProperties:(Class)clazz
{
    NSMutableArray * array = [NSMutableArray array];
    NSMutableArray * names = [NSMutableArray array];
    NSMutableArray * attributes = [NSMutableArray array];
    unsigned int propertyCount = 0;
    objc_property_t * properties = class_copyPropertyList([clazz class], &propertyCount);
    for (unsigned int i=0; i<propertyCount; i++) {
        objc_property_t property = properties[i];
        const char * name = property_getName(property);
        const char * attribute = property_getAttributes(property);
        NSString * id_name = [NSString stringWithUTF8String:name];
        NSString * id_attribute = [NSString stringWithUTF8String:attribute];
        [names addObject:id_name];
        [attributes addObject:id_attribute];
    }
    [array addObject:names];
    [array addObject:attributes];
    return array;
}
-(NSString*)serializeCreateSqlWithClass:(Class)clazz
{
    NSString * table_name = NSStringFromClass(self.class);
    NSArray * temps = [self getProperties:clazz];
    NSArray * array = temps[0];
    NSString * properties = [NSString string];
    NSInteger count = array.count;
    for (uint i =0; i<count; i++) {
        NSString * value = [array objectAtIndex:i];
        NSString * property_format = i==count-1?@"%@ text":@"%@ text,";
        properties = [properties stringByAppendingFormat:property_format,value];
    }
    NSString * sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@)",table_name,properties];
    return sql;
}
-(NSArray *)serializeInsertSqlWithValue:(id)vo
{
    Class clazz = [vo class];
    NSArray * temps = [self getProperties:clazz];
    NSArray * array = temps[0];
    NSString * table_name = NSStringFromClass(self.class);
    NSString * properties = [NSString string];
    NSString * values = [NSString string];
    NSMutableArray * vo_values = [NSMutableArray array];
    NSInteger count = array.count;
    for (uint i =0; i<count; i++) {
        NSString * value = [array objectAtIndex:i];
        id vo_value = [vo valueForKey:value];
        if (vo_value==nil) {
            vo_value = @"null";
        }
        [vo_values addObject:vo_value];
        NSString * property_format = i==count-1?@"%@":@"%@,";
        values = [values stringByAppendingFormat:property_format,@"?"];
        properties = [properties stringByAppendingFormat:property_format,value];
    }
    NSString * sql = [NSString stringWithFormat:@"insert into %@ (%@) values (%@)",table_name,properties,values];
    NSArray * results = [NSArray arrayWithObjects:sql,vo_values, nil];
    return results;
    
}
-(NSString*)serializeUpdateSqlWithValue:(id)vo withUnique:(NSString *)unique
{
    Class clazz = [vo class];
    NSArray * temps = [self getProperties:clazz];
    NSArray * array = temps[0];
    NSString * table_name = NSStringFromClass(self.class);
    NSString * properties = [NSString string];
    id unique_value = nil;
    NSInteger count = array.count;
    for (uint i =0; i<count; i++) {
        NSString * value = [array objectAtIndex:i];
        id vo_value = [vo valueForKey:value];
        if (vo_value==nil) {
            vo_value = @"null";
        }
        if ([value isEqualToString:unique]) {
            unique_value = vo_value;
        }else
        {
            NSString * property_format = i==count-1?@"%@ = '%@'":@"%@ = '%@' , ";
            properties = [properties stringByAppendingFormat:property_format,value,vo_value];
        }
        
    }
    NSString * sql = [NSString stringWithFormat:@"update %@ set %@ where %@ = %@",table_name,properties,unique,unique_value];
    return sql;
}
-(NSString *)serializeSelectSqlWithValue:(id)value withUnique:(NSString *)unique
{
    NSString * table_name = NSStringFromClass(self.class);
    NSString * sql = [NSString string];
    if (value==nil) {
        sql = [NSString stringWithFormat:@"select * from %@",table_name];
    }else
    {
        sql = [NSString stringWithFormat:@"select * from %@ where %@ = '%@'",table_name,unique,value];
    }
    
    return sql;
}
-(NSString*)serializeDeleteSqlWithValue:(id)vo withUnique:(NSString *)unique
{
    Class clazz = [vo class];
    NSArray * temps = [self getProperties:clazz];
    NSArray * array = temps[0];
    NSString * table_name = NSStringFromClass(self.class);
    id unique_value = nil;
    NSInteger count = array.count;
    for (uint i =0; i<count; i++) {
        NSString * value = [array objectAtIndex:i];
        id vo_value = [vo valueForKey:value];
        if ([value isEqualToString:unique]) {
            unique_value = vo_value;
        }
    }
    NSString *sql = [NSString stringWithFormat:@"delete from %@ where %@ = %@",table_name,unique,unique_value];
    return sql;
}
-(NSString*)serializeClearSql
{
    NSString * table_name = NSStringFromClass(self.class);
    NSString * sql = [NSString stringWithFormat:@"delete from %@",table_name];
    return sql;
}
-(id)serializeFMResultSet2VO:(FMResultSet *)set withClass:(Class)clazz
{
    id vo = [[clazz alloc] init];
    NSArray * temps = [self getProperties:clazz];
    NSArray * array = temps[0];
    NSInteger count = array.count;
    for (uint i =0; i<count; i++) {
        NSString * value = [array objectAtIndex:i];
        id vo_value = [set stringForColumn:value];
        [vo setValue:vo_value forKey:value];
    }
    return vo;
}
-(void)closeDB
{
    if (self.db) {
        [self.db close];
    }
}
@end
