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

- (void)testTriangleNumbers
{
    NSArray *testValues = @[
                            @{@1: @1},
                            @{@2: @3},
                            @{@3: @6},
                            @{@4: @10},
                            @{@5: @15},
                            @{@10: @55},
                            ];

    for (NSDictionary *valueDict in testValues) {

        NSError *anError = nil;
        NSNumber *key = [[valueDict allKeys] firstObject];
        NSUInteger expectedResult = [valueDict[key] integerValue];

        NSUInteger keyValue = [key integerValue];
        NSUInteger actualResult = [BSMath triangleNumber:keyValue
                                            errorPointer:&anError];

        XCTAssertEqual(expectedResult, actualResult, @"");
        XCTAssertNil(anError, @"");
    }
}

- (void)testTriangleNumberAlmostTooBig
{
    // Check system defined constant equals what we think it equals
    // http://stackoverflow.com/questions/2107544/types-in-objective-c-on-iphone
    // max size varies by device e.g. 64 bit
    XCTAssertEqual(2147483647, INT_MAX, @"");

    NSUInteger bigInt = (NSUInteger)(sqrt(2) * sqrt(INT_MAX));

    // must cast type to get assertion to pass
    XCTAssertEqual((NSUInteger)65535, bigInt, @"");

    NSArray *testValues = @[
                            @{@65535: @2147450880},
                            @{@65536: @2147516416}
                            ];

    for (NSDictionary *valueDict in testValues) {

        NSError *anError = nil;
        NSNumber *key = [[valueDict allKeys] firstObject];
        NSUInteger expectedResult = (NSUInteger)[valueDict[key] integerValue];

        NSUInteger keyValue = (NSUInteger)[key integerValue];
        NSLog(@"anInt: %lu, expectedResult: %lu",
              (unsigned long)keyValue, (unsigned long)expectedResult);
        NSUInteger actualResult = [BSMath triangleNumber:keyValue
                                            errorPointer:&anError];

        XCTAssertEqual(expectedResult, actualResult, @"anInt: %lu", (unsigned long)keyValue);
        XCTAssertNil(anError, @"");
    }
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
