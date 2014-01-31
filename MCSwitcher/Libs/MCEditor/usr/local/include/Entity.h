//
//  Entity.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vector3f.h"
#import "EntityType.h"

@interface Entity : NSObject

@property Vector3f * location;
@property float pitch;
@property float yaw;
@property Vector3f * motion;
@property float fallDistance;
@property short fire;
@property short air;
@property BOOL onGround;
@property Entity * riding;
@property (nonatomic) EntityType entityType;

@end
