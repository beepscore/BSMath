//
//  BSMathTests.m
//  BSMathTests
//
//  Created by Steve Baker on 10/20/13.
//  Copyright (c) 2013 Beepscore LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BSMath.h"

@interface BSMathTests : XCTestCase

@end

@implementation BSMathTests

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

- (void)testTriangleNumber
{
    NSUInteger expectedResult = 1;
    NSUInteger actualResult = [BSMath triangleNumber:1 errorPointer:nil];
    XCTAssertEqual(expectedResult, actualResult, @"");
}

@end
