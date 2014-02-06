//
//  LevelDataConverter.h
//  MCPTest
//
//  Created by Casper Eekhof on 30-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NBTKit.h"
#import "Level.h"

@interface LevelDataConverter : NSObject

+(Level*)readLevelAtPath:(NSString*)path error:(NSError *__autoreleasing *)error;
+(void)writeLevel:(Level*)level ToPath:(NSString*)path error:(NSError *__autoreleasing *)error;

+(NSDictionary*)readLevelDictionaryAtPath:(NSString*)path error:(NSError *__autoreleasing *)error;
+(void)writeLevelDictionary:(NSDictionary*)level ToPath:(NSString*)path error:(NSError *__autoreleasing *)error;

@end
