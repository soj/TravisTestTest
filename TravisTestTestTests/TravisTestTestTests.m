//
//  TravisTestTestTests.m
//  TravisTestTestTests
//
//  Created by Сергей on 13.12.13.
//  Copyright (c) 2013 Sergey Mingalev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "sDateTime.h"

@interface TravisTestTestTests : XCTestCase

@end

@implementation TravisTestTestTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTAssertNil(nil, @"Should be nil");
}

- (void)testJD
{
    sDateTime *sdatetime = [[sDateTime alloc] initWithDateString:@"01-01-2013 00:30:00 +0000"];
    double ttt = sdatetime.julianDay - 2456293.520833333;
    XCTAssertTrue(ttt < 0.000001,@"");
}

- (void)testTTime
{
    sDateTime *sdatetime = [[sDateTime alloc] initWithDateString:@"01-01-2013 00:30:00 +0000"];
    double ttt = sdatetime.timeT - 1.130007415012553;
    XCTAssertTrue(ttt < 0.00000000001,@"");
}

@end
