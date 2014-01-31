//
//  LivingEntity.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "Entity.h"

@interface LivingEntity : Entity

@property short attackTime;
@property short deathTime;
@property short hurtTime;

@property short health;

-(int)maxHealth;

@end
