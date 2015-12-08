//
//  NSObject+YunisFile.h
//  YunisCategory
//
//  Created by Yunis on 15/12/3.
//  Copyright © 2015年 yunis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YunisFile)
//获取
+(NSString *)getApplicationDocumentPath;
+(NSString *)getApplicationCachePath;
+(NSString *)getApplicationTempPath;

//获取
+(NSString *)getApplicationDocumentPathForFile:(NSString *)fileName;
+(NSString *)getApplicationCachePathForFile:(NSString *)fileName;
+(NSString *)getApplicationTempPathForFile:(NSString *)fileName;

+(BOOL)isFileExistingAtPath:(NSString *)filePath;

//保存
-(void)saveObjectInDocumentFile:(NSString *)fileName;
-(void)saveObjectInCacheFile:(NSString*)fileName;
-(void)saveObjectInTempFile:(NSString*)fileName;


//删除
+(void)removeDocumentFile:(NSString *)fileName;
+(void)removeCacheFile:(NSString *)fileName;
+(void)removeCacheFiles;
+(void)removeTempFile:(NSString *)fileName;
+(void)removeTempFiles;

//清空
+(void)emptyContentOfDocumentFile:(NSString *)fileName;
+(void)emptyContentOfCacheFile:(NSString *)fileName;
+(void)emptyContentOfTempFile:(NSString *)fileName;
@end
