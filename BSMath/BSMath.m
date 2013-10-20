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
    return 1;
}

@end
