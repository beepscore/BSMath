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

- (void)testTriangleNumberOne
{
    NSUInteger expectedResult = 1;

    NSError *anError = nil;
    NSUInteger actualResult = [BSMath triangleNumber:1 errorPointer:&anError];

    XCTAssertEqual(expectedResult, actualResult, @"");
    XCTAssertNil(anError, @"");
}

- (void)testTriangleNumberTwo
{
    NSUInteger expectedResult = 3;

    NSError *anError = nil;
    NSUInteger actualResult = [BSMath triangleNumber:2 errorPointer:&anError];

    XCTAssertEqual(expectedResult, actualResult, @"");
    XCTAssertNil(anError, @"");
}

- (void)testTriangleNumberZero
{
    NSUInteger expectedResult = 0;

    NSError *anError = nil;
    NSUInteger actualResult = [BSMath triangleNumber:0 errorPointer:&anError];

    XCTAssertEqual(expectedResult, actualResult, @"");

    // test anError
    XCTAssertNotNil(anError, @"expected anError not nil");
    XCTAssertEqualObjects(@"BSMath", anError.domain, @"");
    XCTAssertEqual(1, anError.code, @"");
    XCTAssertEqualObjects(@"anInt equal 0", anError.userInfo[NSLocalizedDescriptionKey], @"");
}

@end
