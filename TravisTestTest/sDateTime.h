//
//  sDateTime.h
//  AstroFriends
//
//  Created by sergey on 14.04.10.
//  Copyright 2010 Sergey Mingalev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface sDateTime : NSObject {
	NSDate *originalDate;
	NSDate *dateGMT;
	NSDateComponents *dateComponentsGMT;
	NSTimeZone *timeZone;
}

@property (nonatomic,readonly) double julianDay;
@property (nonatomic,readonly) double timeT;

-(id) initWithDateString:(NSString*)sourceDate;
-(void)calculateJDandT;

@end
