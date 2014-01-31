//
//  Painting.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Entity.h"
#import "Vector3f.h"

@interface Painting : Entity

@property Vector3f * blockCoordinates;
@property NSString * artType;
@property Byte direction;

@end
