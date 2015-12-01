//
//  NSString+YearMonthDay.h
//  YTX_NEW_CY
//
//  Created by 宋尚永 on 15/12/1.
//  Copyright © 2015年 yunis. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,YunisTimeFormatType) {
    YunisTimeFormatType_Year,
    YunisTimeFormatType_MonthDay,
    YunisTimeFormatType_Hour,
};
@interface NSString (YearMonthDay)
- (NSString *)YUNIS_YearStr;
- (NSString *)YUNIS_MonthStr;
- (NSString *)YUNIS_HourStr;
@end
