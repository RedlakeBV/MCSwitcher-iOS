//
//  Level.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameType.h"
#import "Player.h"
#import "Vector3f.h"
#import "DictionaryConverter.h"

@interface Level : NSObject <DictionaryConverter>

@property (nonatomic) GameType gameType;
@property long lastPlayed;
@property NSString * levelName;
@property int platform;
@property Player * player;
@property long randomSeed;
@property long sizeOnDisk;
@property Vector3f * spawnPosition;
@property int storageVersion;
@property long time;
@property long dayCycleStopTime;
@property BOOL spawnMobs;
@property NSArray * entities;
@property NSArray * tileEntities;
@property NSString * rootDirectory;


@property NSDictionary * rawLevelDictionary;

@end
