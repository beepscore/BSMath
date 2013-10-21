//
//  BSMath.m
//  BSMath
//
//  Created by Steve Baker on 10/20/13.
//  Copyright (c) 2013 Beepscore LLC. All rights reserved.
//

#import "BSMath.h"

@implementation BSMath

+(NSUInteger)triangleNumber:(NSUInteger)anInt
               errorPointer:(NSError **)errorPointer
{
    if (anInt == 0) {
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
        [userInfo setValue:@"anInt equal 0" forKey:NSLocalizedDescriptionKey];
        *errorPointer = [NSError errorWithDomain:@"BSMath" code:1 userInfo:userInfo];
        return 0;
    }

    // If the argument is too big, the result will be too big for the type to hold
    // The result should be less than or equal to some system MAXIMUM, e.g. MAX_INT
    // result = n*(n+1)/2 <= MAXIMUM
    // n*(n+1) <= 2 * MAXIMUM
    // n^2 + n <= 2 * MAXIMUM
    // n^2 + n - (2 * MAXIMUM) <= 0

    // quadratic equation
    // http://mathworld.wolfram.com/QuadraticFormula.html
    // roots
    // x = (-b +/- sqrt(b^2 - 4ac)) / 2a

    // a = 1
    // b = 1
    // c = -(2 * MAXIMUM)

    // x = (-1 +/- sqrt(1 - 4c)) / 2
    // x = (-1 +/- sqrt(1 + (8*MAXIMUM))) / 2
    // discard negative root
    // x = (-1 + sqrt(1 + (8*MAXIMUM))) / 2
    // x = (-1/2) + (sqrt(1 + (8*MAXIMUM)) / 2)
    // Approximate to get close to answer.
    // Then in unit tests can empirically determine maximum value for input.
    // x_max approx = (sqrt(8*MAXIMUM) / 2)
    // x_max approx = (2*sqrt(2*MAXIMUM) / 2)
    // x_max approx = sqrt(2*MAXIMUM)
    // x_max approx = sqrt(2) * sqrt(MAXIMUM)

    // Empirically determined maximum input is 2**17 - 1 = 131071
    // (INT_MAX / 2**14) = (INT_MAX / 16384) = 131071
    if (anInt >= 131072) {
        NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
        [userInfo setValue:@"anInt too big, result would overflow" forKey:NSLocalizedDescriptionKey];
        *errorPointer = [NSError errorWithDomain:@"BSMath" code:2 userInfo:userInfo];
        return 0;
    }

    // As a boy Gauss famously calculated sum of 1..n by pairing numbers.
    // We could calculate the average value as (n + 1)/2 and multiply it by the number of elements n.
    // result = n*(n+1)/2
    // This is mathematically correct, but on a computer we must avoid some potential problems.
    // If the average ends in 0.5 and we use a floating point math, could get roundoff error e.g. 0.4998.

    // Instead of calculating average, pair the numbers.
    NSUInteger numPairs = anInt/2;
    NSUInteger pairSum = (anInt + 1);

    // If anInt is odd, we will have one unpaired value
    NSUInteger middleValue = 0;
    if (anInt % 2) {
        // anInt is odd
        middleValue = (anInt/2) + 1;
    }
    return ((numPairs * pairSum) + middleValue);
}

@end
