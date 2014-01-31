//
//  EntityType.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    EntityType_CHICKEN = 10,
	EntityType_COW,
	EntityType_PIG,
	EntityType_SHEEP,
	EntityType_ZOMBIE = 32,
	EntityType_CREEPER,
	EntityType_SKELETON,
	EntityType_SPIDER,
	EntityType_PIG_ZOMBIE,
	EntityType_ITEM = 64,
	EntityType_PRIMED_TNT,
	EntityType_FALLING_BLOCK,
	EntityType_ARROW = 80,
	EntityType_SNOWBALL,
	EntityType_EGG,
	EntityType_PAINTING,
	EntityType_MINECART,
	EntityType_UNKNOWN = -1,
	EntityType_PLAYER = -2

} EntityType;