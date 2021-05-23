#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {

    NSArray *arrayOfMonths = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September",
                               @"October", @"November", @"December"];

    if (monthNumber > 0 && monthNumber < 13) {
        NSString *answer = arrayOfMonths[monthNumber-1];
        return answer;
    } else {
        return nil;
    }
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {

    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

    NSDate *dateFromString = [formatter dateFromString:date];

    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * dateComponents = [calendar components: NSCalendarUnitDay | NSCalendarUnitWeekday fromDate: dateFromString];

    return (long)dateComponents.day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {

    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * dateComponents = [calendar components: NSCalendarUnitDay | NSCalendarUnitWeekday fromDate: date];

    if (dateComponents == nil) {
        return nil;
    }

    calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    return calendar.shortWeekdaySymbols[dateComponents.weekday -1];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {

    NSCalendar *myCalendar = [NSCalendar currentCalendar];

    NSInteger dateOfTheWeek = [myCalendar component:NSCalendarUnitWeekOfYear fromDate:date];
    NSInteger currentWeek = [myCalendar component:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];

    if (dateOfTheWeek == currentWeek) {
        return YES;
    } else {
        return NO;
    }
}

@end
