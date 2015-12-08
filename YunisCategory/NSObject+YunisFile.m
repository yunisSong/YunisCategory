//
//  NSObject+YunisFile.m
//  YunisCategory
//
//  Created by Yunis on 15/12/3.
//  Copyright © 2015年 yunis. All rights reserved.
//

#import "NSObject+YunisFile.h"
static NSString *Yunis_NSObject_File_application_cache_folder_path = nil;
static NSString *Yunis_NSObject_File_application_temp_folder_path = nil;
static NSString *Yunis_NSObject_File_application_document_folder_path = nil;

@implementation NSObject (YunisFile)

#pragma mark - Folder paths access
+(NSString *)getApplicationDocumentPath
{
    if (Yunis_NSObject_File_application_document_folder_path == nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        Yunis_NSObject_File_application_document_folder_path = paths[0];
    }
    return Yunis_NSObject_File_application_document_folder_path;
}

+(NSString *)getApplicationCachePath
{
    if (Yunis_NSObject_File_application_cache_folder_path == nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        Yunis_NSObject_File_application_cache_folder_path = paths[0];
    }
    return Yunis_NSObject_File_application_cache_folder_path;
}

+(NSString *)getApplicationTempPath
{
    if (Yunis_NSObject_File_application_temp_folder_path == nil)
    {
        NSString *tmpDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        tmpDir = [[tmpDir stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"tmp"];
        Yunis_NSObject_File_application_temp_folder_path = tmpDir;
    }
    return Yunis_NSObject_File_application_temp_folder_path;
}

#pragma mark -Document/
+(NSString *)getApplicationDocumentPathForFile:(NSString *)fileName
{
    return [[NSObject getApplicationDocumentPath] stringByAppendingPathComponent:fileName];
}

#pragma mark -Cache/
+(NSString *)getApplicationCachePathForFile:(NSString *)fileName
{
    return [[NSObject getApplicationCachePath] stringByAppendingPathComponent:fileName];}

#pragma mark -Temp/
+(NSString *)getApplicationTempPathForFile:(NSString *)fileName
{
    return [[NSObject getApplicationTempPath] stringByAppendingPathComponent:fileName];
}

+(BOOL)isFileExistingAtPath:(NSString *)filePath
{
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}


#pragma mark - Save objects in files

-(void)saveObjectInFileAtPath:(NSString *)filePath
{
    [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}

#pragma mark -Document/
-(void)saveObjectInDocumentFile:(NSString *)fileName
{
    [self saveObjectInFileAtPath:[NSObject getApplicationDocumentPathForFile:fileName]];
}

#pragma mark -Cache/
-(void)saveObjectInCacheFile:(NSString*)fileName
{
    [self saveObjectInFileAtPath:[NSObject getApplicationCachePathForFile:fileName]];
}

#pragma mark -Temp/
-(void)saveObjectInTempFile:(NSString*)fileName
{
    [self saveObjectInFileAtPath:[NSObject getApplicationTempPathForFile:fileName]];
}






+(void)removeFileAtPath:(NSString *)filePath
{
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

#pragma mark -Document/
+(void)removeDocumentFile:(NSString *)fileName
{
    [NSObject removeFileAtPath:[NSObject getApplicationDocumentPathForFile:fileName]];
}

#pragma mark -Cache/
+(void)removeCacheFile:(NSString *)fileName
{
    [NSObject removeFileAtPath:[NSObject getApplicationCachePathForFile:fileName]];
}

+(void)removeCacheFiles
{
    NSError *error;
    NSArray* tmpDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSObject getApplicationCachePath] error:&error];
    if (!error)
    {
        for (NSString *file in tmpDirectory)
            [NSObject removeCacheFile:file];
    }
    else
    {
        NSLog(@"[%@] Error accessing cache directory: %@", NSStringFromClass([self class]), [error description]);
    }
}

#pragma mark -Temp/
+(void)removeTempFile:(NSString *)fileName
{
    [NSObject removeFileAtPath:[NSObject getApplicationTempPathForFile:fileName]];
}

+(void)removeTempFiles
{
    NSError *error;
    NSArray* tmpDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSObject getApplicationTempPath] error:&error];
    if (!error)
    {
        for (NSString *file in tmpDirectory)
            [NSObject removeTempFile:file];
    }
    else
    {
        NSLog(@"[%@] Error accessing temporary directory: %@", NSStringFromClass([self class]), [error description]);
    }
}




+(void)emptyContentOfFilePath:(NSString *)filePath
{
    [NSKeyedArchiver archiveRootObject:@"" toFile:filePath];
}

#pragma mark -Document/
+(void)emptyContentOfDocumentFile:(NSString *)fileName
{
    [self emptyContentOfFilePath:[NSObject getApplicationDocumentPathForFile:fileName]];
}

#pragma mark -Cache/
+(void)emptyContentOfCacheFile:(NSString *)fileName
{
    [self emptyContentOfFilePath:[NSObject getApplicationCachePathForFile:fileName]];
}

#pragma mark -Temp/
+(void)emptyContentOfTempFile:(NSString *)fileName
{
    [self emptyContentOfFilePath:[NSObject getApplicationTempPathForFile:fileName]];
}
@end
