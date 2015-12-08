//
//  NSString+YearMonthDay.h
//  YTX_NEW_CY
//
//  Created by Yunis on 15/12/1.
//  Copyright © 2015年 yunis. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,YunisTimeFormatType) {
    YunisTimeFormatType_Year,
    YunisTimeFormatType_MonthDay,
    YunisTimeFormatType_Hour,
};
@interface NSString (YearMonthDay)
/*!
 *  @author Yunis_song, 15-12-03 14:12:05
 *
 *  @brief  年
 *
 *  @return eg：2015年
 */
- (NSString *)YUNIS_YearStr;
/*!
 *  @author Yunis_song, 15-12-03 14:12:39
 *
 *  @brief  月日
 *
 *  @return eg:07月28日
 */
- (NSString *)YUNIS_MonthStr;
/*!
 *  @author Yunis_song, 15-12-03 14:12:41
 *
 *  @brief  时分秒
 *
 *  @return eg：18：24：38
 */
- (NSString *)YUNIS_HourStr;
@end
