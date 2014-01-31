//
//  LevelDataConverter.h
//  MCPTest
//
//  Created by Casper Eekhof on 30-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NBTKit.h"

@interface LevelDataConverter : NSObject

+(NSDictionary*)readLevelAtPath:(NSString*)path error:(NSError *__autoreleasing *)error;
+(void)writeLevel:(NSDictionary*)levelDict ToPath:(NSString*)path error:(NSError *__autoreleasing *)error;

@end
