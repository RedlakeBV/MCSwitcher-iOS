//
//  LevelDataConverter.h
//  MCEditor
//
//  Created by Casper Eekhof on 28-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Level.h"

@interface LevelDataConverter : NSObject

extern Byte header[];

+(Level*) read:(NSString*)filePath;
+(void) write:(Level*)level withFileHandle:(NSString*)filePath;

@end
