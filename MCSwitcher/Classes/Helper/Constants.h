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

#endif
