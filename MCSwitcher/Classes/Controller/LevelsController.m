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
BOOL noMCPE;

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
        noMCPE = NO;
        if(![DEFAULTS objectForKey: kMinecraftLoc]) {
            NSError * error;
            NSString * path = [LevelsController findMinecraftLocation:&error];
            if(path) {
                [DEFAULTS setObject:path forKey:kMinecraftLoc];
                [DEFAULTS setObject:[NSString stringWithFormat:@"%@/%@", [DEFAULTS objectForKey:kMinecraftLoc],
                                     microPathMCWorlds] forKey:kMinecraftWorldsLoc];
            } else {
                noMCPE = YES;
            }
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


-(NSArray*)loadLevels:(FailBlock)failBlock {
    if(![DEFAULTS objectForKey: kMinecraftLoc]) {
        NSError * err = [NSError errorWithDomain:@"LevelsController" code:-1 userInfo:@{@"error" : @"Minecraft not installed"}];
        if(noMCPE) {
            failBlock(err);
        }
       
        
        return nil; // No minecraft or not jailbroken
    }
    NSMutableArray * levels = [[NSMutableArray alloc] init];
    
    NSError * error;
    NSInteger counter = 0;
    NSArray * levelDirNames = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[DEFAULTS objectForKey:kMinecraftWorldsLoc] error:&error];
    for(NSString * levelDirName in levelDirNames){
        if([levelDirName hasPrefix:@"_"]) continue;
        NSString * levelFileDirPath = [NSString stringWithFormat:@"%@/%@%@", [DEFAULTS objectForKey:kMinecraftWorldsLoc], levelDirName, @"/level.dat"] ;
        Level * level = [LevelDataConverter readLevelAtPath:levelFileDirPath error:&error];
        if(level){
            [level setRootDirectory: [NSString stringWithFormat:@"%@%@", [DEFAULTS objectForKey:kMinecraftWorldsLoc], levelDirName]];
            [levels addObject: level];
        }
        
        if(counter != [levelDirNames count] -1)
        error = nil; // Only respond to general issues
        counter++;
        
        if(error)
            failBlock(error);
    }
    
    return levels;
}

-(void)toggleMode:(Level*) level error:(NSError **)error {
    [level setGameType: ![level gameType]];
    [[[level player] abilities] setGameType: [level gameType]];
    NSString * levelPath = [NSString stringWithFormat:@"%@/%@", [level rootDirectory], @"level.dat"];
    [LevelDataConverter writeLevel:level ToPath:levelPath error:error];
}

-(Level*)toggleModeForLevelAtPath:(NSString*) level {
    return nil;
}


@end
