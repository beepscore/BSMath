//
//  BSMath.h
//  BSMath
//
//  Created by Steve Baker on 10/20/13.
//  Copyright (c) 2013 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSMath : NSObject

/**
 Triangle number of n is number of "dots" needed to fill an equilateral triangle of side n.
 Equals sum of natural numbers from 1 to n.

 References:
 https://en.wikipedia.org/wiki/Triangular_number
 http://www.cimgf.com/2008/04/04/cocoa-tutorial-using-nserror-to-great-effect/

 Example usage
     NSError *myError = nil;
     NSUInteger result = [BSMath triangleNumber:myInt errorPointer:&myError];

 After call, check myError to see if result is valid
     if (myError) {
     // result isn't valid, can log error info
     } else {
        NSUInteger myValidResult = result;
     }

 @param triangleNumber is an NSUInteger
 If it is 0 the method returns 0 and sets an error.
 If it is greater than or equal to 2**17 = 131072 the method returns 0 and sets an error.
 The result would be larger than type NSUInteger could hold.

 @param errorPointer is type NSError **, the address of an NSError object
 if the method encounters an error, it can dereference &myError to set myError

 @return a triangleNumber
 */
+(NSUInteger)triangleNumber:(NSUInteger)anInt errorPointer:(NSError **)errorPointer;

@end
