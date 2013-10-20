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

    // If the argument is too big, the result will be too big for the computer to hold
    // The result should be less than or equal to MAX_INT
    // TODO: If anInt is too big, set error


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
