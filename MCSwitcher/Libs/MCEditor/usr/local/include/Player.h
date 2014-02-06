//
//  Player.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "LivingEntity.h"
#import "PlayerAbilities.h"
#import "DictionaryConverter.h"
#import "Vector3f.h"

@interface Player : LivingEntity <DictionaryConverter>

@property NSArray * inventory;
@property int score;
@property int dimension;
@property Vector3f * bedPosition;
@property Vector3f * spawnPosition;
@property short sleepTimer;
@property BOOL sleeping;
@property NSArray * armorSlots;
@property PlayerAbilities * abilities;

@property NSDictionary * playerDictionary;

@end
