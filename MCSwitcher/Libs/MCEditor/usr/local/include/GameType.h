//
//  GameType.h
//  MCSwitcher
//
//  Created by Casper Eekhof on 27-01-14.
//  Copyright (c) 2014 Redlake. All rights reserved.
//

#ifndef MCSwitcher_GameType_h
#define MCSwitcher_GameType_h

typedef enum {
    GameType_Survival = NO,
    GameType_Creative = !GameType_Survival
} GameType;


#endif
