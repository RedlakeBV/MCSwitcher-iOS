//
//  Projectile.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Entity.h"

@interface Projectile : Entity

@property short xTile;
@property short yTile;
@property short zTile;

@property BOOL inGround;
@property Byte shake;
@property Byte inTile;

@end
