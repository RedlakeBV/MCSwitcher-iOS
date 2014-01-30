//
//  PlayerAbilities.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameType.h"

@interface PlayerAbilities : NSObject

@property BOOL mayFly;
@property BOOL flying;
@property BOOL instabuild;
@property BOOL invulnerable;


-(id)initWithGameType:(GameType)gameType;
-(void)setGameType:(GameType)gameType;


@end
