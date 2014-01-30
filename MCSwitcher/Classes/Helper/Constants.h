//
//  Constants.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#ifndef MCSwitcher_Constants_h
#define MCSwitcher_Constants_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define font_kc_med(fSize) [UIFont fontWithName:@"KeepCalm-Medium" size:fSize]
#define DEFAULTS [NSUserDefaults standardUserDefaults]
#define kMinecraftLoc @"minecraft_loc"
#define kMinecraftWorldsLoc @"minecraft_worlds_loc"
#define microPathMCWorlds @"Documents/games/com.mojang/minecraftWorlds/"

#define USING_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define USING_IPHONE4 (([[UIScreen mainScreen] bounds].size.height-480)?NO:YES)

#define USING_iOS7 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")
#define USING_iOS6 (SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(@"6.1.4") && SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6"))

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#endif
