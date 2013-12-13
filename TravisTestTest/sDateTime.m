//
//  sDateTime.m
//  AstroFriends
//
//  Created by sergey on 14.04.10.
//  Copyright 2010 Sergey Mingalev. All rights reserved.
//

#import "sDateTime.h"

@implementation sDateTime

-(id) initWithDateString:(NSString*)sourceDate
{
	if (self = [super init]) {

        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

        [formatter setDateFormat:@"MM'-'dd'-'yyyy' 'HH':'mm':'ss' 'z"];
        [formatter setTimeZone:[NSTimeZone systemTimeZone]];

        NSDate *mydate = [formatter dateFromString:sourceDate];
        
        if (mydate != nil) {
            
            NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            
            NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit ;
            
            [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
            
            dateComponentsGMT = [gregorian components:unitFlags fromDate:mydate];
            
            [self calculateJDandT];
        }
	}
    
	return(self);
}

-(void) calculateJDandT
{
	int x,z;
	double y;
	
	int month = [dateComponentsGMT month];
	int year = [dateComponentsGMT year]; 
	
	if ( month<2 ) {  year--; month+=12; }
	
	x=year/100;
	z=2-x+x/4;
	y=([dateComponentsGMT hour]*60+[dateComponentsGMT minute])/1440.0;
	
	_julianDay = (int)(365.25*year)+(int)(30.6001*(month+1)) + [dateComponentsGMT day] + 1720994.5 + y + z;

	_timeT=(_julianDay-2415020.0)/36525.0;
}

@end;

