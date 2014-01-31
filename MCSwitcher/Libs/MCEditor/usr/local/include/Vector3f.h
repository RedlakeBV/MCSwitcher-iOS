//
//  Vector3f.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vector3f : NSObject

@property (nonatomic) float blockX;
@property (nonatomic) float blockY;
@property (nonatomic) float blockZ;

/* Calculates the distance between blocks and returns the value. */
-(double) distSquared:(Vector3f*)other;

- (id)initWithX:(float)x Y:(float)y Z:(float)z;

@end
