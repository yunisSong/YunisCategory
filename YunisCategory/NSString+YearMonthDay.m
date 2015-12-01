//
//  NSString+YearMonthDay.m
//  YTX_NEW_CY
//
//  Created by 宋尚永 on 15/12/1.
//  Copyright © 2015年 yunis. All rights reserved.
//

#import "NSString+YearMonthDay.h"

@implementation NSString (YearMonthDay)
- (NSString *)YUNIS_YearStr
{
    return [self formattime:self withFormatType:YunisTimeFormatType_Year];
    return nil;
}
- (NSString *)YUNIS_MonthStr
{
    return [self formattime:self withFormatType:YunisTimeFormatType_MonthDay];
    return nil;
}
- (NSString *)YUNIS_HourStr
{
    return [self formattime:self withFormatType:YunisTimeFormatType_Hour];
    return nil;
}
- (NSDate*) convertDateFromString:(NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}
- (NSString *)formattime:(NSString *)str withFormatType:(YunisTimeFormatType)type
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (type) {
        case YunisTimeFormatType_Year: {
            [dateFormatter setDateFormat:@"yyyy年"];
            break;
        }
        case YunisTimeFormatType_MonthDay: {
            [dateFormatter setDateFormat:@"MM月dd日"];
            break;
        }
        case YunisTimeFormatType_Hour: {
            [dateFormatter setDateFormat:@"HH:mm:ss"];
            break;
        }
        default: {
            break;
        }
    }
    NSString *currentDateStr = [dateFormatter stringFromDate:[self convertDateFromString:str]];
    return currentDateStr;
}
@end
