//
//  LevelsController.m
//  MCSwitcher
//
//  Created by Casper Eekhof on 30-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#import "LevelsController.h"
#import "LevelDataConverter.h"

@implementation LevelsController


+(id)shared {
    static id sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        if(![DEFAULTS objectForKey: kMinecraftLoc]) {
            NSError * error;
            [DEFAULTS setObject:[LevelsController findMinecraftLocation:&error] forKey:kMinecraftLoc];
            [DEFAULTS setObject:[NSString stringWithFormat:@"%@/%@", [DEFAULTS objectForKey:kMinecraftLoc],
                                 microPathMCWorlds] forKey:kMinecraftWorldsLoc];
        }
    }
    return self;
}

+(NSString*)findMinecraftLocation:(NSError **)error {
    NSString * applicationsDir = @"/User/Applications/";
    NSArray * directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:applicationsDir error:error];
    
    NSArray * appDirContents;
    for(NSString * dirName in directoryContents){
        NSString * appPath = [NSString stringWithFormat:@"%@%@", applicationsDir, dirName];
        appDirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:appPath error:error];
        if([appDirContents containsObject:@"minecraftpe.app"]) {
            return appPath;
        }
    }

    return nil;
}

+(BOOL)hasInstalledMCPE {
    return ([LevelsController findMinecraftLocation:nil] ? YES : NO);
}


-(NSArray*)loadLevels:(NSError **)error {
    if(![DEFAULTS objectForKey: kMinecraftLoc]) {
        return nil; // No minecraft or not jailbroken
    }
    NSMutableArray * levels = [[NSMutableArray alloc] init];

    NSLog(@"%@", [DEFAULTS objectForKey:kMinecraftWorldsLoc]);
    NSInteger counter = 0;
    NSArray * levelDirNames = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[DEFAULTS objectForKey:kMinecraftWorldsLoc] error:error];
    for(NSString * levelDirName in levelDirNames){
        if([levelDirName hasPrefix:@"_"]) continue;
        NSString * levelFileDirPath = [NSString stringWithFormat:@"%@/%@%@", [DEFAULTS objectForKey:kMinecraftWorldsLoc], levelDirName, @"/level.dat"] ;
        Level * level = [[Level alloc] initWithDictionary:[LevelDataConverter readLevelAtPath:levelFileDirPath error:error]];
        if(level){
            [levels addObject: level];
        }
        
        if(counter != [levelDirNames count] -1)
            error = nil; // Only respond to general issues
        counter++;
    }
    
    return levels;
}

-(Level*)toggleMode:(Level*) level; {
    return nil;
}

-(Level*)toggleModeForLevelAtPath:(NSString*) level {
    return nil;
}


@end
