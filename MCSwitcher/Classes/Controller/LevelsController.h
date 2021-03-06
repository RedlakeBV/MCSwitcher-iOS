//
//  LevelsController.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 30-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"

@interface LevelsController : NSObject

+(id)shared;

typedef void (^FailBlock)(NSError* error);

-(NSArray*)loadLevels:(FailBlock)error;
-(void)toggleMode:(Level*) level error:(NSError **)error;
-(BOOL)toggleModeAtPath:(NSString*) path error:(NSError **)error;
+(NSString*)findMinecraftLocation:(NSError **)error;

@end
