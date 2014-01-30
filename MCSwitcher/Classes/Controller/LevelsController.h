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

-(NSArray*)loadLevels:(NSError **)error;
-(void)toggleMode:(Level*) level error:(NSError **)error;
+(NSString*)findMinecraftLocation:(NSError **)error;

@end
