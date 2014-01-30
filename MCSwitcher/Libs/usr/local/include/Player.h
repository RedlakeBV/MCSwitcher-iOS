//
//  Player.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "LivingEntity.h"
#import "PlayerAbilities.h"

@interface Player : LivingEntity

@property NSArray * inventory;
@property NSInteger score;
@property NSInteger dimension;
@property NSInteger bedPositionX, bedPositionY, bedPositionZ;
@property NSInteger spawnX, spawnY, spawnZ;
@property short sleepTimer;
@property BOOL sleeping;
@property NSArray * armorSlots;
@property PlayerAbilities * abilities;

@end
